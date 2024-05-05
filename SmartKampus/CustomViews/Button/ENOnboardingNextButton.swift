//
//  CustomOnboardingNextButton.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 18.04.2024.
//
import SwiftUI

struct ENOnboardingNextButton: View {
    // MARK: - Private properties:
    
    /// Title of the button:
    private var title: String
    
    /// Color of the button title:
    private var color: Color
    
    /// Font of the button:
    private var font: Font
    
    /// Background color of the button:
    private var backgroundColor: Color
    
    /// Corner radius of the button:
    private var cornerRadius: Double
    
    /// 'Bool' value indicating whether or not the button should be disabled:
    private var isDisabled: Bool
    
    /// Action of the button:
    private var action: () -> Void
    
    init(
        title: String,
        color: Color = .white,
        font: Font = .body,
        backgroundColor: Color,
        cornerRadius: Double = 10.0,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.color = color
        self.font = font
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.isDisabled = isDisabled
        self.action = action
    }
    
    
    var body: some View {
        Button {
            action()
        } label: {
            titleLabel
        }
        .disabled(isDisabled)
    }
    
    private var titleLabel: some View {
        Text(title)
            .font(font)
            .foregroundColor(color)
            .frame(
                maxWidth: 164,
                maxHeight: 42,
                alignment: .center
            )
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ENOnboardingNextButton(title: "İLERİ", backgroundColor: .red) {
            
        }
    }
}
