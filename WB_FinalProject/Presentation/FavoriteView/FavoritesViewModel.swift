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
        
    @Published var state: FavoriteScreenState = .empty
    @Published var books: [Book] = [] {
        didSet {
            state = books.isEmpty ? .empty : .hasData
        }
    }
    
    private let dataBase: any Persistable
    
    init(dataBase: any Persistable = RealmService<Book>()) {
        self.dataBase = dataBase
        self.fetchBooks()
    }
    
    private func fetchBooks() {
        self.books = dataBase.fetchAll() as! [Book]
    }
    
//    func removeFromFavs(_ book: Book) {
//        self.dataBase.updateStatus(book)
//    }
    
}
