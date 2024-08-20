//
//  Router.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    
    @Published var selectedTab: Tabs = .favorite
    
    static var shared: Router = .init()
    
    private init() {}
    
    func moveToTab(tab: Tabs) {
        selectedTab = tab
    }
}

struct RouterKey: EnvironmentKey {
    static let defaultValue: Router = .shared
}

extension EnvironmentValues {
    var router: Router {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
}


