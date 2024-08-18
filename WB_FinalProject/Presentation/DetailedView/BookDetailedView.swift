//
//  BookDetailedView.swift
//  WB_FinalProject
//
//  Created by Анастасия on 18.08.2024.
//

import SwiftUI
import UISystem
import RealmSwift

struct BookDetailedView: View {
        
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
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    WBWebImage(urlString: imageUrl(coverI: bookResponse.cover_i)) {
                        WBLoaderView(color: .wbPurple)
                    } onImageLoaded: { image in
                        self.image = image
                    }
                    .scaledToFit()
                    .frame(width: UI.maxImageWidth)
                    
                    VStack(alignment: .leading) {
                        Text(bookResponse.title)
                            .font(.wb(.heading2))
                            .padding(.bottom)
                        if bookResponse.author_name?.count ?? 0 > 1 {
                            Text("\("authors".localized) \(bookResponse.author_name?.joined(separator: ", ") ?? "no_authors".localized)")
                                .font(.wb(.subheading1))
                        } else {
                            Text("\("author".localized) \(bookResponse.author_name?.first ?? "no_authors".localized)")
                        }
                        if let rating = bookResponse.ratings_average {
                            HStack {
                                Rating(rating: rating)
                                Text(String(format: "%.1f", rating))
                                    .font(.wb(.body1))
                            }
                        } else {
                            Text("Rating: N/A")
                                .font(.wb(.body1))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                Divider()
                
                if let publishYear = bookResponse.first_publish_year {
                    Text("Firstly published: \(publishYear.description)")
                        .font(.wb(.body2))
                } else {
                    Text("Firstly published: N/A")
                        .font(.wb(.body2))
                }
                
                if let language = bookResponse.language {
                    Text("Language: \(language.joined(separator: ", ").capitalized)")
                        .font(.wb(.body2))
                } else {
                    Text("Language: N/A")
                        .font(.wb(.body2))
                }
                
                if let subject = bookResponse.subject {
                    Text("Subject: \(subject.joined(separator: ", "))")
                        .font(.wb(.body2))
                } else {
                    Text("Subject: N/A")
                        .font(.wb(.body2))
                }
                
                Spacer()
            }
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
            .padding(.vertical)
            .padding(.horizontal, 16)
        }
        .onAppear {
            checkIfBookIsFavorite(bookResponse)
        }
    }
    
    private func bookInterfaceCell(_ book: any BookInterface) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    if let image = book.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UI.maxImageWidth)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.wb(.heading2))
                            .padding(.bottom)
                        if book.authors?.count ?? 0 > 1 {
                            Text("\("authors".localized) \(book.authors?.joined(separator: ", ") ?? "no_authors".localized)")
                                .font(.wb(.subheading1))
                        } else {
                            Text("\("author".localized) \(book.authors?.first ?? "no_authors".localized)")
                        }
                        if let rating = book.rating {
                            HStack {
                                Rating(rating: rating)
                                Text(String(format: "%.1f", rating))
                                    .font(.wb(.body1))
                            }
                        } else {
                            Text("Rating: N/A")
                                .font(.wb(.body1))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                Divider()
                
                if let publishYear = book.firstYear {
                    Text("Firstly published: \(publishYear.description)")
                        .font(.wb(.body2))
                } else {
                    Text("Firstly published: N/A")
                        .font(.wb(.body2))
                }
                
                if let language = book.language {
                    Text("Language: \(language.joined(separator: ", ").capitalized)")
                        .font(.wb(.body2))
                } else {
                    Text("Language: N/A")
                        .font(.wb(.body2))
                }
                
                if let subject = book.subject {
                    Text("Subject: \(subject.joined(separator: ", "))")
                        .font(.wb(.body2))
                } else {
                    Text("Subject: N/A")
                        .font(.wb(.body2))
                }
                
                Spacer()
            }
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
            .padding(.vertical)
            .padding(.horizontal, 16)
        }
   }
    
    private func imageUrl(coverI: Int?) -> String {
        guard let coverI else { return "" }
        return "https://covers.openlibrary.org/b/id/\(coverI)-M.jpg"
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
    static let maxImageWidth: CGFloat = 150
    static let iconSize: CGFloat = 55
}

//#Preview {
//    BookDetailedView()
//}
