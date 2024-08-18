//
//  String+Extension.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 09.08.2024.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "\(self) couldn't be found in Localizable.strings")
    }
    
}
