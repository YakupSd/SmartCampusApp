//
//  ENNavigationBarCompleted.swift
//  KampusDestek
//
//  Created by Yakup Suda on 6.03.2024.
//

import SwiftUI


struct ENNavigationBarCompleted: View {
    var screenSize:CGSize = CGSize()
    var isLogged: Bool
    @EnvironmentObject var router: MainViewsRouter


    var body: some View {
            HStack {
                Image("mainLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenSize.width / 4, height: screenSize.height / 12)
                   
               
                Text("Kampüs Destek")
                    .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                    .foregroundColor(.black)
                Spacer()
                
            }
            
            .padding()
            .background(Color.white)
            .shadow(color: Color.black, radius: 1, x: 0, y: 1)
        
    }
}


#Preview {
    ENNavigationBarCompleted(screenSize: CGSize(width: 400, height: 300), isLogged: false)
}
