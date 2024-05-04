//
//  UIFont+Extension.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 18.04.2024.
//

import Foundation
import UIKit
import SwiftUI


public enum CustomFonts: String {
    case PoppinsBlack = "Poppins-Black"
    case PoppinsBlackItalic = "Poppins-BlackItalic"
    case PoppinsBold = "Poppins-Bold"
    case PoppinsBoldItalic = "Poppins-BoldItalic"
    case PoppinsExtraBold = "Poppins-ExtraBold"
    case PoppinsExtraBoldItalic = "Poppins-ExtraBoldItalic"
    case PoppinsExtraLight = "Poppins-ExtraLight"
    case PoppinsExtraLightItalic = "Poppins-ExtraLightItalic"
    case PoppinsItalic = "Poppins-Italic"
    case PoppinsLight = "Poppins-Light"
    case PoppinsLightItalic = "Poppins-LightItalic"
    case PoppinsMedium = "Poppins-Medium"
    case PoppinsMediumItalic = "Poppins-MediumItalic"
    case PoppinsRegular = "Poppins-Regular"
    case PoppinsSemiBold = "Poppins-SemiBold"
    case PoppinsSemiBoldItalic = "Poppins-SemiBoldItalic"
    case PoppinsThin = "Poppins-Thin"
    case PoppinsThinItalic = "Poppins-ThinItalic"

    case MontserratBlack = "Montserrat-Black"
    case MontserratBlackItalic = "Montserrat-BlackItalic"
    case MontserratBold = "Montserrat-Bold"
    case MontserratBoldItalic = "Montserrat-BoldItalic"
    case MontserratExtraBold = "Montserrat-ExtraBold"
    case MontserratExtraBoldItalic = "Montserrat-ExtraBoldItalic"
    case MontserratExtraLight = "Montserrat-ExtraLight"
    case MontserratExtraLightItalic = "Montserrat-ExtraLightItalic"
    case MontserratItalic = "Montserrat-Italic"
    case MontserratLight = "Montserrat-Light"
    case MontserratLightItalic = "Montserrat-LightItalic"
    case MontserratMedium = "Montserrat-Medium"
    case MontserratMediumItalic = "Montserrat-MediumItalic"
    case MontserratRegular = "Montserrat-Regular"
    case MontserratSemiBold = "Montserrat-SemiBold"
    case MontserratSemiBoldItalic = "Montserrat-SemiBoldItalic"
    case MontserratThin = "Montserrat-Thin"
    case MontserratThinItalic = "Montserrat-ThinItalic"
}


extension Font {
    public static func setCustomFont(name: CustomFonts, size: CGFloat = 14) -> Font {
        if name.rawValue == "Poppins-Bold"{
            let font = UIFont(name: "Poppins-Regular", size: size)!
            let desc = font.fontDescriptor
             let desc2 = desc.withSymbolicTraits(.traitBold)!
            let font2 = UIFont(descriptor: desc2, size: 0)
            return Font(font2)
        }
        let font = Font.custom(name.rawValue, size: size)
        return font
        }
}
extension UIFont {
    public static func setCustomUIFont(name: CustomFonts, size: CGFloat = 14) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}

