//
//  LaunchScreenAnimated.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//



import SwiftUI

struct LaunchScreenAnimated: View {
    @EnvironmentObject var router: MainViewsRouter
    var body: some View {
        VStack {
            Image(systemName: "applelogo") // İlk resim için sistem simgesi kullanımı
                .resizable()
                .frame(width: 225.33, height: 99.33)
                .aspectRatio(contentMode: .fit)
            HStack{
                Spacer()
                Image(systemName: "airplane") // İkinci resim için sistem simgesi kullanımı
                    .resizable()
                    .frame(width: 120, height: 50)
                    .padding(.trailing, 80)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, -15)
            }
        }
        .background(Color.white)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                router.pushTo(
                    view: MainNavigationView.builder.makeView(
                        MainView(), withNavigationTitle: "", navigationBarHidden: true,
                        backgroundImage: "", isShowRightButton: false, rightImage: ""))
            }
        })
        
    }
}

#Preview {
    LaunchScreenAnimated()
}
