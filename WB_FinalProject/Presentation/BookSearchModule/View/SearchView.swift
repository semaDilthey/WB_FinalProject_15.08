//
//  SearchView.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var query = ""
    
    var body: some View {
        VStack {
            TextField("Search for books...", text: $query, onCommit: {
                viewModel.searchBooks(query: query)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            List {
                ForEach(viewModel.books, id: \.self) { book in
                    HStack(alignment: .top) {
                        Text(book.title)
                            .font(.headline)
                        Spacer()
                        
                        if let authors = book.author_name {
                            Text(authors.joined(separator: ", "))
                                .font(.subheadline)
                        }
                        
                        if let coverId = book.cover_i {
                            Spacer()
                            AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if viewModel.hasMoreBooks {
                    Button("Load More") {
                        viewModel.loadMoreBooks()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            // Optional: Trigger initial search if needed
            // viewModel.searchBooks(query: query)
        }
    }
}

#Preview {
    SearchView()
}
