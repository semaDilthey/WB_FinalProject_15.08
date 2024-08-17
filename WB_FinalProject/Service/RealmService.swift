//
//  RealmService.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 13.08.2024.
//

import Foundation
import RealmSwift

final class RealmService<Model: BookInterface>: Persistable {
        
    var realm: Realm?
    
    init() {
        do {
            self.realm = try Realm()
        }
        catch {
            print("Cant init realm \(error.localizedDescription)")
        }
    }
    
    deinit { realm = nil }

}
