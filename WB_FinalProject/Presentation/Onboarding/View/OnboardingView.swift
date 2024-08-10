//
//  OnboardingView.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import SwiftUI
import UISystem

struct OnboardingView: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
            
    private var onboardingPage : OnboardingModel {
        switch viewModel.currentPage {
        case 1: return .first
        case 2: return .second
        default: return .second
        }
    }
    
    var body: some View {
        ZStack {
            Color.wbPurpleBackground
            VStack {
                Spacer()
                imageView
                textsView
                Spacer()
                continueButton
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
        .background(.wbPurpleBackground.opacity(0.5))
    }
    
    private var imageView: some View {
        Image(onboardingPage.image)
            .resizable()
            .scaledToFit()
    }
    
    private var textsView: some View {
        VStack(alignment: .center) {
            Text(onboardingPage.text.title)
                .font(.wb(.heading1))
                .foregroundStyle(.wbPurple)
                .padding(.vertical)
            Text(onboardingPage.text.subtitle)
                .font(.wb(.subheading2))
                .foregroundStyle(.wbText)
            }
            .lineLimit(nil)
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    private var continueButton: some View {
        WBActionButton(title: "button_continue".localized,
                       action: withAnimation { viewModel.goToNextScreen },
                       backgroundColor: .wbPurple)
    }
    
}
