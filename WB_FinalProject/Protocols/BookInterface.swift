//
//  BookInterface.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 16.08.2024.
//

import RealmSwift

protocol AnyBook: BookResponseInterface, BookInterface {}

protocol BookInterface: Identifiable, Hashable {
    associatedtype BookModel : Object
    var id: UUID { get set }
    var title: String { get set }
    var authors: [String]? { get set }
    var image: UIImage? { get set }
    var isFavorite: Bool { get set }
    var firstYear: Int? { get set }
    var rating: Double? { get set }
    var subject: [String]? { get set }
    var language: [String]? { get set }
    
    func toRealm() -> BookModel
}
