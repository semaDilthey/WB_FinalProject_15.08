//
//  FavoriteEmptyView.swift
//  WB_FinalProject
//
//  Created by Daria on 13.08.2024.
//

import SwiftUI
import UISystem

struct FavoriteEmptyView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 23)
            Image("no_saved_books_image")
                .resizable()
                .frame(width: 305, height: 321)
            Spacer()
                .frame(height: 23)
            Text("favorites_title".localized)
                .frame(width: 200)
                .font(.wb(.subheading2))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 58)
        
            WBActionButton(title: "button_search_book".localized,
                           action: { router.selectedTab = .search },
                           backgroundColor: .wbPurple)
        }
        .padding()
    }
}

#Preview {
    FavoriteEmptyView()
}
