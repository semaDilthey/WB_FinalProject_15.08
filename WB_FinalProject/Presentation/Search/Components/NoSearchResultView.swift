//
//  NoSearchResultView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI

struct NoSearchResultsView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("no_result_text".localized)
                .font(.wb(.heading2))
                .foregroundStyle(.wbText)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text("🥲")
                .font(.largeTitle)
            Spacer()
        }
    }
    
}

#Preview {
    NoSearchResultsView()
}
