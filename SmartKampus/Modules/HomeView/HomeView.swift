//
//  HomeView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 4.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @EnvironmentObject var router: MainViewsRouter
    let items: [String] = ["Item 1", "Item 2", "Item 3"]
    var body: some View {
        GeometryReader { geo in
            ThemeColors.theme1.onBoardColor.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image("mainLogoColorfull")
                        .resizable()
                        .frame(width: geo.size.width / 8, height: geo.size.height / 10, alignment: .center)
                        .padding(.bottom,20)
                        .padding(.horizontal,20)
                    Spacer()
                }
               
                
                VStack{
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(ThemeColors.theme1.black)
                    Spacer()
                    
                    
                    HStack{
                        Button(action: {
                            router.pushTo(view: MainNavigationView.builder.makeView(LoginView(vm: LoginViewModel()), withNavigationTitle: "", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                        }, label: {
                            Text("Akıllı çözümler için\nGiriş Yap")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                                .foregroundColor(ThemeColors.theme1.greenText.opacity(0.7))
                                .multilineTextAlignment(.leading)
                            .padding(.leading,10)
                            Spacer()
                            Image("rightCircle")
                            .padding(.trailing,20)
                        })
                        
                    }
                    .frame(width: geo.size.width - 60, height: 100)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    .padding()
                    
                    VStack{
                        Text("Akıllı Kampüs Uygulamasına Hoş Geldiniz")
                            .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                            .foregroundColor(ThemeColors.theme1.greenText.opacity(0.7))
                            .multilineTextAlignment(.leading)
                    }
                    
                    .frame(width: geo.size.width - 60, height: 200)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 5) {
                                   ForEach(items, id: \.self) { item in
                                       VStack {
                                           Text(item)
                                               .padding()
                                       }
                                       .frame(width: 230, height: 150)
                                       .background(Color.white)
                                       .cornerRadius(20)
                                       .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                                       .padding()
                                       .zIndex(item == "Item 2" ? 1 : 0)
                                   }
                               }
                           }
                    
                    
                    
                }.frame(width: geo.size.width, height: 600)
                    .background(ThemeColors.theme1.greenBackColor)
            }
        }
    }
}

#Preview {
    HomeView()
}
