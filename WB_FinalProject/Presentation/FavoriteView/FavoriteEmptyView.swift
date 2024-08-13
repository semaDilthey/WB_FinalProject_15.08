//
//  FavoriteEmptyView.swift
//  WB_FinalProject
//
//  Created by Daria on 13.08.2024.
//

import SwiftUI
import UISystem

struct FavoriteEmptyView: View {
    @State private var favoriteBooksCount = 0
    var font: Font = .wb(.heading1)
    var font2: Font = .wb(.subheading2)
    
    var body: some View {
        VStack() {
            WBFavoriteCardCount(countBooks: favoriteBooksCount, font: font)
            Spacer()
                .frame(height: 23)
            Image("no_saved_books_image")
                .resizable()
                .frame(width: 305, height: 321)
            Spacer()
                .frame(height: 23)
            Text("favorites_title".localized)
                .frame(width: 200)
                .font(font2)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 58)
            
            WBActionButton(title: "button_search_book".localized,
                           action: { //
            },
                           backgroundColor: .wbPurple)
            .padding()
            
        }
    }
}

#Preview {
    FavoriteEmptyView()
}
