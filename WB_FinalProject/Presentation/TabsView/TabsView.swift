//
//  TabsView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import SwiftUI

struct TabsView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                TabItem(tab)
                    .tag(tab.rawValue)
                    .tabItem {
                        VStack {
                            Image(systemName: tab.value.icon)
                            Text(tab.value.title)
                    }
                }
            }
        }
        .tint(.wbPurple)
    }
    
    @ViewBuilder
    private func TabItem(_ tab: Tabs) -> some View {
        switch tab {
        case .favorite:
            FavoriteView()
        case .search:
            SearchView()
        }
    }
    
    init() {
        setupTabBar()
    }
    
    private func setupTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.wbPurpleBackground
        tabBarAppearance.shadowColor = .clear
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().unselectedItemTintColor = UIColor.wbDisabled.withAlphaComponent(0.45)
    }
}

#Preview {
    TabsView()
        .environmentObject(Router.shared)
}
