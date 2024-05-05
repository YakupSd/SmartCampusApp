//
//  MainTitleView.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 25.04.2024.
//


import SwiftUI


struct MainTitleView: View {
    var screenSize:CGSize = CGSize()
    var mainTitle :String
    @EnvironmentObject var router: MainViewsRouter
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: screenSize.width, height: 100)
                .background(Color.white)
                .overlay(
                    Rectangle()
                        .stroke(Color(red: 182.0 / 255.0, green: 197.0 / 255.0, blue: 213.0 / 255.0), lineWidth: 1.0)
                )
                .shadow(color: Color(white: 60.0 / 255.0, opacity: 0.14), radius: 10.0, x: 0.0, y: 5.0)
            
            
            HStack {
                Button(action: {
                    router.nav?.popViewController(animated: true)
                }) {
                    Image("leftArrow")
                        .foregroundColor(ThemeColors.theme1.textGrey)
                        .padding(.top,screenSize.width / 10)
                }
                
                Text(mainTitle)
                    .font(.setCustomFont(name: .PoppinsBold, size: 16))
                    .padding(.leading, 12)
                    .padding(.top,screenSize.width / 10)
                
                Spacer()
            }.padding(.leading,12)
            
        }
        .ignoresSafeArea(.container)
    }
}

#Preview {
    MainTitleView(screenSize: CGSize(width: 400, height: 20),mainTitle: "Deneme")
}
