//
//  LoginView.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 18.04.2024.
//


import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewModel()
    @EnvironmentObject var router: MainViewsRouter
    @State var showErrorPopUp:Bool = false
    @State var showSuccessPopUp:Bool = false
    var body: some View {
            GeometryReader { geo in
                ZStack(alignment: .top){
                    ThemeColors.theme1.mainBG.edgesIgnoringSafeArea(.all)
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
                                Text("Hoş Geldiniz")
                                    .foregroundColor(ThemeColors.theme1.greenText)
                                    .font(.setCustomFont(name: .PoppinsBold, size: 20))
                                    .padding(.top,50)
                                LoginTextFieldsView(vm:vm,geo:geo, reader: reader)
                                    .padding(.top,20)
                               
                                VStack(alignment:.trailing){
                                    ImageButton(localizableText: "Giriş Yap", paddingHorizontal: 12.0,btnWidth: geo.size.width - 45, textColor: .white, frameHeight: 47, txtPadding:10, mainFont: .setCustomFont(name: .PoppinsBold,size:15),enabled: vm.isValid, action: {
                                        router.pushTo(view: MainNavigationView.builder.makeView(TabbarView(), withNavigationTitle: "", navigationBarHidden: true,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                                       /*
                                        if  vm.loginUserName == vm.savedUserName && vm.loginPassword == vm.savedPassword {
                                          showSuccessPopUp = true
                                        }else {
                                            showErrorPopUp = true
                                        }
                                        */
                                       
                                    })
                                    .padding(.top,20)
                                    Button(action: {
                                        router.pushTo(view: MainNavigationView.builder.makeView(ForgotPassword(vm: vm), withNavigationTitle: "", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                                    }, label: {
                                        Text("Şifremi Unuttum")
                                            .font(.setCustomFont(name:.PoppinsMedium,size: 12))
                                            .foregroundColor(Color.black)
                                            .padding(.trailing,10)
                                    })
                                    
                                }
                                
                                HStack{
                                    Text("Hesabınız yok mu?")
                                        .font(.setCustomFont(name:.PoppinsMedium,size: 12))
                                        .foregroundColor(Color.black)
                                    Button(action: {
                                        router.pushTo(view: MainNavigationView.builder.makeView(SignInView(vm: vm), withNavigationTitle: "", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                                    }, label: {
                                        Text("Kayıt Ol")
                                            .font(.setCustomFont(name:.PoppinsMedium,size: 12))
                                            .foregroundColor(Color.green)
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
                    CustomMainPopUp(popUpImageName: .cancel, mainTitle: "Hata", secondTitle: "Kullanıcı bilgisi bulunamadı", showYesNoButton: true) {
                        ()
                    } actionSecond: {
                        showErrorPopUp = false
                    }.zIndex(1)
                        .animation(.easeInOut)

                }
                if showSuccessPopUp {
                    CustomMainPopUp(popUpImageName: .success, mainTitle: "Başarılı", secondTitle: "Sayfaya yönlendiriliyorsunuz", showYesNoButton: false) {
                        showSuccessPopUp = false
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
    LoginView()
}
