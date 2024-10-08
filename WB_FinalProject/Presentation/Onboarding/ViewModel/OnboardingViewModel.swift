//
//  OnboardingViewModel.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import SwiftUI

// MARK: - Число страниц онбординга
private let totalPages = 2

// MARK: - Onboarding Status Manager
final class OnboardingViewModel: ObservableObject {
    
    // Текущая страница онбординга, сохраненная в UserDefaults через App Storage
    @AppStorage("currentPage") var currentPage: Int = 1 {
        didSet {
            // Обновляем стейт онбординга при изменении текущей страницы
            updateOnboardingState()
        }
    }
    
    @Published var appState: AppState = .onboarding
    
    var onboardingPage : OnboardingModel {
        switch currentPage {
        case 1: return .first
        case 2: return .second
        default: return .second
        }
    }
    
    // MARK: - Initialization
    
    init() {
        updateOnboardingState()
    }
    
    //MARK: - Continue button pressed

    func goToNextScreen() {
        if currentPage <= totalPages {
            currentPage += 1
        }
    }
    
    private func updateOnboardingState() {
        if currentPage > totalPages {
            appState = .main
        } else {
            appState = .onboarding
        }
    }
    
    // MARK: - Listing of app states

    enum AppState {
        case onboarding
        case main
    }
}
