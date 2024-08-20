//
//  Rating.swift
//  WB_FinalProject
//
//  Created by Анастасия on 18.08.2024.
//

import SwiftUI

struct Rating: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: UI.interStarsSpacing) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UI.starSize, height: UI.starSize)
                    .foregroundColor(index <= Int(rating) ? .wbYellow : .gray.opacity(0.5))
            }
        }
    }
    
    private enum UI {
        static let starSize: CGFloat = 12
        static let interStarsSpacing: CGFloat = 2.4
    }
}

#Preview {
    Rating(rating: 4)
}
