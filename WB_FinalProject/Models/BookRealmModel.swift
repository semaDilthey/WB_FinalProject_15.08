//
//  BookRealm.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 16.08.2024.
//
import RealmSwift

final class BookRealmModel: Object {
    @Persisted var id: String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var authors = List<String>()
    @Persisted var image: Data? = nil
    @Persisted var isFavorite: Bool = false
    @Persisted var firstYear: Int? = nil
    @Persisted var rating: Double? = nil
    @Persisted var subject = List<String>()
    @Persisted var language = List<String>()
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(id: String, 
                     title: String,
                     authors: [String]?,
                     image: Data? = nil,
                     isFavorite: Bool = false,
                     firstYear: Int? = nil,
                     rating: Double? = nil,
                     subject: [String]? = nil,
                     language: [String]? = nil
    ){
        self.init()
        self.id = id
        self.title = title
        if let authors {
            self.authors.append(objectsIn: authors)
        }
        self.image = image
        self.isFavorite = isFavorite
        self.firstYear = firstYear
        self.rating = rating
        if let subject {
            self.subject.append(objectsIn: subject)
        }
        if let language {
            self.language.append(objectsIn: language)
        }
    }
}

extension BookRealmModel {
    
    func toBook() -> any BookInterface {
        let id = UUID(uuidString: self.id)
        return Book(id: id ?? UUID(),
                    title: self.title,
                    authors: self.authors.map { $0 },
                    image: UIImage(data: self.image ?? Data()),
                    isFav: self.isFavorite,
                    firstYear: self.firstYear,
                    rating: self.rating,
                    subject: self.subject.map { $0 },
                    language: self.language.map { $0 }
        )
    }
}
