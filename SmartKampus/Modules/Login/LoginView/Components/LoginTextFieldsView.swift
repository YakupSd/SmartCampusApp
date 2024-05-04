//
//  LoginTextFieldsView.swift
//  KampusDestek
//
//  Created by Yakup Suda on 3.03.2024.
//


import SwiftUI

struct LoginTextFieldsView: View {
    @StateObject var vm:LoginViewModel
    @State var isSecured : Bool = true
    @State var userNameBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    @State var passwordBorderColor : Color = ThemeColors.theme1.textboxBorderColor
    @State var username: String = ""
    @State var password: String = ""

    var geo : GeometryProxy
    var reader: ScrollViewProxy
    var body: some View {
        VStack{
            HStack{
                Text("Kullanıcı Adı")
                    .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                    .foregroundColor(.black)
                    .padding(.top,-34)
                    .padding(.leading,25)
                Spacer()
            }
          
            ENTextFieldWithLabelTop(height: 47,txtFieldText: $vm.loginUserName, btnImageStyleLeft:.userIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:false, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Kullanıcı Adı", topLabel: "Kullanıcı Adı", borderColor : $userNameBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.userName, configuration: .init(keyboardType: .numberPad),systemImageName:"person.fill",systemImageWidth:12.0)
                .padding(.leading,22)
                .padding(.trailing,22)
                .id(1)
                .onTapGesture {
                    
                    withAnimation {
                        reader.scrollTo(1,anchor: .center)
                    }
                }.padding(.top,-24)

          
            HStack{
                Text("Şifre")
                    .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                    .foregroundColor(.black)
                    .padding(.bottom,-10)
                    .padding(.leading,25)
                Spacer()
            }
            ENTextFieldWithLabelTop(isSecureField: isSecured, height: 47,txtFieldText: $vm.loginPassword,btnImageStyleLeft:.passIcon, btnImageStyleRight:.none, showTopLabel:false,showRightButton:true, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Şifre", topLabel: "Şifre", borderColor : $passwordBorderColor,mainBG:Color.white, topLabelRatio: -145,validationType:.password, configuration: .init(keyboardType: .numberPad),systemImageName:"person.3.fill",systemImageWidth:15.0,action:{
                isSecured.toggle()
            })
                .padding(.leading,22)
                .padding(.trailing,22)
                .id(2)
                .onTapGesture {
                    withAnimation {
                        reader.scrollTo(2,anchor: .top)
                    }
                }.padding(.top,8)
        }.onAppear{
            vm.loginUserName = ""
            vm.loginPassword = ""
            userNameBorderColor = ThemeColors.theme1.textboxBorderColor
            passwordBorderColor = ThemeColors.theme1.textboxBorderColor
        }
    }
}

struct LoginTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            ScrollView {
                ScrollViewReader{ reader in
                    LoginTextFieldsView(vm:LoginViewModel(),geo: proxy,reader: reader)
                        .padding(.top,250)
                }
            }
           
        }
     }
 }
