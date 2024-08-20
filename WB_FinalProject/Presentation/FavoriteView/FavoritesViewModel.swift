//
//  FavoritesViewModel.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import Foundation

enum FavoriteScreenState {
    case empty, hasData
}

final class FavoritesViewModel: ObservableObject {
        
    //MARK: - Properties
    
    //MARK: Observable properties
    
    @Published var state: FavoriteScreenState = .empty
    @Published var books: [Book] = [] {
        didSet {
            state = books.isEmpty ? .empty : .hasData
        }
    }
    
    //MARK: Service properties
    
    private let dataBase: any Persistable
    
    //MARK: - Initialization
    
    init(dataBase: any Persistable = RealmService<Book>()) {
        self.dataBase = dataBase
    }
    
    //MARK: - Public methods
    
    func fetchBooks() {
        self.books = dataBase.fetchAll() as! [Book]
    }
    
    func delete(_ book: Book) {
        if let dataBase = dataBase as? RealmService<Book> {
            do {
                try dataBase.delete(book)
                    books.removeAll { $0.id == book.id }
            } catch {
                print(error)
            }
        }
    }
    
}
