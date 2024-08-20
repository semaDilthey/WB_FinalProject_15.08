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
                .frame(height: UI.spacerHeight)
            Image("no_saved_books_image")
                .resizable()
                .scaledToFit()
            Spacer()
                .frame(height: UI.spacerHeight)
            Text("favorites_title".localized)
                .frame(maxWidth: .infinity)
                .font(.wb(.subheading2))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: UI.spacerHeight*2)
        
            WBActionButton(title: "button_search_book".localized,
                           action: { router.moveToTab(tab: .search) },
                           backgroundColor: .wbPurple)
        }
        .padding()
    }
}

fileprivate enum UI {
    static let spacerHeight: CGFloat = 23
}

#Preview {
    FavoriteEmptyView()
}
