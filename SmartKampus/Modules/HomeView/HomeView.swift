//
//  HomeView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment:.top){
                ThemeColors.theme1.onBoardColor.edgesIgnoringSafeArea(.all)
                Image("circledesign")
                    .edgesIgnoringSafeArea(.all)
                    .padding(.top,-20)
                HStack{
                    Image("mainLogo")
                        .resizable()
                        .frame(width: geo.size.width / 5, height: geo.size.height / 6.3, alignment: .center)
                        .padding(.top,20)
                }
                VStack{
                    VStack {
                        ForEach(vm.homeButtonList.chunked(into: 2), id: \.self) { row in
                            HStack(spacing: 20) {
                                ForEach(row, id: \.self) { button in
                                    HomeViewButtonView(button: button)
                                }
                            }
                        }
                    }
                   

                       
                } .padding(.top,180)
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

#Preview {
    HomeView()
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct HomeViewButtonView: View {
    var button: HomeViewButton
    @State private var iconType: IconType = .running
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(button.icon)
               
                .padding(.leading, 90)
                .zIndex(1)

            VStack(alignment: .leading) {
                HStack{
                    Text(button.title)
                        .font(.setCustomFont(name: .PoppinsBold, size: 15))
                        .multilineTextAlignment(.center)
                        .frame(width: 80, height: 20, alignment: .center)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }

                Text(button.subTitle)
                    .font(.setCustomFont(name: .PoppinsRegular, size: 15))
                    .foregroundColor(.black)
                    .padding(.leading, 15)

                HStack {
                    Text("Detay")
                        .font(.setCustomFont(name: .PoppinsRegular, size: 11))
                        .foregroundColor(.black)
                        .padding(.leading, 15)

                    Image(systemName: "chevron.right.circle")
                        .foregroundColor(ThemeColors.theme1.greenText)
                }
                .padding(.top, 30)
                .onTapGesture {
                    self.iconType = button.type
                    switch self.iconType {
                    case .cycling:
                        // İşlem yapılacak kod buraya gelir
                        print("Cycling icon selected")
                    case .running:
                        // İşlem yapılacak kod buraya gelir
                        print("Running icon selected")
                    case .scooter:
                        // İşlem yapılacak kod buraya gelir
                        print("Scooter icon selected")
                    case .walking:
                        // İşlem yapılacak kod buraya gelir
                        print("Walking icon selected")
                    }
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 4)
            .background(Color.white.opacity(0.8))
            .cornerRadius(30)
        }
    }
}
