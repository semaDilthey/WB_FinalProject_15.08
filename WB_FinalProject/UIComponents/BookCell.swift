//
//  BookCell.swift
//  WB_FinalProject
//
//  Created by Daria on 13.08.2024.
//

import SwiftUI
import UISystem
import RealmSwift

typealias BookModelType = AnyHashable

struct BookCell: View {
        
    var book: BookModelType
    var onFavoriteTap: (Book) -> Void
    
    @State private var image: UIImage?
    @State private var isFavorite: Bool = false
        
    var body: some View {
       WBShadowedWrapperView {
           HStack {
               if let book = book as? (any BookResponseInterface) {
                  bookResponseCell(book)
               }
               if let book = book as? (any BookInterface) {
                   bookInterfaceCell(book)
               }
           }
           .frame(maxWidth: .infinity)
       }
       .padding(1)
   }
   
    private func bookResponseCell(_ bookResponse: any BookResponseInterface) -> some View {
       HStack {
           WBWebImage(urlString: imageUrl(coverI: bookResponse.cover_i)) {
               WBLoaderView(color: .wbPurple)
           } onImageLoaded: { image in
               self.image = image
           }
           .scaledToFit()
           .padding()
           .frame(width: UI.maxImageWidth)
           VStack(alignment: .leading) {
               Text(bookResponse.title)
                   .font(.wb(.subheading1))
                   .padding(.bottom)
               if bookResponse.author_name?.count ?? 0 > 1 {
                   Text("\("authors".localized) \(bookResponse.author_name?.joined(separator: ", ") ?? "no_authors".localized)")
               } else {
                   Text("\("author".localized) \(bookResponse.author_name?.joined(separator: ", ") ?? "no_authors".localized)")
               }
               Spacer()
           }
           .lineLimit(nil)
           .minimumScaleFactor(0.5)
           .multilineTextAlignment(.leading)
           .padding(.vertical)
           .foregroundStyle(.black)
           Spacer()
           favoriteButton
       }
       .onAppear {
           checkIfBookIsFavorite(bookResponse)
       }
   }
   
   private func bookInterfaceCell(_ book: any BookInterface) -> some View {
       HStack {
           if let image = book.image {
               Image(uiImage: image)
                   .resizable()
                   .scaledToFit()
                   .frame(width: UI.maxImageWidth)
                   .padding()
           }
           VStack(alignment: .leading) {
               Text(book.title)
                   .font(.wb(.subheading1))
                   .padding(.bottom)
               if book.authors?.count ?? 0 > 1 {
                   Text("\("authors".localized) \(book.authors?.joined(separator: ", ") ?? "no_authors".localized)")
               } else {
                   Text("\("author".localized) \(book.authors?.joined(separator: ", ") ?? "no_authors".localized)")
               }
               Spacer()
           }
           .lineLimit(nil)
           .minimumScaleFactor(0.5)
           .multilineTextAlignment(.leading)
           .padding(.vertical)
           .foregroundStyle(.black)
           Spacer()
       }
   }
    
    private var favoriteButton: some View {
        Button {
           didTappedFavorite()
        } label: {
            Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                .resizable()
                .scaledToFit()
                .frame(width: UI.iconSize, height: UI.iconSize)
                .tint(.wbYellow)
        }
        .padding(.trailing)
    }
    
    private func imageUrl(coverI: Int?) -> String {
        guard let coverI else { return "" }
        return "https://covers.openlibrary.org/b/id/\(coverI)-M.jpg"
    }
    
    private func didTappedFavorite() {
        if let book = book as? (any BookResponseInterface) {
            var book = Book.fromDecodableBook(book as! BookResponse)
            book.image = self.image
            book.isFavorite.toggle()
            self.isFavorite = book.isFavorite
            onFavoriteTap(book)
        }
        if var book = book as? Book {
            book.image = self.image
            book.isFavorite.toggle()
            self.isFavorite = book.isFavorite
            onFavoriteTap(book)
        }
    }
    
    private func checkIfBookIsFavorite(_ bookResponse: any BookResponseInterface) {
         let realm = try? Realm()
         let predicate = NSPredicate(format: "title == %@ AND ANY authors == %@", bookResponse.title, bookResponse.author_name?.first ?? "")
         if let existingBook = realm?.objects(BookRealmModel.self).filter(predicate).first {
             isFavorite = existingBook.isFavorite
         }
     }
}

fileprivate enum UI {
    static let maxImageWidth: CGFloat = 85
    static let iconSize: CGFloat = 25
}
