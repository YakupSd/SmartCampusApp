//
//  ThemeColors.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//
import SwiftUI

enum ThemeColors: Int {

    case theme1, theme2
    
    
    var mainBG:Color {
        switch self {
        case .theme1:
            return Color(red: 237/255, green: 237/255, blue:237/255)
        case .theme2:
            return .red
        }
    }
    var onBoardColor:Color {
        switch self {
        case .theme1:
            return Color(red: 232/255, green: 235/255, blue:236/255)
        case .theme2:
            return .red
        }
    }
    
    var greenBackColor:Color {
        switch self {
        case .theme1:
            return Color(red: 133/255, green: 165/255, blue:158/255)
        case .theme2:
            return .red
        }
    }
    
   
    
    
    var textGrey: Color {
        switch self {
        case .theme1:
            return Color(red: 138/255, green: 142/255, blue:166/255)
        case .theme2:
            return .red
        }
    }
    
    var textboxBorderColor: Color {
        switch self {
        case .theme1:
            return Color(red: 156/255, green: 168/255, blue: 183/255)
        case .theme2:
            return .gray
        }
    }
    var redButtonColor: Color {
        switch self {
        case .theme1:
            return Color(red: 224/255, green: 72/255, blue: 79/255, opacity: 1.0)

        case .theme2:
            return .gray
        }
    }
    
    var textboxBorderColor2: Color {
        switch self {
        case .theme1:
            return  Color(red: 250/255, green: 250/255, blue: 252/255)

        case .theme2:
            return .gray
        }
    }
    var textboxBGColor: Color {
        switch self {
        case .theme1:
            return Color(red: 242/255, green: 244/255, blue:245/255)
        case .theme2:
            return .red
        }
    }
    var pickerGray: Color {
        switch self {
        case .theme1:
            return Color(red: 244/255, green: 244/255, blue:245/255)
        case .theme2:
            return .red
        }
    }
    var black: Color {
        switch self {
        case .theme1:
            return Color(red: 21/255, green: 21/255, blue: 21/255)
        case .theme2:
            return .red
        }
    }
    var checkBoxRed: Color {
        switch self {
        case .theme1:
            return Color(red: 252/255, green: 75/255, blue: 101/205)
        case .theme2:
            return .red
        }
    }
    var orangeSlide: Color {
        switch self {
        case .theme1:
            return Color(red: 249/255, green: 253/255, blue: 197/255, opacity: Double(0xAD) / 255.0)
        case .theme2:
            return .red
        }
    }
    var greenSlide: Color {
        switch self {
        case .theme1:
            return Color(red: 70/255, green: 165/255, blue: 70/255, opacity: Double(0x38) / 255.0)
        case .theme2:
            return .red
        }
    }
    var pinkSlide: Color {
        switch self {
        case .theme1:
            return Color(red: 221/255, green: 41/255, blue: 89/255,opacity: Double(0x29) / 255.0)
        case .theme2:
            return .red
        }
    }
    var greenText: Color {
        switch self {
        case .theme1:
            return  Color(red: 12/255, green: 63/255, blue: 20/255)
        case .theme2:
            return .red
        }
    }
    var greenLightText: Color {
        switch self {
        case .theme1:
            return Color(red: 93/255, green: 117/255, blue: 97/255, opacity: 1.0)
        case .theme2:
            return .red
        }
    }
   
    var greenBG:Color{
        switch self {
        case .theme1:
            return Color(red: 152/255, green: 185/255, blue: 157/255, opacity: 1)
        case .theme2:
            return .red
        }
    }
   
    
    var orange: Color {
        switch self {
        case .theme1:
            return Color(red: 250/255, green: 74/255, blue: 77/205)
        case .theme2:
            return .red
        }
    }

    
    var redSlide: Color {
        switch self {
        case .theme1:
            return Color(red: 0.98, green: 0.29, blue: 0.30)
        case .theme2:
            return .red
        }
    }
    
    var purpleSlide: Color {
        switch self {
        case .theme1:
            return Color(red: 0.77, green: 0.72, blue: 0.99)
        case .theme2:
            return .red
        }
    }

}
