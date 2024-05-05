//
//  HomeView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 4.05.2024.
//

import SwiftUI

struct PreHomeView: View {
    @StateObject var vm = PreHomeViewModel()
    @EnvironmentObject var router: MainViewsRouter
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
                    
                    Text("SMART KAMPUS")
                        .font(.setCustomFont(name: .PoppinsBold,size: 15))
                    
                    Spacer()
                    Button(action: {
                        ()
                    }, label: {
                        Image("notification")
                            .resizable()
                            .frame(width: 22, height: 22, alignment: .center)
                            .padding(.trailing, 20)
                    })
                   
                }
                .padding(.top,50)
               
                
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
                        
                        HStack(spacing:40){
                            Button(action: {
                                router.pushTo(view: MainNavigationView.builder.makeView(WebViewContainer(urlString: "https://www.dpu.edu.tr/"), withNavigationTitle: "Bize Ulaşın", navigationBarHidden: false,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                            }, label: {
                                VStack{
                                    Image("website")
                                        .resizable()
                                        .frame(width: 60, height: 60, alignment: .center)
                                    Text("Detaylı Bilgi")
                                        .font(.setCustomFont(name: .PoppinsMedium,size: 12))
                                        .foregroundColor(ThemeColors.theme1.black)
                                }
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(ThemeColors.theme1.greenBackColor, lineWidth: 2)
                                )
                            })

                            Button {
                                if let url = URL(string: "tel://02744434263") {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                VStack {
                                    Image("contactUs")
                                        .resizable()
                                        .frame(width: 60, height: 60, alignment: .center)
                                    Text("Bize Ulaşın")
                                        .font(.setCustomFont(name: .PoppinsMedium,size: 12))
                                        .foregroundColor(ThemeColors.theme1.black)
                                }
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(ThemeColors.theme1.greenBackColor, lineWidth: 2)
                                )
                            }


                        }
                    }
                    
                    .frame(width: geo.size.width - 60, height: 200)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 5) {
                                   ForEach(vm.ıtemsNameImageList, id: \.self) { item in
                                       ZStack {
                                           Image(item.image)
                                               .resizable()
                                               .frame(width: 200, height: 120, alignment: .center)
                                               
                                           VStack {
                                               Spacer()
                                               Text(item.name)
                                                   .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                                                   .foregroundColor(.black)
                                                   
                                               Spacer()
                                           }
                                          
                                       } .frame(width: 230, height: 150)
                                           .background(Color.white)
                                           .cornerRadius(20)
                                           .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                                       .padding()
                                      
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
    PreHomeView()
}
