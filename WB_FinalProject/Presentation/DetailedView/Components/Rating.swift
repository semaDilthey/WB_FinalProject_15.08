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
        HStack(spacing: 2.4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .foregroundColor(index <= Int(rating) ? .wbYellow : .gray.opacity(0.5))
            }
        }
    }
}

#Preview {
    Rating(rating: 4)
}
