//
//  MainNavigationView.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 17.04.2024.
//
import UIKit
import SwiftUI

final class MainNavigationView: ViewBuilder {
    
    static let builder = MainNavigationView()
    
    private init() {}
    
    func makeView<T: View>(_ view: T, withNavigationTitle title: String, navigationBarHidden: Bool = false,backgroundImage: String,  isShowRightButton: Bool, rightImage: String) -> UIViewController {
        CustomHostingController(rootView: view, navigationBarTitle: title, navigationBarHidden: navigationBarHidden,backgroundImage: backgroundImage, isShowRightButton: isShowRightButton, rightImage: rightImage)
    }
}

final class MainViewsRouter: Router {
    
    var nav: UINavigationController?

    func pushTo(view: UIViewController) {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            nav?.view.layer.add(transition, forKey: kCATransition)
            nav?.pushViewController(view, animated: false)
    }
}

