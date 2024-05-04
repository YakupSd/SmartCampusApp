//
//  ResetPassTextFields.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 21.04.2024.
//
import SwiftUI

struct ResetPassTextFields: View {
    @StateObject var vm:LoginViewModel
    @State var isSecured : Bool = true
    @State var passBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    @State var passAgainBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    var geo : GeometryProxy
    var reader: ScrollViewProxy
    var body: some View {
        VStack(spacing:40){
            VStack{
                HStack{
                    Text("Şifre")
                        .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                        .foregroundColor(.black)
                        .padding(.top,-34)
                        .padding(.leading,25)
                    Spacer()
                }
                ENTextFieldWithLabelTop(isSecureField: isSecured,height: 47,txtFieldText: $vm.resetPassword, btnImageStyleLeft:.passIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Şifre Giriniz", topLabel: "Şifre", borderColor : $passBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.password, configuration: .init(keyboardType: .numberPad),systemImageName:"person.3.fill",systemImageWidth:12.0)
                    .padding(.leading,22)
                    .padding(.trailing,22)
                    .id(1)
                    .onTapGesture {
                        
                        withAnimation {
                            reader.scrollTo(1,anchor: .center)
                        }
                    }.padding(.top,-24)

            }
            VStack{
                HStack{
                    Text("Şifre Tekrarı")
                        .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                        .foregroundColor(.black)
                        .padding(.top,-34)
                        .padding(.leading,25)
                    Spacer()
                }
                ENTextFieldWithLabelTop(isSecureField: isSecured,height: 47,txtFieldText: $vm.resetPasswordAgain, btnImageStyleLeft:.passIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Şifrenizi Yeniden Giriniz", topLabel: "Şifre Tekrarı", borderColor:$passAgainBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.password, configuration: .init(keyboardType: .numberPad),systemImageName:"person.3.fill",systemImageWidth:12.0)
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
}

#Preview {
    GeometryReader { proxy in
        ScrollView {
            ScrollViewReader{ reader in
                ResetPassTextFields(vm: LoginViewModel(), geo: proxy,reader: reader)
                    .padding(.top,250)
            }
        }
       
    }
}
