//
//  SignInView.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 21.04.2024.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var router: MainViewsRouter
    @StateObject var vm:LoginViewModel
    @State var showErrorPopUp:Bool = false
    @State var showSuccessPopUp:Bool = false
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top){
                ThemeColors.theme1.mainBG.edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                    HStack{
                        Image("pageImage")
                            .edgesIgnoringSafeArea(.all)
                        Spacer()
                    }
                VStack(alignment: .center){
                    Image("mainLogoColorfull")
                        .resizable()
                        .frame(width: geo.size.width / 5, height: geo.size.height / 6, alignment: .center)
                        .padding(.top,110)
                    ScrollView(.vertical){
                        
                        ScrollViewReader{ reader in
                            Text("Kayıt Ol")
                                .foregroundColor(ThemeColors.theme1.greenText)
                                .font(.setCustomFont(name: .PoppinsBold, size: 20))
                                .padding(.top,50)
                            SignInTextFields(vm: vm, geo:geo, reader: reader)
                                .padding(.top,20)
                            
                            VStack(alignment:.trailing){
                                ImageButton(localizableText: "Kayıt Ol", paddingHorizontal: 12.0,btnWidth: geo.size.width - 45, textColor: .white, frameHeight: 47, txtPadding:10, mainFont: .setCustomFont(name: .PoppinsBold,size:15),enabled: vm.singInIsValid, action: {
                                    if EmailValidator.isValidEmail(vm.singEmail) {
                                        showSuccessPopUp = true
                                    }else {
                                        showErrorPopUp = true
                                    }
                                })
                                .padding(.top,20)
                            }
                            
                            HStack{
                                Text("Hesabınız var mı?")
                                    .font(.setCustomFont(name:.PoppinsMedium,size: 12))
                                    .foregroundColor(Color.black)
                                
                                Button(action: {
                                    router.pushTo(view: MainNavigationView.builder.makeView(LoginView(vm: vm), withNavigationTitle: "", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                                }, label: {
                                    Text("Giriş Yap")
                                        .font(.setCustomFont(name:.PoppinsMedium,size: 12))
                                        .foregroundColor(ThemeColors.theme1.greenText.opacity(0.5))
                                })
                                
                                
                            }
                            .padding(.top,20)
                        }
                    }
                    .frame(width: geo.size.width, height:geo.size.height - 250)
                    .padding(.bottom,24)
                    .padding(.top,40)
                    
                }
            }
            if showErrorPopUp {
                CustomMainPopUp(popUpImageName: .cancel, mainTitle: "Hata", secondTitle: "Kullanıcı Kayıt edilemedi, lütfen yeniden deneyiniz!", showYesNoButton: true) {
                    ()
                } actionSecond: {
                    showErrorPopUp = false
                }.zIndex(1)
                    .animation(.easeInOut)
                
            }
            if showSuccessPopUp {
                CustomMainPopUp(popUpImageName: .success, mainTitle: "Başarılı", secondTitle: "Ana sayfaya yönlendiriliyorsunuz", showYesNoButton: false) {
                    
                    vm.savedUserName = vm.singUserName
                    vm.savedPassword = vm.singPassword
                    vm.savedEmail = vm.singEmail
                    
                    vm.saveUserDetail()
                    showSuccessPopUp = false
                    
                    router.pushTo(view: MainNavigationView.builder.makeView(LoginView(vm: vm), withNavigationTitle: "", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                    
                    print("Giriş Başarılı")
                } actionSecond: {
                    ()
                }.zIndex(1)
                    .animation(.easeInOut)
            }
        }
    }
}

#Preview {
    SignInView(vm: LoginViewModel())
}
