//
//  FavoritesNonEmptyView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI

struct FavoritesNonEmptyView: View {
    
    @EnvironmentObject var viewModel: FavoritesViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.books) { book in
                    BookCell(book: book) { book in
                        // ON REMOVE FROM FAVORITES TAP
                    }
                }
                .frame(height: UI.cellHeight)
                .padding(.vertical, UI.interItemPadding)
            }
        }
    }
}

fileprivate enum UI {
    static let cellHeight: CGFloat = 125
    static let interItemPadding: CGFloat = 8
}

#Preview {
    FavoritesNonEmptyView()
        .environmentObject(FavoritesViewModel())
}
