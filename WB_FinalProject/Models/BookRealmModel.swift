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
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(id: String, title: String, authors: [String]?, image: Data? = nil, isFavorite: Bool = false) {
        self.init()
        self.id = id
        self.title = title
        if let authors {
            self.authors.append(objectsIn: authors)
        }
        self.image = image
        self.isFavorite = isFavorite
    }

}

extension BookRealmModel {
    
    func toBook() -> any BookInterface {
        let id = UUID(uuidString: self.id)
        return InAppBookModel(id: id ?? UUID(),
                             title: self.title,
                             authors: self.authors.map { $0 },
                             image: UIImage(data: self.image ?? Data()), // ЗАМЕНИТЬ НА НОРМАЛЬНОЕ ПОЛУЧЕНИЕ КАРТИНКИ
                             isFav: self.isFavorite
        )
    }
    
}
