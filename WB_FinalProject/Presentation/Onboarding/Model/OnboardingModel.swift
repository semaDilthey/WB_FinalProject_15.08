//
//  OnboardingModel.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 10.08.2024.
//

import Foundation

enum OnboardingModel {
    case first, second
    
    var text : (title: String, subtitle: String) {
        switch self {
        case .first:
            return (
                "onboarding1_title".localized.uppercased(),
                "onboarding1_subtitle".localized
            )
        case .second:
            return (
                "onboarding2_title".localized.uppercased(),
                "onboarding2_subtitle".localized
            )
        }
    }
    
    var image : String {
        switch self {
        case .first:
            "onboarding1"
        case .second:
            "onboarding2"
        }
    }
}
