//
//  FavoritesView.swift
//  WB_FinalProject
//
//  Created by Daria & Semyon on 13.08.2024.
//

import SwiftUI
import UISystem

struct FavoriteView: View {
    
    @StateObject private var viewModel: FavoritesViewModel = .init()
    
    var body: some View {
        VStack {
            totalBooksView
                .frame(height: 85)
            switch viewModel.state {
            case .empty:
                FavoriteEmptyView()
            case .hasData:
                FavoritesNonEmptyView()
                    .environmentObject(viewModel)
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchBooks()
        }
    }
    
    private var totalBooksView: some View {
        WBFavoriteCardCount(countBooks: viewModel.books.count,
                            font: .wb(.heading2),
                            backgroundColor: .wbPurple,
                            text: "favorites_cardCountTitle".localized.uppercased())
    }
}

#Preview {
    FavoriteView()
}
