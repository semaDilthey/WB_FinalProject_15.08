//
//  BeginSearchView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 17.08.2024.
//

import SwiftUI

struct BeginSearchView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("begin_search_view".localized)
                .font(.wb(.heading2))
                .foregroundStyle(.wbText)
            Spacer()
        }
    }

}

#Preview {
    BeginSearchView()
}
