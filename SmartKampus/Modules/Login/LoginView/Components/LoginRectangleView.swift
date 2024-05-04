//
//  LoginRectangleView.swift
//  KampusDestek
//
//  Created by Yakup Suda on 6.03.2024.
//

import SwiftUI

struct LoginRectangleView: View {
    @StateObject var vm:LoginViewModel
    @EnvironmentObject var router: MainViewsRouter
    var screenSize: CGSize = CGSize()
    var greenLightText:Color = ThemeColors.theme1.greenLightText
    @State var navigateScreenName = ""
    @State var maskPhoneNumber = ""
    @State var identityNumber = ""
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(
                        width: screenSize.width - 50,
                        height: screenSize.height/8
                    )
                    .background(
                        Color.white
                            .cornerRadius(20)
                    )
                    .onTapGesture {
                        router.pushTo(view: MainNavigationView.builder.makeView(LoginView(vm:vm), withNavigationTitle: "", navigationBarHidden: true,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                    }
                    .foregroundColor(.clear)
                VStack(alignment: .leading){
                    Text("Dijital Ajandan İçin")
                        .font(.setCustomFont(name: .PoppinsSemiBold, size: 10))
                        .foregroundColor(greenLightText)
                        .padding(.trailing, screenSize.width/2 - 20)
                       
                    Text("Giriş yap")
                        .font(.setCustomFont(name: .PoppinsSemiBold, size: 15))
                        .foregroundColor(greenLightText)
                       
                      
                }
                Spacer()
                HStack {
                    Button(action: {
                        router.pushTo(view: MainNavigationView.builder.makeView(LoginView(vm:vm), withNavigationTitle: "", navigationBarHidden: true,backgroundImage: "", isShowRightButton: false, rightImage: ""))

                    }) {
                        ZStack{
                            Image("singlearrowGreen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white) // Ok rengini belirleyebilirsiniz
                            
                        }
                    }
                }
                .padding(.leading, screenSize.width/2 + 60)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginRectangleView(vm: LoginViewModel(), screenSize: CGSize(width: 400, height: 200))
}
