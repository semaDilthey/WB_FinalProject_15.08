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
    var backgroundColor: Color // .wbPurple
    var text: String // "onboarding1_title".localized.uppercased()
    
    public init(countBooks: Int, font: Font, backgroundColor: Color, text: String) {
        self.countBooks = countBooks
        self.font = font
        self.backgroundColor = backgroundColor
        self.text = text
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            backgroundColor
            HStack(spacing: 26) {
                Text(text)
                   .font(font)
                Text("\(countBooks)")
                    .font(font)
            }
            .padding(.leading, 26)
        }
        .cornerRadius(15)
    }
}
