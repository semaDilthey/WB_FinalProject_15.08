//
//  SwipeModifier.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 18.08.2024.
//

import SwiftUI
import SwipeActions

extension View {
    func swipeToDelete(action: @escaping () -> Void) -> some View  {
        self.modifier(SwipeToDeleteModifier(action: action))
    }
}

struct SwipeToDeleteModifier: ViewModifier {
    var action: () -> Void

    @State private var isTapped = false
    func body(content: Content) -> some View {
        content
            .addSwipeAction(edge: .trailing) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 5)
                Button {
                    isTapped.toggle()
                    action()
                } label: {
                    VStack {
                        Image(systemName: !isTapped ? "bookmark.fill" : "bookmark")
                            .foregroundColor(.wbYellow)
                            .frame(width: 25, height: 25)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.clear)
                            .frame(width: 80, height: 85)
                    )
                }
                .frame(width: 80, height: 80)
            }
    }
}
