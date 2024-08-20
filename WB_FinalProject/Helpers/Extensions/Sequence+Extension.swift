//
//  Sequence+Extension.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 20.08.2024.
//

import Foundation

extension Sequence where Element: BookInterface {
    
    func containsBook(matching object: any BookInterface) -> Bool {
        return self.contains { $0.title == object.title && $0.authors == object.authors }
    }
    
}
