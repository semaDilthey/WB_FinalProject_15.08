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
    
    func saveBook(_ book: any BookInterface) {
        if let database = dataBase as? RealmService<Book> {
            do {
                try database.save(book as! Book)
            } catch {
                showAlert.toggle()
            }
        } else {
            print("Error: DataBase is not of type RealmService<Book>")
        }
    }
}
