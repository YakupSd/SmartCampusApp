//
//  PageModel.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 18.04.2024.
//

import SwiftUI

enum OnboardingItem: Int {
    // MARK: - Cases:
    
    case first
    case second
    case third
    
    // MARK: - Computed properties:
    
    /// Identifier of the value:
    var id: Int {
        rawValue
    }
    
    /// Title of the onboarding:
    var title: String {
        switch self {
        case .first: return "Hayatını Düzene Sok!"
        case .second: return "Aktivitelerinizi Kaydedin"
        case .third: return "Kampüs içinde sağlıklı kalın"
        }
    }
    
    /// Text of the onboarding:
    var text: String {
        switch self {
        case .first: return "Senin dijital yardımcın olucak.\nKendin için en iyisini seç"
        case .second: return "Basit alışkanlıkları ve\nbüyük hedefleri yapılabilir\nhale getirin"
        case .third: return "Kampüs alışkanlıklarınızı\ndeğiştirmeye hazır olun."
     
        }
    }
    
    /// Image for the onboarding:
    var image: String {
        switch self {
        case .first: return "onboard-1"
        case .second: return "onboard-2"
        case .third: return "onboard-3"
        }
    }
    
    /// Background for the onboarding:
    var background: Color {
        switch self {
        case .first: return ThemeColors.theme1.onBoardColor
        case .second: return ThemeColors.theme1.onBoardColor
        case .third: return ThemeColors.theme1.onBoardColor
      
        }
    }
    /// Color of the button:
    var labelColor: Color {
        switch self {
        case .first: return ThemeColors.theme1.greenText
        case .second: return ThemeColors.theme1.greenText
        case .third: return ThemeColors.theme1.greenText
        }
    }
}

// MARK: - Identifiable:

extension OnboardingItem: Identifiable {  }

// MARK: - CaseIterable:

extension OnboardingItem: CaseIterable {  }
