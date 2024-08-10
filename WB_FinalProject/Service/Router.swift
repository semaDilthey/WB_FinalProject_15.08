//
//  Router.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import Foundation

final class Router: ObservableObject {
    
    @Published var selectedTab: Tabs = .favorite
    
    static var shared: Router = .init()
    
    private init() {}
    
    func moveToTab(tab: Tabs) {
        
    }
}
