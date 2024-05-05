//
//  ForgotPassword.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 21.04.2024.
//

import SwiftUI

struct ForgotPassword: View {
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
                            Text("ŞİFREMİ UNUTTUM")
                                .foregroundColor(ThemeColors.theme1.greenText)
                                .font(.setCustomFont(name: .PoppinsBold, size: 20))
                                .padding(.top,50)
                            
                            Text("Lütfen kayıtlı olduğunuz e-mail adresinizi girin.Sonrasında\notomatik olarak şifre yenileme ekranına yönlendirileceksiniz. ")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.top,1)
                            ForgotTextFields(vm: vm, geo:geo, reader: reader)
                                .padding(.top,50)
                            
                            VStack(alignment:.trailing){
                                ImageButton(localizableText: "Gönder", paddingHorizontal: 12.0,btnWidth: geo.size.width - 45, textColor: .white, frameHeight: 47, txtPadding:10, mainFont: .setCustomFont(name: .PoppinsBold,size:15),enabled: vm.forgotIsValid, action: {
                                       
                                        if vm.forgotEmail == vm.savedEmail {
                                            showSuccessPopUp = true
                                        }else {
                                            showErrorPopUp = true
                                        }
                                })
                                .padding(.top,20)
                            }
                        }
                    }
                    .frame(width: geo.size.width, height:geo.size.height - 250)
                    .padding(.bottom,24)
                    .padding(.top,40)
                    
                }
            }
            if showErrorPopUp {
                CustomMainPopUp(popUpImageName: .cancel, mainTitle: "Hata", secondTitle: "E-Posta bilgisi Hatalı", showYesNoButton: true) {
                    ()
                } actionSecond: {
                    showErrorPopUp = false
                }.zIndex(1)
                    .animation(.easeInOut)

            }
            if showSuccessPopUp {
                CustomMainPopUp(popUpImageName: .success, mainTitle: "Başarılı", secondTitle: "Sayfaya yönlendiriliyorsunuz", showYesNoButton: false) {
                    showSuccessPopUp = false
                    router.pushTo(view: MainNavigationView.builder.makeView(ResetPassword(vm: vm), withNavigationTitle:" ", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                } actionSecond: {
                    ()
                }.zIndex(1)
                    .animation(.easeInOut)
            }
        }
    }
}

#Preview {
    ForgotPassword(vm:LoginViewModel())
}
