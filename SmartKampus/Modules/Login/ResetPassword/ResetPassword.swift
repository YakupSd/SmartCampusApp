//
//  ResetPassword.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 21.04.2024.
//

import SwiftUI

struct ResetPassword: View {
    @EnvironmentObject var router: MainViewsRouter
    @StateObject var vm:LoginViewModel
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
                                Text("ŞİFREMİ YENİLE")
                                    .foregroundColor(ThemeColors.theme1.greenText)
                                    .font(.setCustomFont(name: .PoppinsBold, size: 20))
                                    .padding(.top,50)
                                
                                Text("Lütfen şifrenizi en az 8 karakterden olacak.\nEn az 1 adet büyük harf ve rakam içerecek şekilde giriniz.")
                                    .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.top,1)
                                ResetPassTextFields(vm: vm, geo:geo, reader: reader)
                                    .padding(.top,50)
                                
                                VStack(alignment:.trailing){
                                    ImageButton(localizableText: "Şifremi Yinele", paddingHorizontal: 12.0,btnWidth: geo.size.width - 45, textColor: .white, frameHeight: 47, txtPadding:10, mainFont: .setCustomFont(name: .PoppinsBold,size:15),enabled: vm.resetPassIsValid, action: {
                                        if vm.resetPassword == vm.resetPasswordAgain {
                                          
                                            vm.savedPassword = vm.resetPassword
                                            vm.saveUserDetail()
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
                    CustomMainPopUp(popUpImageName: .cancel, mainTitle: "Hata", secondTitle: "Şifreler eşleşmedi", showYesNoButton: true) {
                        ()
                    } actionSecond: {
                        showErrorPopUp = false
                    }.zIndex(1)
                        .animation(.easeInOut)

                }
                if showSuccessPopUp {
                    CustomMainPopUp(popUpImageName: .success, mainTitle: "Başarılı", secondTitle: "Sayfaya yönlendiriliyorsunuz", showYesNoButton: false) {
                        vm.savedPassword = vm.resetPassword
                        showSuccessPopUp = false
                        router.pushTo(view: MainNavigationView.builder.makeView(LoginView(vm: vm), withNavigationTitle: "", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                    } actionSecond: {
                        ()
                    }.zIndex(1)
                        .animation(.easeInOut)
                }
                
            }
        }
}

#Preview {
    ResetPassword(vm: LoginViewModel())
}
