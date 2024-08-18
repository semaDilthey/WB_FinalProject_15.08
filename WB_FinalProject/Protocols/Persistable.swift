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
    func delete(_ object: Model) throws
}

extension Persistable where Model : BookInterface {
    
    func save(_ object: Model) throws {
        guard let realm else { return }
        let objectToSave = object.toRealm()
        
         var predicate = NSPredicate(format: "title == %@", object.title)
         
         for author in object.authors ?? [] {
             let authorPredicate = NSPredicate(format: "ANY authors == %@", author)
             predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, authorPredicate])
         }
        
        let existingObject = realm.objects(BookRealmModel.self)
            .filter(predicate)
            .first
        
        guard existingObject == nil else {
            throw NSError(domain: "ObjectAlreadyExists", code: 1, userInfo: nil)
        }
        
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
    
    func delete(_ object: Model) throws {
        guard let realm else { return }

        let predicate = NSPredicate(format: "id == %@", object.id.uuidString)
        guard let objectToDelete = realm.objects(BookRealmModel.self).filter(predicate).first else {
            throw NSError(domain: "ObjectNotFound", code: 1, userInfo: nil)
        }

        do {
            try realm.write {
                realm.delete(objectToDelete)
            }
        } catch {
            throw error
        }
    }
}
