//
//  AsistanView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import SwiftUI

struct AsistanView: View {
    @EnvironmentObject var router: MainViewsRouter
    @State var show:Bool = false
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment:.top){
                ThemeColors.theme1.onBoardColor.edgesIgnoringSafeArea(.all)
                Image("circledesign2")
                .edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack{
                        Image("chat")
                            .padding(.horizontal)
                        Text("Smart Kampüs Asistan")
                            .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                            .foregroundColor(.white)
                        
                        Spacer()

                        
                    }.padding(.top,10)
                        .padding(.horizontal,20)
                    
                    
                    HStack{
                        Image("chat")
                            .resizable()
                            .frame(width: 23, height: 23, alignment: .center)
                            .padding(.horizontal)
                            
                        Text("Smart Kampüs Asistan")
                            .font(.setCustomFont(name: .PoppinsRegular,size: 10))
                            .foregroundColor(.black)
                        
                        Spacer()
                       
                    }.padding(.top,20)
                        .padding(.horizontal,30)
                    
                    VStack{
                        HStack(spacing: 0){
                           
                            Text("Merhaba İrem Nur,ben Smart Kampüs Asistan.")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                .foregroundColor(.black)
                            
                        }
                    }
                   
                    .frame(width: geo.size.width - 60, height: 50, alignment: .center)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top,20)
                    
                    VStack{
                        HStack(spacing: 0){
                           
                            Text("İstediğin soruyu sorabilir veya ne yapmak istediğini yazabilirsin. ")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                .foregroundColor(.black)
                        }
                    }
                   
                    .frame(width: geo.size.width - 60, height: 50, alignment: .center)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top,20)
                    
                    
                    VStack{
                        HStack(spacing: 0){
                           
                            Text("Nagihan Yağmur adlı hocanın Mail adresi")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                .foregroundColor(.black)
                            
                        }
                    }
                    
                    .frame(width: geo.size.width - 80, height: 50, alignment: .center)
                    .background(ThemeColors.theme1.greenBG)
                    .cornerRadius(10)
                    .padding(.top,20)
                    .padding(.leading,60)
                    .opacity(show ? 1 : 0)
                    
                    VStack{
                        HStack(spacing: 0){
                           
                            Text("nagihan.yagmur@ogr.edu.dpu.tr ")
                                .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                .foregroundColor(.black)
                        }
                    }
                   
                    .frame(width: geo.size.width - 60, height: 50, alignment: .center)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top,20)
                    .opacity(show ? 1 : 0)
                    
                    Spacer()
                    
                    VStack{
                        HStack(alignment: .center, spacing: 10){
                            HStack(spacing: 0){
                                
                                Text(!show ? "Nagihan Yağmur adlı hocanın Mail adresi" : "")
                                    .font(.setCustomFont(name: .PoppinsRegular,size: 11))
                                    .foregroundColor(.black)
                                
                            }
                            .frame(width: geo.size.width - 80, height: 50, alignment: .center)
                            .background(.gray.opacity(0.4))
                            .cornerRadius(10)
                            .padding(.top,20)
                            
                            Image("send")
                                .resizable()
                                .frame(width: 33, height: 33, alignment: .center)
                                .onTapGesture {
                                    show = true
                                }
                                .padding(.top,20)
                        }
                    }
                    .frame(width: geo.size.width, height: 120, alignment: .center)
                    .background(.white)
                    .cornerRadius(10)
                   
                   
                    
                }
            }
           
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

#Preview {
    AsistanView()
}
