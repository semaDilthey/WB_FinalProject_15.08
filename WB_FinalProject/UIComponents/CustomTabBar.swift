//
//  CustomTabBar.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 20.08.2024.
//

import SwiftUI

struct CustomTabBar : View {
    
    @Binding var selectedTab : Tabs
    
    var body: some View {
        
        HStack {
            TabBarItem(tab: .favorite, selectedTab: $selectedTab)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            TabBarItem(tab: .search, selectedTab: $selectedTab)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
        .frame(height: UI.height)
        .padding(.horizontal, UI.itemsPadding)
        .background(
             ZStack {
                 Color.clear
                 RoundedRectangle(cornerRadius: UI.rectRad)
                     .fill(Color.wbPurpleBackground)
                     .shadow(color: .wbText.opacity(0.1), radius: 5)
             }
         )
        .padding(.horizontal, 34)
    }
    
    private enum UI {
        static let height: CGFloat = 55
        static let itemsPadding: CGFloat = 70
        static let rectRad: CGFloat = 10
    }
}

struct TabBarItem : View {
    
    var tab : Tabs
    @Binding var selectedTab : Tabs
    
    private var itemColor : Color {
        selectedTab == tab ? .wbPurple : .wbDisabled.opacity(0.45)
    }
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    selectedTab = tab
                }
            }, label: {
                VStack {
                    Image(systemName: tab.value.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            })
        }
        .foregroundStyle(itemColor)
    }
}
