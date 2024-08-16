//
//  BookInterface.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 16.08.2024.
//

import RealmSwift

protocol BookInterface: Identifiable {
    associatedtype BookModel : Object
    var id: UUID { get set }
    var title: String { get set }
    var authors: [String]? { get set }
    var image: UIImage? { get set }
    var isFavorite: Bool { get set }
    
    func toRealm() -> BookModel
}
