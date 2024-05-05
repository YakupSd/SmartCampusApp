//
//  SignInTextFields.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 21.04.2024.
//

import SwiftUI

struct SignInTextFields: View {
    @StateObject var vm:LoginViewModel
    @State var isSecured : Bool = true
    @State var userNameBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    @State var emailBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    @State var passwordBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    var geo : GeometryProxy
    var reader: ScrollViewProxy
    var body: some View {
        VStack(spacing:40){
            VStack{
                HStack{
                    Text("Kullanıcı Adı")
                        .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                        .foregroundColor(.black)
                        .padding(.top,-34)
                        .padding(.leading,25)
                    Spacer()
                }
                ENTextFieldWithLabelTop(height: 47,txtFieldText: $vm.singUserName, btnImageStyleLeft:.userIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Kullanıcı Adı", topLabel: "Kullanıcı Adı", borderColor : $userNameBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.userName, configuration: .init(keyboardType: .default),systemImageName:"person.fill",systemImageWidth:12.0)
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
                    Text("E-Mail Adresi")
                        .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                        .foregroundColor(.black)
                        .padding(.top,-34)
                        .padding(.leading,25)
                    Spacer()
                }
                ENTextFieldWithLabelTop(height: 47,txtFieldText: $vm.singEmail,btnImageStyleLeft:.mailIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "E-Mail Adresi", topLabel: "E-Mail", borderColor : $emailBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.email, configuration: .init(keyboardType: .default),systemImageName:"person.fill",systemImageWidth:12.0)
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
                    Text("Şifre")
                        .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                        .foregroundColor(.black)
                        .padding(.top,-34)
                        .padding(.leading,25)
                    Spacer()
                }
                ENTextFieldWithLabelTop(isSecureField: isSecured,height: 47,txtFieldText: $vm.singPassword,btnImageStyleLeft:.passIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Şifre", topLabel: "Şifre", borderColor : $passwordBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.password, configuration: .init(keyboardType: .numberPad),systemImageName:"person.fill",systemImageWidth:12.0)
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

struct SignInTextFields_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            ScrollView {
                ScrollViewReader{ reader in
                    SignInTextFields(vm: LoginViewModel(), geo: proxy,reader: reader)
                        .padding(.top,250)
                }
            }
           
        }
     }
 }
