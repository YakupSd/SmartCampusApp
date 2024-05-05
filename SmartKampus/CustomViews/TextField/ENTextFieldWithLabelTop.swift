//
//  ENTextFieldWithLabelTop.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 3.03.2024.
//

import SwiftUI

struct ENTextFieldWithLabelTop: View {
    var isSecureField : Bool = false
    var height: CGFloat = 67
    @Binding var txtFieldText : String
    @State private var isClicked = false
    var btnImageStyleLeft: ButtonImageStyle = ButtonImageStyle.none
    var btnImageStyleRight: ButtonImageStyle = ButtonImageStyle.arrowDown
    @State var isPlaceHolderColorBlack: Bool = false
    @State var showTopLabel:Bool = true
    @State var hideTopLabel:Bool = true
    @State var showRightButton:Bool = true
    @State var showLeftImage:Bool = true
    @State var showNotSystemImage:Bool = true
    var cornerRadius: CGFloat = 2
    var lineWidth: CGFloat = 2
    var txtPlaceHolder = "Place Holder"
    var placeHolderFont:Font = .setCustomFont(name: .PoppinsBold, size: 13.3)
    var mainFont:Font = .setCustomFont(name: .PoppinsBold, size: 13.3)
    var topLabel = " Kimlik Numarası"
    var colorTopLabel = Color.black
    @Binding var borderColor : Color
    var colorText = ThemeColors.theme1.greenText
    var mainBG = Color.white
    var topLabelTextSize: CGFloat = 8.7
    var topLabelRatio: CGFloat = -60.0
    var isDisabled = false
    var validationType : TextFieldValidationType = .none
    var configuration: TextFieldKeyboardType = .init(keyboardType: .default)
    var systemImageName : String = "calendar"
    var systemImageWidth: CGFloat = 12.0
    var editFinished: (Bool) -> Void = { _ in }
    var action: () -> (Void) = {}
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: lineWidth)
                .foregroundColor(Color.orange)
                .background(mainBG)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .frame(height: height)
                .overlay(
                    HStack {
                        if showLeftImage {
                            if showNotSystemImage {
                                Image(btnImageStyleLeft.rawValue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.black)
                                    .frame(width: 22, height: 22, alignment: .center)
                            }else {
                                Image(systemName: systemImageName)
                                    .resizable()
                                    .foregroundColor(.black)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: systemImageWidth)
                                    .padding(.leading, 15)
                            }
                           
                        }
                        
                        if  isSecureField{
                            SecureField("",text: $txtFieldText)
                                .font(mainFont)
                                .lineLimit(0)
                                .keyboardType(configuration.keyboardType)
                                .foregroundColor(isPlaceHolderColorBlack ? .black : colorText)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .modifier(PlaceholderStyle(showPlaceHolder: txtFieldText.isEmpty,placeholder: txtPlaceHolder,isPlaceHolderColorBlack: isPlaceHolderColorBlack, placeHolderFont:placeHolderFont))
                                .validateText($txtFieldText, validationType: validationType, borderColor: $borderColor)
                        }else{
                            TextField("", text: $txtFieldText,onEditingChanged: {finished in editFinished(finished)})
                                .font(mainFont)
                                .lineLimit(0)
                                .keyboardType(configuration.keyboardType)
                                .foregroundColor(isPlaceHolderColorBlack ? .black : colorText)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .modifier(PlaceholderStyle(showPlaceHolder: txtFieldText.isEmpty,placeholder: txtPlaceHolder,isPlaceHolderColorBlack: isPlaceHolderColorBlack, placeHolderFont:placeHolderFont))
                                .validateText($txtFieldText, validationType: validationType, borderColor: $borderColor)
                                .disabled(isDisabled)
                        }
                       
                       
                        
                        Spacer()
                        if showRightButton {
                            Button {
                                action()
                            } label: {
                                
                                Image(btnImageStyleRight.rawValue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.black)
                                    .frame(width: 22, height: 22, alignment: .center)
                                
                                
                                
                            }
                        }
                        
                    }
                        .padding(.horizontal)
                )
            if txtFieldText.count > 0{
                Text(topLabel)
                    .font(.setCustomFont(name: .PoppinsMedium, size: topLabelTextSize))
                    .frame(width: calculateWidthByCharLength(topLabel,stringSize: 9))
                    .background(mainBG)
                    .foregroundColor(colorTopLabel)
                    .padding(.bottom,height)
                    .padding(.leading,topLabelRatio)
            }
            if hideTopLabel && !txtFieldText.isEmpty {
                Text(topLabel)
                    .font(.setCustomFont(name: .PoppinsMedium, size: topLabelTextSize))
                    .frame(width: calculateWidthByCharLength(topLabel,stringSize: 9))
                    .background(mainBG)
                    .foregroundColor(colorTopLabel)
                    .padding(.bottom,height)
                    .padding(.leading,topLabelRatio)
            }
        }
    }
    
}

fileprivate func calculateWidthByCharLength(_ labelText : String = "Text Label" , stringSize : CGFloat = 12) -> CGFloat{
    let totalSize = CGFloat(labelText.count + 1) * 5
    return totalSize
}

struct ENTextFieldWithLabelTopTowTruck_Previews: PreviewProvider {
        @State static private var testText : String = ""
        @State static private var testType : TextFieldValidationType = .tc
    @State static private var borderColor : Color = ThemeColors.theme1.textboxBorderColor
    static var previews: some View {
        ENTextFieldWithLabelTop(txtFieldText: $testText, borderColor: $borderColor, validationType: testType)
    }
}
enum ButtonImageStyle: String {
    case none = ""
    case eye = "eye"
    case category = "category"
    case clock = "clock"
    case date = "date"
    case greenButton = "greenButton"
    case lesson = "lesson"
    case arrowDown = "arrowDown"
    case userIcon = "userIcon"
    case passIcon = "passwordIcon"
    case mailIcon = "mailIcon"
}
