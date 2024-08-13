//
//  WBFavoritesCountCard.swift
//  
//
//  Created by Daria on 13.08.2024.
//

import SwiftUI

public struct WBFavoriteCardCount: View {
    var countBooks: Int
    var font: Font
    
    public init(countBooks: Int, font: Font) {
        self.countBooks = countBooks
        self.font = font
    }
    public var body: some View {
        ZStack(alignment: .leading) {
            Color.wbPurple
            HStack(spacing: 26) {
                Text("onboarding1_title".localized.uppercased())
                   .font(font)
                Text("\(countBooks)")
                    .font(font)
            }
            .padding(.leading, 26)
        }
        .cornerRadius(15)
        .frame(width: 337, height: 86)
    }
}
