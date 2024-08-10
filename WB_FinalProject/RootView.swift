//
//  ContentView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 08.08.2024.
//

import SwiftUI


struct RootView<Content>: View where Content: View {
        
    @StateObject private var viewModel = OnboardingViewModel.shared

    let content: Content
    
    var body: some View {
        Group {
            switch viewModel.appState {
            case .onboarding:
                OnboardingView()
                    .environmentObject(viewModel)
            case .main:
                content
            }
        }
    }
}
