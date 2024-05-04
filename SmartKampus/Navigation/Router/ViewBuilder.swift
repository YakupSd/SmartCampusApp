//
//  ViewBuilder.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//

import SwiftUI

protocol ViewBuilder {
    func makeView<T: View>(_ view: T, withNavigationTitle title: String, navigationBarHidden: Bool,backgroundImage: String, isShowRightButton: Bool, rightImage: String) -> UIViewController
}
