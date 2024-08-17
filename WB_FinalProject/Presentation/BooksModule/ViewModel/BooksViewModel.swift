//
//  BooksViewModel.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import Foundation
import Combine

final class BooksViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var bookEntities: [InAppBookModel] = []
    @Published var error: String?
    @Published var showError: Bool = false
    
    private let networkService = AlomofireService(baseURL: "https://openlibrary.org")
    private var cancellables = Set<AnyCancellable>()
    
    private var currentPage = 0
    private let pageSize = 10
    var isLoading = false
    
    // Сервис Realm. В принципе я его здесь и оставлю, потом буду просто все под него подбивать
    let realm = RealmService<InAppBookModel>()
    //
    
    func loadBooks(query: String) {
        guard !isLoading else { return }
        
        isLoading = true
        let parameters: [String: Any] = [
            "q": query,
            "start": currentPage * pageSize,
            "limit": pageSize
        ]
        
        networkService.fetch(endpoint: "/search.json", parameters: parameters, responseType: SearchResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let fetchError):
                    self.error = fetchError.localizedDescription
                    self.showError = true
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { searchResponse in
                if self.currentPage == 0 {
                    self.books = searchResponse.docs
                    self.bookEntities = self.books.map { book in
                        InAppBookModel.fromDecodableBook(book)
                    }
                } else {
                    self.books.append(contentsOf: searchResponse.docs)
                }
                self.currentPage += 1
            })
            .store(in: &cancellables)
    }
}
