//
//  TextFieldKeyboardType.swift
//  KampusDestek
//
//  Created by Yakup Suda on 3.03.2024.
//

import SwiftUI
import Combine

struct TextFieldKeyboardType {
    var keyboardType: UIKeyboardType
}

struct TextFieldValidationType: Equatable {
    static let tc = TextFieldValidationType(maxLength: 11)
    static let userName = TextFieldValidationType(maxLength: 16)
    static let general = TextFieldValidationType(maxLength: 88)
    static let email = TextFieldValidationType(maxLength: 151)
    static let phone = TextFieldValidationType(maxLength: 17)
    static let password = TextFieldValidationType(maxLength: 12)
    static let none = TextFieldValidationType(maxLength: 100)
    var maxLength: Int
}

extension View {
    func validateText(_ text: Binding<String>, validationType: TextFieldValidationType,borderColor:Binding<Color>) -> some View {
        self.modifier(TextFieldValidationModifier(text: text, validationType: validationType,borderColor: borderColor))
    }
}

struct TextFieldValidationModifier: ViewModifier {
    @Binding var text: String
    let validationType: TextFieldValidationType
    @Binding var borderColor : Color
    func body(content: Content) -> some View {
        content
            .onReceive(Just(text)) { newText in
                switch validationType {
                case .tc:
                    if newText.count > validationType.maxLength {
                        text = String(newText.prefix(validationType.maxLength))
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }
                    if newText.count < validationType.maxLength  && newText.count > 0{
                        borderColor = .red
                    }
                    if newText.count == validationType.maxLength  {
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }
                case .userName:
                    if newText.count > validationType.maxLength {
                        text = String(newText.prefix(validationType.maxLength))
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    } else if newText.count <= 7 && newText.count > 0 {
                        borderColor = .red
                    } else {
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }
              
                case .general:
                    if newText.count > validationType.maxLength {
                        text = String(newText.prefix(validationType.maxLength))
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    } else {
                        borderColor = newText.count < 2 && newText.count > 0 ? .red : ThemeColors.theme1.textboxBorderColor
                    }

                
                case .phone:
                    text = formatPhoneNumber(newText)
                    if newText.count >= validationType.maxLength {
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }else if newText.count == 0{
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }else{
                        borderColor = .red
                    }
                    
               
                case .email:
                    let result = isValidEmail(newText)
                    if newText.count == 0{
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    } else if !result {
                        borderColor = .red
                    }
                    else{
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }
                case .password:
                    if newText.count > validationType.maxLength {
                        text = String(newText.prefix(validationType.maxLength))
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    } else if newText.count <= 7 && newText.count > 0 {
                        borderColor = .red
                    } else {
                        borderColor = ThemeColors.theme1.textboxBorderColor
                    }

                default:
                    ()
                }
            }
    }
    func isValidEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: candidate)
    }

    
    
    func isValidPlate(candidate: String) -> Bool {
            let pattern = "(0[1-9]|[1-7][0-9]|8[01])(([A-Z])(\\d{4,5})|([A-Z]{2})(\\d{3,4})|([A-Z]{3})(\\d{2,3}))"
            let predicate = NSPredicate(format: "self MATCHES [c] %@", pattern)
            return predicate.evaluate(with: candidate)
        }
    
    func formatPlateNo(_ value: String) -> (isValid: Bool, formattedPlate: String) {
        let cleanedValue = value.replacingOccurrences(of: " ", with: "").uppercased()

        if cleanedValue.count == 7 {
            let isValid = isValidPlate(candidate: cleanedValue)
            
            if isValid {
                print("Plaka doğru: \(cleanedValue)")
                return (isValid: true, formattedPlate: cleanedValue)
            } else {
                print("Geçersiz plaka: \(cleanedValue)")
                return (isValid: false, formattedPlate: cleanedValue)
            }
        } else {
            return (isValid: false, formattedPlate: cleanedValue)
        }
    }

    func formatPhoneNumber(_ number: String) -> String {
        var cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        if !cleanPhoneNumber.isEmpty && cleanPhoneNumber.first != "0" {
            cleanPhoneNumber.insert("0", at: cleanPhoneNumber.startIndex)
        }
        
        let mark = "X (XXX) XXX XX XX"
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        let endIndex = cleanPhoneNumber.endIndex
        
        for chart in mark where startIndex < endIndex {
            if chart == "X" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(chart)
            }
        }
        
        return result
    }
    func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: email)
   }


}

struct EmailValidator {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
