//
//  CustomMainPopUp.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 4.05.2024.
//

import SwiftUI

struct CustomMainPopUp: View {
    var popUpImageName: PopUpImageName = PopUpImageName.success
    var mainTitle:String = "Başarılı"
    var secondTitle:String = "Giriş başarıyla tamamlanmıştır."
    var showYesNoButton:Bool = false
    var actionOne: () -> (Void) = {}
    var actionSecond: () -> (Void) = {}
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 67)
                            .foregroundColor(.white)
                        Image(popUpImageName.rawValue)
                            .resizable()
                            .frame(width: 90, height: 90, alignment: .center)
                            .padding(.top,-190)
                        
                        VStack(alignment:.center){
                            
                            Text(mainTitle)
                                .foregroundColor(ThemeColors.theme1.black)
                                .font(.setCustomFont(name: .PoppinsBold,size: 32))
                            
                            Text(secondTitle)
                                .foregroundColor(ThemeColors.theme1.black)
                                .font(.setCustomFont(name: .PoppinsRegular,size: 15))
                                .padding(.top,20)
                                
                            if !showYesNoButton{
                                MainButton(localizableText: "Tamam", paddingHorizontal: 50, btnWidth: 130, buttonFillColor: ThemeColors.theme1.greenBG, lineWidth: 0,  frameHeight: 42, radius: 22) {
                                    return true
                                } action: {
                                    actionOne()
                                }
                                .padding(.top,30)
                               

                            }else {
                                HStack(spacing: 20){
                                    MainButton(localizableText: "Yeniden Dene", paddingHorizontal: 0, btnWidth: 130, buttonFillColor: ThemeColors.theme1.redButtonColor, lineWidth: 0,  frameHeight: 42, radius: 22) {
                                        return true
                                    } action: {
                                        actionOne()
                                    }
                                    MainButton(localizableText: "Tamam", paddingHorizontal: 0, btnWidth: 130, buttonFillColor: ThemeColors.theme1.greenBG, lineWidth: 0,  frameHeight: 42, radius: 22) {
                                        return true
                                    } action: {
                                        actionSecond()
                                    }
                                } .padding(.top,30)
                            }
                               
                           

                        } .padding(.horizontal, 22)
                            .padding(.top,30)
                       
                    }
                    .frame(width: geometry.size.width - 30, height:  geometry.size.height / 2.7)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .opacity(1)
        .animation(.easeInOut(duration: 0.5))
       
    }
}

#Preview {
    CustomMainPopUp()
}
enum PopUpImageName: String {
    case none = ""
    case success = "successIcon"
    case info = "infoIcon"
    case cancel = "cancelIcon"
   
}
