//
//  BookModelImpl.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 16.08.2024.
//

import Foundation
import UIKit

struct Book: BookInterface, Hashable {
    var id: UUID
    var title: String
    var authors: [String]?
    var image: UIImage?
    var isFavorite: Bool
    
    init(id: UUID, title: String, authors: [String]? = nil, image: UIImage? = nil, isFav: Bool = false) {
        self.id = id
        self.title = title
        self.authors = authors
        self.image = image
        self.isFavorite = isFav
    }
    
    init() {
        self.id = UUID()
        self.title = ""
        self.authors = []
        self.image = nil
        self.isFavorite = false
    }
    
}

extension Book {
    
    func toRealm() -> BookRealmModel {
        return BookRealmModel(id: self.id.uuidString,
                         title: self.title,
                         authors: self.authors,
                         image: self.image?.pngData(),
                         isFavorite: self.isFavorite
        )
    }
    
    static func fromDecodableBook(_ book: BookResponse) -> Self {
        return Book(id: UUID(), title: book.title, authors: book.author_name)
    }
    
}
