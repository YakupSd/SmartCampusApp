//
//  MainButton.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 18.04.2024.
//

import Foundation
import SwiftUI


struct MainButton: View {
    var localizableText = "localizableText"
    var paddingHorizontal = 10.0
    var btnWidth = 10.0
    //@State var enabled = false
    @State var buttonFillColor:Color = ThemeColors.theme1.redSlide
    @State var lineWidth: CGFloat = 0
    @State var strokeColor: Color = .white
    @State var textColor: Color = .white
    @State var frameHeight: CGFloat = 47
    @State var radius: CGFloat = 10
    @State var txtPadding : CGFloat = 12.0
    @State var mainFont:Font = .setCustomFont(name: .PoppinsBold, size: 14)
    @State var enabled : () -> (Bool) = {return true} // validasyonlar için
    @State private var isDisabled = false // çoklu basmaları engellemek için
    var action: () -> (Void) = {}
    var body: some View {
        HStack {
            Button(action: {
                debugPrint("\(localizableText) Tapped")
                if !isDisabled {
                    isDisabled = true
                    action()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute:{
                        isDisabled = false
                    })
                }
            }) {
                Text(localizableText)
                    .font(mainFont)
                    .foregroundColor(textColor)
                    .padding(.trailing,txtPadding)
                    .padding(.leading,txtPadding)
            }
            
        }
        .frame(width : btnWidth ,height: frameHeight)
        .background(buttonFillColor)

        .opacity(enabled() ? 1: 0.5)
        .cornerRadius(radius)
        .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(strokeColor, lineWidth: lineWidth)
            )
        .padding(.horizontal, paddingHorizontal)
        .disabled(!enabled() || isDisabled)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton()
    }
}
