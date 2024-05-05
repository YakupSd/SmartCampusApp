//
//  MainView.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 17.04.2024.
//
import SwiftUI

struct MainView: View {
    @State private var currentItem: OnboardingItem = .first
    @State private var isHomeViewActive = false
    @EnvironmentObject var router: MainViewsRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if UserManager.shared.isOnboarding() {
                    OnBoardView()
                       
                } else {
                    if !UserManager.shared.isLogin()  {
                        PreHomeView(vm: PreHomeViewModel())
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)
            .opacity(1.0)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    MainView()
}
