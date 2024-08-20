//
//  SearchViewModel.swift
//  WB_FinalProject
//
//  Created by Anastasia & Semyon on 17.08.2024.
//

import SwiftUI
import Combine

enum SearchState {
    case begin, loading, result, noResult
}

final class SearchViewModel: ObservableObject {
    
    //MARK: - Properties
    
    //MARK: Observable properties
    @Published var state: SearchState = .begin
    @Published var books: [BookResponse] = []
    @Published var hasMoreBooks: Bool = true
    @Published var showAlert = false
    @Published var query = ""
    
    //MARK: Pagination properties
    private var currentPage = 0
    private let pageSize = 10
    
    //MARK: Services properties
    private let networkService : any Networking
    private let dataBase : any Persistable
    
    //MARK: Subscription properties
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Initializtion
    
    init(networkService: any Networking = BookAPIServiceAdapter(),
         dataBase: any Persistable = RealmService<Book>())
    {
        self.networkService = networkService
        self.dataBase = dataBase
    }
    
    //MARK: - Public methos
    
    func searchBooks(query: String) {
        self.query = query
          resetPagination()
          loadMoreBooks()
      }

    func loadMoreBooks() {
        guard state != .loading, hasMoreBooks else { return }

        state = .loading
        let parameters = createSearchParameters()

        networkService.fetch(endpoint: "/search.json", parameters: parameters, responseType: SearchResponse.self)
            .sink(receiveCompletion: handleCompletion, receiveValue: handleResponse)
            .store(in: &cancellables)
    }

    func saveBook(_ book: any BookInterface) {
        guard let database = dataBase as? RealmService<Book> else {
            print("Error: DataBase is not of type RealmService<Book>")
            return
        }

        do {
            try database.save(book as! Book)
        } catch {
            showAlert.toggle()
        }
  }
    
    // MARK: - Private methods

    private func resetPagination() {
        currentPage = 0
        books = []
        hasMoreBooks = true
    }

    private func createSearchParameters() -> [String: Any] {
        [
        "q": query,
        "start": currentPage * pageSize,
        "limit": pageSize
        ]
    }

    private func handleCompletion(completion: Subscribers.Completion<Error>) {
        if case .failure(let error) = completion {
            print("Error: \(error.localizedDescription)")
            hasMoreBooks = false
            state = .noResult
        }
    }

    private func handleResponse(searchResponse: SearchResponse) {
        books.append(contentsOf: searchResponse.docs)
        currentPage += 1
        hasMoreBooks = searchResponse.docs.count == pageSize
        state = searchResponse.docs.isEmpty ? .noResult : .result
    }
}
