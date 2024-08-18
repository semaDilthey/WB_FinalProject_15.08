//
//  SearchView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI
import UISystem

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                searchField
                switch viewModel.state {
                case .begin:
                    BeginSearchView()
                case .loading:
                    LoadingSearchResultView()
                case .result:
                    SearchResultView()
                        .environmentObject(viewModel)
                case .noResult:
                    NoSearchResultsView()
                }
            }
            .padding()
            .onChange(of: viewModel.hasMoreBooks) { newVal in
                viewModel.loadMoreBooks()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("error_already_exists".localized))
            }
        }
    }
    
    private var searchField: some View {
        WBSearchField(searchText: $viewModel.query,
                      placeholder: "searchbar_placeholder".localized,
                      tintColor: .wbPurple)
        .onSubmit {
            viewModel.searchBooks(query: viewModel.query)
        }
    }
}

#Preview {
    SearchView()
}
