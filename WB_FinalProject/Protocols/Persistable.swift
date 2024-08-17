//
//  Persistable.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 16.08.2024.
//

import Foundation
import RealmSwift

protocol Persistable {
    associatedtype Model
    var realm: Realm? { get }
    func save(_ object: Model) throws
    func fetchAll() -> [Model]
    func updateStatus(_ object: Model)
}

extension Persistable where Model : BookInterface {
    
    func save(_ object: Model) throws {
        guard let realm else { return }
        let objectToSave = object.toRealm()
        do {
            try realm.write {
                realm.add(objectToSave)
            }
        } catch {
            throw error
        }
    }
    
    func fetchAll() -> [Model] {
        guard let realm else { return [] }
        let allBooks = realm.objects(BookRealmModel.self)
        return allBooks.map { $0.toBook() as! Model }
    }
    
    func updateStatus(_ object: Model) {
        let predicate = NSPredicate(format: "id == %@", object.id.uuidString)
        let objectToUpdate = realm?.objects(BookRealmModel.self).filter(predicate).first

        do {
            try realm?.write {
                if let objectToUpdate {
                    objectToUpdate.isFavorite = object.isFavorite
                }
            }
        } catch { }
    }
}
