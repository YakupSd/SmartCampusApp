//
//  UIView+Extension.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 18.04.2024.
//

import Foundation
import UIKit
import SwiftUI


extension UIView {
    
    func anchor(centerY:NSLayoutYAxisAnchor?,centerX:NSLayoutXAxisAnchor?,top:NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,right:NSLayoutXAxisAnchor?,paddingTop: CGFloat, paddingLeft:CGFloat,paddingBottom:CGFloat,paddingRight:CGFloat,width:CGFloat,height:CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            self.topAnchor.constraint(equalTo: top,constant: paddingTop).isActive = true
        }
        if let left = left{
            leftAnchor.constraint(equalTo: left,constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            if paddingBottom != 0 {
                bottomAnchor.constraint(equalTo: bottom,constant: -paddingBottom).isActive = true
            }
            else{
                bottomAnchor.constraint(equalTo: bottom).isActive = true
            }
        }
        if let centerY = centerY{
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = centerX{
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let right = right{
            if paddingRight != 0 {
                rightAnchor.constraint(equalTo: right,constant: -paddingRight).isActive = true
            }
            else{
                rightAnchor.constraint(equalTo: right).isActive = true
            }
            
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
}
public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    var colorText = Color.black
    var isPlaceHolderColorBlack: Bool
    var placeHolderFont:Font = .setCustomFont(name: .PoppinsRegular, size: 13.3)
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .font(placeHolderFont)
                    .foregroundColor(isPlaceHolderColorBlack ? .black : colorText)
                    .padding(.horizontal, 5)
                
            }
            content
            .foregroundColor(Color.white)
            .padding(5.0)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
