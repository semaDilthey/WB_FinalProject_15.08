//
//  BooksView.swift
//  WB_FinalProject
//
//  Created by Анастасия on 12.08.2024.
//

import SwiftUI
import UISystem

public struct BookCell: View {
    
    var book: any BookInterface
    
    public var body: some View {
        WBShadowedWrapperView {
            HStack {
                // WEBIMAGE СКОПИРОВАТЬ ИЗ ПРОЕКТА ВБ
            }
        }
    }
}

struct BooksView: View {
    @StateObject private var viewModel = BooksViewModel()
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.books, id: \.title) { book in
                    HStack(alignment: .top) {
                        Text(book.title).font(.headline)
                        Spacer()
                        if let authors = book.author_name {
                            Text("Authors: \(authors.joined(separator: ", "))")
                                .lineLimit(10)
                        }
                        if let coverId = book.cover_i {
                            Spacer()
                            AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")) { image in
                                image.resizable()
                                     .scaledToFit()
                                     .frame(width: 60, height: 60)

                            } placeholder: {
                                WBLoaderView(color: .wbPurple)
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }
                
                // Loading indicator
                if isLoading {
                    ProgressView()
                        .padding()
                }
            }
            .onAppear {
                viewModel.loadBooks(query: "book")
            }
            .onChange(of: viewModel.books.count) { _ in
                loadMoreDataIfNeeded()
            }
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text("Error"), message: Text(viewModel.error ?? "Unknown error"))
            }
            .navigationTitle("Books")
        }
    }
    
    private func loadMoreDataIfNeeded() {
        let lastBook = viewModel.books.last
        if let lastBook = lastBook {
            let lastBookIndex = viewModel.books.firstIndex(of: lastBook) ?? 0
            if lastBookIndex == viewModel.books.count - 1 {
                if !viewModel.isLoading {
                    isLoading = true
                    viewModel.loadBooks(query: "book")
                }
            }
        }
    }
}

#Preview {
    BooksView()
}
