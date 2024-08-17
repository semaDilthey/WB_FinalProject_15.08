//
//  SearchViewModel.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI
import Combine

enum SearchState {
    case begin, loading, result, noResult
}

final class SearchViewModel: ObservableObject {
    @Published var books: [BookResponse] = []
    @Published var hasMoreBooks: Bool = true
    
    @Published var state: SearchState = .begin
    
    @Published var query = ""
    
    private var currentPage = 0
    private let pageSize = 10
    
    private let networkService = AlomofireService(baseURL: "https://openlibrary.org")
    private var cancellables = Set<AnyCancellable>()
    
    func searchBooks(query: String) {
        self.currentPage = 0
        self.books = []
        self.hasMoreBooks = true
        loadMoreBooks()
    }
    
    func loadMoreBooks() {
        guard state != .loading, hasMoreBooks else { return }
        
        state = .loading
        let parameters: [String: Any] = [
            "q": query,
            "start": currentPage * pageSize,
            "limit": pageSize
        ]
        
        networkService.fetch(endpoint: "/search.json", parameters: parameters, responseType: SearchResponse.self)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }
                
                if case .failure(let error) = completion {
                    print("Error: \(error.localizedDescription)")
                    self.hasMoreBooks = false
                    self.state = .noResult
                }
            }, receiveValue: { [weak self] searchResponse in
                guard let self = self else { return }
                self.books.append(contentsOf: searchResponse.docs)
                self.currentPage += 1
                self.hasMoreBooks = searchResponse.docs.count == self.pageSize
                if searchResponse.docs.isEmpty {
                    self.state = .noResult
                } else {
                    self.state = .result
                }
            })
            .store(in: &cancellables)
    }
}
