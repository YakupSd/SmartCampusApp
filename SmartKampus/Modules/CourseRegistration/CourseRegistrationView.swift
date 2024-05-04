//
//  CourseRegistrationView.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 24.04.2024.
//

import SwiftUI

struct CourseRegistrationView: View {
    
    
    
    @State var chooseCourseBG : Color = ThemeColors.theme1.textboxBorderColor
    @State var selectedDateBG : Color = ThemeColors.theme1.textboxBorderColor
    @State var categoryBG : Color = ThemeColors.theme1.textboxBorderColor
    @State var startClockBG : Color = ThemeColors.theme1.textboxBorderColor
    @State var endClockBG: Color = ThemeColors.theme1.textboxBorderColor
   

    
    @State var chooseCourseName : String = ""
    @State var categoryName : String = ""
    @State var selectedDate : String = ""
    @State var startTime : String = ""
    @State var endTime : String = ""
    
    
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing:10){
                VStack(alignment:.leading){
                    Text("Ders Seç")
                        .font(.setCustomFont(name: .PoppinsMedium,size: 9))
                        .foregroundColor(ThemeColors.theme1.black)
                        .padding(.leading,30)
                    
                    ENTextFieldWithLabelTop(height: 47,txtFieldText: $chooseCourseName,btnImageStyleLeft:.lesson, btnImageStyleRight:.arrowDown, showTopLabel:false,showRightButton:true,showLeftImage:true,showNotSystemImage:true, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Dersin Adı", topLabel: "Dersin Adı", borderColor : $chooseCourseBG,mainBG:Color.white, topLabelRatio: -145,validationType:.none, configuration: .init(keyboardType: .default))
                        .padding(.leading,22)
                        .padding(.trailing,22)
                        .id(1)
                        .onTapGesture {
                            //Sayfa yönelendirmasi buraya gelecek
                        }
                        
                }
                .padding(.top,90)
                
                VStack(alignment:.leading) {
                    Text("Tarih")
                        .font(.setCustomFont(name: .PoppinsMedium,size: 9))
                        .foregroundColor(ThemeColors.theme1.black)
                        .padding(.leading,30)
                    
                    ENTextFieldWithLabelTop(height: 47,txtFieldText: $selectedDate,btnImageStyleLeft:.date, btnImageStyleRight:.arrowDown, showTopLabel:false,showRightButton:true,showLeftImage:true,showNotSystemImage:true, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Tarih", topLabel: "Tarih", borderColor : $selectedDateBG,mainBG:Color.white, topLabelRatio: -145,validationType:.none, configuration: .init(keyboardType: .default))
                        .padding(.leading,22)
                        .padding(.trailing,22)
                        .id(1)
                }
                
                VStack(alignment:.leading) {
                    Text("Kategori")
                        .font(.setCustomFont(name: .PoppinsMedium,size: 9))
                        .foregroundColor(ThemeColors.theme1.black)
                        .padding(.leading,30)
                    
                    ENTextFieldWithLabelTop(height: 47,txtFieldText: $categoryName,btnImageStyleLeft:.category, btnImageStyleRight:.arrowDown, showTopLabel:false,showRightButton:true,showLeftImage:true,showNotSystemImage:true, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Kategori", topLabel: "Kategori", borderColor : $categoryBG,mainBG:Color.white, topLabelRatio: -145,validationType:.none, configuration: .init(keyboardType: .default))
                        .padding(.leading,22)
                        .padding(.trailing,22)
                        .id(1)
                }
                .padding(.top,50)
                
                VStack(alignment:.leading) {
                    Text("Başlangıç Saati")
                        .font(.setCustomFont(name: .PoppinsMedium,size: 9))
                        .foregroundColor(ThemeColors.theme1.black)
                        .padding(.leading,30)
                    
                    ENTextFieldWithLabelTop(height: 47,txtFieldText: $startTime,btnImageStyleLeft:.clock, btnImageStyleRight:.arrowDown, showTopLabel:false,showRightButton:true,showLeftImage:true,showNotSystemImage:true, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Başlangıç Saati", topLabel: "Başlangıç Saati", borderColor : $startClockBG,mainBG:Color.white, topLabelRatio: -145,validationType:.none, configuration: .init(keyboardType: .default))
                        .padding(.leading,22)
                        .padding(.trailing,22)
                        .id(1)
                }
                
                VStack(alignment:.leading) {
                    Text("Bitiş Saati")
                        .font(.setCustomFont(name: .PoppinsMedium,size: 9))
                        .foregroundColor(ThemeColors.theme1.black)
                        .padding(.leading,30)
                    
                    ENTextFieldWithLabelTop(height: 47,txtFieldText: $endTime,btnImageStyleLeft:.clock, btnImageStyleRight:.arrowDown, showTopLabel:false,showRightButton:true,showLeftImage:true,showNotSystemImage:true, cornerRadius: 7, lineWidth: 4, txtPlaceHolder: "Bitiş Saati", topLabel: "Bitiş Saati", borderColor : $endClockBG,mainBG:Color.white, topLabelRatio: -145,validationType:.none, configuration: .init(keyboardType: .default))
                        .padding(.leading,22)
                        .padding(.trailing,22)
                        .id(1)
                }
                
                MainButton(localizableText: "kaydet", paddingHorizontal: 20, btnWidth: 120, buttonFillColor: ThemeColors.theme1.greenText.opacity(0.5), lineWidth: 1, strokeColor: ThemeColors.theme1.greenBG, textColor: .white, frameHeight: 44, radius: 22, txtPadding: 10, mainFont: .setCustomFont(name: .PoppinsMedium,size: 12), enabled: {return true}) {
                    ()
                }
                .padding(.top,50)
            }
            
        }
    }
}

#Preview {
    CourseRegistrationView()
}
