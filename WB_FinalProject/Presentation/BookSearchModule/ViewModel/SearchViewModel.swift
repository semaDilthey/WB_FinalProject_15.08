//
//  SearchViewModel.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import Foundation
import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var isLoading: Bool = false
    @Published var hasMoreBooks: Bool = true
    
    private var currentPage = 0
    private let pageSize = 10
    private var searchQuery = ""
    
    private let networkService = AlomofireService(baseURL: "https://openlibrary.org")
    private var cancellables = Set<AnyCancellable>()
    
    func searchBooks(query: String) {
        self.searchQuery = query
        self.currentPage = 0
        self.books = []
        self.hasMoreBooks = true
        loadMoreBooks()
    }
    
    func loadMoreBooks() {
        guard !isLoading, hasMoreBooks else { return }
        
        isLoading = true
        let parameters: [String: Any] = [
            "q": searchQuery,
            "start": currentPage * pageSize,
            "limit": pageSize
        ]
        
        networkService.fetch(endpoint: "/search.json", parameters: parameters, responseType: SearchResponse.self)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                    self.hasMoreBooks = false
                }
            }, receiveValue: { [weak self] searchResponse in
                guard let self = self else { return }
                self.books.append(contentsOf: searchResponse.docs)
                self.currentPage += 1
                self.hasMoreBooks = searchResponse.docs.count == self.pageSize
            })
            .store(in: &cancellables)
    }
}
