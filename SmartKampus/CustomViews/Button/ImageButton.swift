//
//  ImageButton.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 25.04.2024.
//

import SwiftUI

struct ImageButton: View {
    var localizableText = "localizableText"
    var paddingHorizontal = 10.0
    var btnWidth = 300.0
    //@State var enabled = false
    @State var textColor: Color = .white
    @State var frameHeight: CGFloat = 47
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
                ZStack {
                    Image("greenButton")
                        .resizable()
                        .frame(width: btnWidth, height: frameHeight)
                    Text(localizableText)
                        .font(mainFont)
                        .foregroundColor(textColor)
                        .padding(.trailing,txtPadding)
                        .padding(.leading,txtPadding)
                }
               
            }
            
        }
        .opacity(enabled() ? 1: 0.5)
        .padding(.horizontal, paddingHorizontal)
        .disabled(!enabled() || isDisabled)
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton()
    }
}
