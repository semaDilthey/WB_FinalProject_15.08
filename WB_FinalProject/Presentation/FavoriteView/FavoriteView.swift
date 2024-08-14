//
//  FavoritesView.swift
//  WB_FinalProject
//
//  Created by Daria on 13.08.2024.
//

import SwiftUI
import UISystem

struct FavoriteView: View {
    @State var favoritesBook: [Book] = []
    var favoriteBooksCount: Int {
        return favoritesBook.count
    }
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 24)
            WBFavoriteCardCount(countBooks: favoriteBooksCount,
                                font: font,
                                backgroundColor: .wbPurple,
                                text: "favorites_cardCount".localized.uppercased())
            List {
                ForEach(favoritesBook, id: \.title) { book in
                    BookCell(book: book)
                }
            }
            .padding(.leading, 8)
            .listStyle(.inset)
        }
        .onAppear {
            loadFavoriteBooks()
        }
    }
    
    func loadFavoriteBooks() {
        //
    }
}

#Preview {
    FavoriteView()
}
