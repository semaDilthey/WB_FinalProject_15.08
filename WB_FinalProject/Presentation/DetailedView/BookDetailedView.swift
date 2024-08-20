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

    @State private var image: UIImage?
        
    var body: some View {
       WBShadowedWrapperView {
           HStack {
               if let book = book as? (any BookResponseInterface) {
                   bookResponseDetailedView(book)
               }
               if let book = book as? (any BookInterface) {
                   bookInterfaceDetailedView(book)
               }
           }
           .frame(maxWidth: .infinity)
       }
       .padding(1)
   }
   
    private func bookResponseDetailedView(_ bookResponse: any BookResponseInterface) -> some View {
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
                            Text("rating".localized)
                                .font(.wb(.body1))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                Divider()
                
                if let publishYear = bookResponse.first_publish_year {
                    Text("\("firstly_published".localized) \(publishYear.description)")
                        .font(.wb(.body2))
                } else {
                    Text("\("firstly_published".localized) N/A")
                        .font(.wb(.body2))
                }
                
                if let language = bookResponse.language {
                    Text("\("language".localized) \(language.joined(separator: ", ").capitalized)")
                        .font(.wb(.body2))
                } else {
                    Text("\("language".localized) N/A")
                        .font(.wb(.body2))
                }
                
                if let subject = bookResponse.subject {
                    Text("\("subject".localized) \(subject.joined(separator: ", "))")
                        .font(.wb(.body2))
                } else {
                    Text("\("subject".localized) N/A")
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
    
    private func bookInterfaceDetailedView(_ book: any BookInterface) -> some View {
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
                            Text("rating".localized)
                                .font(.wb(.body1))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                Divider()
                
                if let publishYear = book.firstYear {
                    Text("\("firstly_published".localized) \(publishYear.description)")
                        .font(.wb(.body2))
                } else {
                    Text("\("firstly_published".localized) N/A")
                        .font(.wb(.body2))
                }
                
                if let language = book.language {
                    Text("\("language".localized) \(language.joined(separator: ", ").capitalized)")
                        .font(.wb(.body2))
                } else {
                    Text("\("language".localized) N/A")
                        .font(.wb(.body2))
                }
                
                if let subject = book.subject {
                    Text("\("subject".localized) \(subject.joined(separator: ", "))")
                        .font(.wb(.body2))
                } else {
                    Text("\("subject".localized) N/A")
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

}

fileprivate enum UI {
    static let maxImageWidth: CGFloat = 150
    static let iconSize: CGFloat = 55
}

//#Preview {
//    BookDetailedView()
//}
