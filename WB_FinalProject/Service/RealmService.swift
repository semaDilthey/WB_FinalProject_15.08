//
//  RealmService.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 13.08.2024.
//

import Foundation
import RealmSwift

protocol Persistable {
    func save<T: Object>(_ object: T) throws
    func fetchAll<T: Object>(_ type: T.Type) -> Results<T>?
//    func delete<T: Object>(_ object: T) throws
}

final class RealmService: Persistable {
    
    static let shared : RealmService = .init()
    
    private var realm: Realm?
    
    private init() {
        do { self.realm = try Realm() }
        catch { print("Cant init realm \(error.localizedDescription)") }
    }
    
    deinit { realm = nil }
    
    func save<T: Object>(_ object: T) throws {
        guard let realm else { return }
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            throw error
        }
    }
    
    func fetchAll<T: Object>(_ type: T.Type) -> Results<T>? {
        guard let realm else { return nil }
        return realm.objects(type)
    }
//    
//    func delete<T>(_ object: T) throws {
//        let predicate = NSPredicate(format: "id == %@", workout.id.uuidString)
//        let workoutToDelete = realm?.objects(WorkoutRealm.self).filter(predicate)
//    }
}

class RealmManager {
    private let realm = try! Realm()

    func create<T: Object>(_ object: T) {
        try! realm.write {
            realm.add(object)
        }
    }

    func read<T: Object>(_ type: T.Type, key: String) -> T? {
        return realm.object(ofType: type, forPrimaryKey: key)
    }

    func update(_ block: () -> Void) {
        try! realm.write {
            block()
        }
    }

    func delete<T: Object>(_ object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }

    func fetchAll<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
}
