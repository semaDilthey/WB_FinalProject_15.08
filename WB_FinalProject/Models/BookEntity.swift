//
//  BookEntity.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 12.08.2024.
//

import Foundation
import RealmSwift
import UIKit

protocol IBook {
    var id: String { get set }
    var title: String { get set }
    var authors: List<String> { get set }
    var imageData: Data? { get set }
    var isFavorite: Bool { get set }
}

final class BookEntity: Object, IBook {
    @Persisted var id: String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var authors = List<String>()
    @Persisted var imageData: Data? = nil
    @Persisted var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(id: UUID, title: String, authors: [String]?, imageData: Data?, isFavorite: Bool) {
        self.init()
        self.id = id.uuidString
        self.title = title
        if let authors {
            self.authors.append(objectsIn: authors)
        }
        self.imageData = imageData
        self.isFavorite = isFavorite
    }
}

extension BookEntity {
    func fromBook(_ book: Book) -> BookEntity {
        let id = UUID()
        let title = book.title
        let authors = book.author_name.map { $0 }
        
        return BookEntity(id: id,
                    title: title,
                    authors: authors,
                    imageData: nil,
                    isFavorite: false)
    }
}
