//
//  ProfileView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var router: MainViewsRouter
    @StateObject var vmLogin:LoginViewModel
    @StateObject var vm = ProfileViewModel()
    let items = ["Öğe 1", "Öğe 2", "Öğe 3", "Öğe 4"]
    let itemsOther = ["Öğe 1", "Öğe 2"]
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ThemeColors.theme1.onBoardColor.edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack{
                        Text("Ben")
                            .font(.setCustomFont(name: .PoppinsRegular,size: 24))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    ScrollView( showsIndicators: false){
                        
                        VStack{
                            HStack(spacing: 20){
                                Image("userWomen")
                                    .padding(.horizontal)
                                
                                Text(vmLogin.savedEmail)
                                    .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .frame(width: geo.size.width - 20, height: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.top,20)
                        
                        VStack{
                            HStack(spacing: 20){
                                Image("takvim")
                                    .padding(.horizontal)
                                Spacer()
                                Text("Haftalık/Aylık Raporlar")
                                    .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                    .foregroundColor(.black)
                                    .padding(.trailing,60)
                                Spacer()
                            }
                        }
                        .frame(width: geo.size.width - 20, height: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.top,20)
                        
                        VStack{
                            VStack(spacing: 10){
                                Text("Madalyalarım")
                                    .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                    .foregroundColor(.black)
                                    .padding(.top,10)
                                Image("madalya")
                               
                                Spacer()
                            }
                        }
                        .frame(width: geo.size.width - 20, height: 100, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.top,20)
                        
                        HStack{
                            Text("Sağlık Verileri")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 14))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        .padding(.top,40)
                        VStack{
                            ForEach(vm.healtyItemList, id: \.self) { item in
                                HStack {
                                    Image(item.icon)
                                        .resizable()
                                        .frame(width: 22,height: 22)
                                        .foregroundColor(.gray)
                                    Text(item.name)
                                        .font(.setCustomFont(name: .PoppinsRegular,size: 12))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                    Divider()
                                        
                                }
                                .padding()
                                .contentShape(Rectangle())
                                Divider()
                                    .frame(height: 1)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(width: geo.size.width - 20, height: 270, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        
                        HStack{
                            Text("Diğer")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 14))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        .padding(.top,40)
                        VStack{
                            ForEach(vm.otherItemList, id: \.self) { item in
                                HStack {
                                    Image(item.icon)
                                        .resizable()
                                        .frame(width: 22,height: 22)
                                        .foregroundColor(.gray)
                                    Text(item.name)
                                        .font(.setCustomFont(name: .PoppinsRegular,size: 12))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                    Divider()
                                        
                                }
                                .padding()
                                .contentShape(Rectangle())
                                Divider()
                                    .frame(height: 1)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(width: geo.size.width - 20, height: 220, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        
                        MainButton(localizableText: "Çıkış", paddingHorizontal: 0, btnWidth: geo.size.width - 50, buttonFillColor: ThemeColors.theme1.redButtonColor,frameHeight: 42, radius: 12, enabled: { return true }) {
                            router.pushTo(view: MainNavigationView.builder.makeView(PreHomeView(), withNavigationTitle: "", navigationBarHidden: true,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                        }
                        .padding(.top,20)
                        
                    }

                    Spacer()
                    
                }
            }
            
        }
    }
}

#Preview {
    ProfileView(vmLogin: LoginViewModel())
}

