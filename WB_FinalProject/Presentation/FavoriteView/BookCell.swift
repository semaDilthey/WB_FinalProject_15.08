//
//  BookCell.swift
//  WB_FinalProject
//
//  Created by Daria on 13.08.2024.
//

import SwiftUI
import UISystem

struct BookCell: View {
    var book: Book
    @State var isPressedLike = false //Необходимо добавить переменную с isFavorites = false в модель, и передавать ее, но не знаю возможно ли это сделать, если этого не сделать, то отмечается каждый объект, как избранный. Пока эта заглушка.
    
    var body: some View {
        VStack() {
            HStack {
                if let coverId = book.cover_i {
                    Spacer()
                    AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding(.leading, 20)
                        
                    } placeholder: {
                        WBLoaderView(color: .wbPurple)
                            .frame(width: 30, height: 30)
                    }
                } else {
                    Image("no_books_found_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.leading, 20)
                }
                
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    if book.author_name?.count ?? 0 > 1 {
                        Text("Authors: \(book.author_name?.joined(separator: ", ") ?? "Unknown")")
                    } else {
                        Text("Author: \(book.author_name?.joined(separator: ", ") ?? "Unknown")")
                    }
                }
                .padding(.leading, 8)
                Spacer()
                Button {
                    isPressedLike.toggle()
                    //заглушка, по идее должно быть:
                    //book.isFavorite.toggle()
                    
                    //action
                } label: {
                    Image(systemName: isPressedLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .tint(.wbPurple)
                }
                .padding(.trailing, 16)
            }
        }
        .frame(width: 337, height: 123)
        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.wbPurple, lineWidth: 1))
    }
}
