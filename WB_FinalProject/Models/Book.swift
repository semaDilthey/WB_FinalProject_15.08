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
    var firstYear: Int?
    var rating: Double?
    var subject: [String]?
    var language: [String]?
    
    init(id: UUID, 
         title: String,
         authors: [String]? = nil,
         image: UIImage? = nil,
         isFav: Bool = false,
         firstYear: Int? = nil,
         rating: Double? = nil,
         subject: [String]? = nil,
         language: [String]? = nil
    ){
        self.id = id
        self.title = title
        self.authors = authors
        self.image = image
        self.isFavorite = isFav
        self.firstYear = firstYear
        self.rating = rating
        self.subject = subject
        self.language = language
    }
    
}

extension Book {
    
    func toRealm() -> BookRealmModel {
        return BookRealmModel(id: self.id.uuidString,
                              title: self.title,
                              authors: self.authors,
                              image: self.image?.pngData(),
                              isFavorite: self.isFavorite,
                              firstYear: self.firstYear,
                              rating: self.rating,
                              subject: self.subject,
                              language: self.language
        )
    }
    
    static func fromDecodableBook(_ book: BookResponse) -> Self {
        return Book(id: UUID(), 
                    title: book.title,
                    authors: book.author_name,
                    firstYear: book.first_publish_year,
                    rating: book.ratings_average,
                    subject: book.subject,
                    language: book.language
        )
    }
}
