//
//  SearchResultView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI

struct SearchResultView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.books, id: \.self) { book in
                    BookCell(book: book) { book in
                        viewModel.saveBook(book)
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

