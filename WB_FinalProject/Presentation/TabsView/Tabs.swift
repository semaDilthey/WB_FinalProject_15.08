//
//  Tabs.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import Foundation

enum Tabs: Int, CaseIterable {
    case favorite, search
    
    var value: (icon: String, title: String) {
        switch self {
        case .favorite:
            ("bookmark", "tab_favorites".localized)
        case .search:
            ("magnifyingglass", "tab_search".localized)
        }
    }
}
