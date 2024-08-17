//
//  LoadingSearchResultView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI
import UISystem

struct LoadingSearchResultView: View {
    @State private var loadingText: String = "loading_text".localized
    @State private var dotCount: Int = 0
    
    private let loaderDiametr: CGFloat = 100
    private let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Spacer()
            Text(loadingText)
                .font(.wb(.heading2))
                .foregroundStyle(.wbText)
                .padding(.bottom)
                .onReceive(timer) { _ in
                    updateLoadingText()
                }
            WBLoaderView(color: .wbPurple)
                .frame(width: loaderDiametr,
                       height: loaderDiametr)
            Spacer()
        }
    }

    private func updateLoadingText() {
        dotCount = (dotCount % 3) + 1
        loadingText = "loading_text".localized + String(repeating: ".", count: dotCount)
    }
}

#Preview {
    LoadingSearchResultView()
}
