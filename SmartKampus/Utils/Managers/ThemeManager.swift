//
//  ThemeManager.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//

import UIKit

class ThemeManager {
    
    private static let selectedThemeKey = "SelectedTheme"
    static let theme = ThemeManager.currentTheme()
    private init() { }
    
    private static func currentTheme() -> ThemeColors {
        if let storedTheme = (UserDefaults.standard.value(forKey: selectedThemeKey) as AnyObject).integerValue {
            return ThemeColors(rawValue: storedTheme)!
        } else {
            return .theme2
        }
    }

    static func applyTheme(theme: ThemeColors) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: selectedThemeKey)
        UserDefaults.standard.synchronize()
    }
}
