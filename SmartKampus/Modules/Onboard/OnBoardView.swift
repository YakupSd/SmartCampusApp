//
//  OnBoardView.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 18.04.2024.
//
import SwiftUI

struct OnBoardView: View {
    // MARK: - Private properties:
    
    /// Feature that is currently shown:
    @State private var currentItem: OnboardingItem = .first
    @State private var isHomeViewActive = false
    @EnvironmentObject var router: MainViewsRouter
    
    let userManager = UserManager.shared
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .top){
                    HStack{
                        Image("pageImage")
                            .edgesIgnoringSafeArea(.all)
                        Spacer()
                    }
                    VStack {
                        skipButton
                        
                        Image("mainLogoColorfull")
                            .resizable()
                            .frame(width: geometry.size.width / 3.2, height: geometry.size.height / 4.5, alignment: .center)
                            .padding(.top,40)
                        VStack(spacing: 18) {
                            label(currentItem.title.uppercased(with: Locale(identifier: "tr_TR")))
                                .font(.setCustomFont(name: .PoppinsBold, size: 18))
                            
                            label(currentItem.text)
                                .font(.setCustomFont(name: .PoppinsRegular,size: 17))
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height / 6, alignment: .center)
                        .padding(.top,20)
                        
                        
                        Spacer()
                        
                        HStack{
                            Spacer()
                            Image(currentItem.image)
                                .resizable()
                                .frame(width: geometry.size.width / 2, height: 300, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                            
                                .padding(.top,20)
                            Spacer()
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(
                .linear(duration: 0.5),
                value: currentItem
            )
            .background(
                Color(currentItem.background)
                
            )
            .navigationBarHidden(true)
            .onTapGesture {
                next()
            }
        }
    }
    
    private var skipButton: some View {
        HStack {
            Spacer()
                    HStack {
                        Text("ATLA")
                            .font(.setCustomFont(name: .PoppinsSemiBold, size: 12))
                            .underline()
                            .foregroundColor(currentItem.labelColor)
                            .onTapGesture {
                                isHomeViewActive = true
                                userManager.setIsOnboarding()
                                router.pushTo(view: MainNavigationView.builder.makeView(HomeView(vm:HomeViewModel()), withNavigationTitle: "", navigationBarHidden: true,backgroundImage: "", isShowRightButton: false, rightImage: ""))
                            }
                        Image("rightdoublearrow")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 12)

        }
    }
    private func label(_ text: String) -> some View {
        Text(text)
            .foregroundColor(currentItem.labelColor)
            .multilineTextAlignment(.center)
        
    }
}

// MARK: - Functions:

private extension OnBoardView {
    
    // MARK: - Private functions:
    
    /// Moves the user to the next step:
    private func next() {
        
        /// Switching on the current feature shown to perform the right action:
        switch currentItem {
        case .first:
            /// Going to the next feature:
            currentItem = .second
            
        case .second:
            /// Going to the next feature:
            currentItem = .third
        case .third:
            /// Going to the next feature:
            isHomeViewActive = true
            router.pushTo(view: MainNavigationView.builder.makeView(HomeView(vm:HomeViewModel()), withNavigationTitle: "", navigationBarHidden: true,backgroundImage: "", isShowRightButton: false, rightImage: ""))
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
