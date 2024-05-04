//
//  ForgotTextFields.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 21.04.2024.
//

import SwiftUI

struct ForgotTextFields: View {
    @StateObject var vm:LoginViewModel
    @State var isSecured : Bool = true
    @State var emailBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    var geo : GeometryProxy
    var reader: ScrollViewProxy
    var body: some View {
        VStack{
            HStack{
                Text("E-Mail Adresi")
                    .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                    .foregroundColor(.black)
                    .padding(.top,-34)
                    .padding(.leading,25)
                Spacer()
            }
            ENTextFieldWithLabelTop(height: 47,txtFieldText: $vm.forgotEmail,btnImageStyleLeft:.mailIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "E-Mail Adresi", topLabel: "E-Mail", borderColor : $emailBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.email, configuration: .init(keyboardType: .numberPad),systemImageName:"person.fill",systemImageWidth:12.0)
                .padding(.leading,22)
                .padding(.trailing,22)
                .id(1)
                .onTapGesture {
                    
                    withAnimation {
                        reader.scrollTo(1,anchor: .center)
                    }
                }.padding(.top,-24)

        }
    }
}

#Preview {
    GeometryReader { proxy in
        ScrollView {
            ScrollViewReader{ reader in
                ForgotTextFields(vm: LoginViewModel(), geo: proxy,reader: reader)
                    .padding(.top,250)
            }
        }
       
    }
}
