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
        ZStack(alignment: .bottom) {
            TabView(selection: $router.selectedTab) {
                ForEach(Tabs.allCases, id: \.self) { tab in
                    TabItem(tab)
                        .tag(tab.rawValue)
                }
            }
            .tint(.wbPurple)
            CustomTabBar(selectedTab: $router.selectedTab)
                                    .background(Color.clear)
        }
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
        UITabBar.appearance().isHidden = true
    }
}

#Preview {
    TabsView()
        .environmentObject(Router.shared)
}


