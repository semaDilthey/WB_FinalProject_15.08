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
    
    var body: some View {
        ZStack {
            Color.wbPurpleBackground
            VStack {
                Spacer()
                imageView
                    .padding(.top, SC.imagePad)
                textsView
                    .padding(.bottom, SC.textsBottomPad)
                continueButton
                    .padding(.bottom, SC.buttonBottomPad)
            }
            .padding()
        }
        .ignoresSafeArea()
        .background(.wbPurpleBackground.opacity(0.5))
    }
    
    private var imageView: some View {
        Image(viewModel.onboardingPage.image)
            .resizable()
            .scaledToFit()
    }
    
    private var textsView: some View {
        VStack(alignment: .center) {
            Text(viewModel.onboardingPage.text.title)
                .font(.wb(.heading1))
                .foregroundStyle(.wbPurple)
                .padding(.vertical)
            Text(viewModel.onboardingPage.text.subtitle)
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
                       action: { withAnimation(.snappy) { viewModel.goToNextScreen() } },
                       backgroundColor: .wbPurple)
    }
    
}


fileprivate typealias SC = ScreenConstants
fileprivate enum ScreenConstants {
    static let imagePad : CGFloat = 110
    static let textsBottomPad : CGFloat = 50
    static let buttonBottomPad : CGFloat = 50
}


#Preview {
    OnboardingView()
        .environmentObject(OnboardingViewModel())
}
