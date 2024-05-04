//
//  RootNavigationController.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//

import SwiftUI

// Reusable Navigation Controller to be used as the root controller
struct RootNavigationController<RootView: View>: UIViewControllerRepresentable {

    let nav: UINavigationController
    let rootView: RootView
    let navigationBarTitle: String
    let navigationBarHidden: Bool
    let backgroundImage: String
    let isShowRightButton: Bool
    var rightImage: String
    
    init(nav: UINavigationController, rootView: RootView, navigationBarTitle: String, navigationBarHidden: Bool = false, backgroundImage: String, isisShowRightButton: Bool = false, rightImage: String) {
        self.nav = nav
        self.rootView = rootView
        self.navigationBarTitle = navigationBarTitle
        self.navigationBarHidden = navigationBarHidden
        self.backgroundImage = backgroundImage
        self.isShowRightButton = isisShowRightButton
        self.rightImage = rightImage
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let vc = CustomHostingController(rootView: rootView, navigationBarTitle: navigationBarTitle, navigationBarHidden: navigationBarHidden, backgroundImage: backgroundImage, isShowRightButton: isShowRightButton, rightImage: rightImage)
        nav.addChild(vc)
        vc.navigationController?.delegate = context.coordinator
        vc.view.backgroundColor = .white
        
        // Button & Title Shadow
        vc.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        vc.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        vc.navigationController?.navigationBar.layer.shadowRadius = 4.0
        vc.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        vc.navigationController?.navigationBar.layer.masksToBounds = false
        
        //Navbar Shadow
        let dividerView = UIView(frame: CGRect(x: 0, y: 50, width: 1000, height: 0.5))
        dividerView.backgroundColor = .lightGray
        dividerView.layer.masksToBounds = false
        dividerView.layer.shadowColor = UIColor.lightGray.cgColor
        dividerView.layer.shadowOpacity = 1
        dividerView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        dividerView.layer.shadowRadius = 2
        nav.navigationBar.addSubview(dividerView)

        
        return nav
    }

    func updateUIViewController(_ pageViewController: UINavigationController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate {
        var parent: RootNavigationController
        
        init(_ parent: RootNavigationController) {
            self.parent = parent
        }
        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            //viewController.title = ""
            navigationController.view.frame = UIScreen.main.bounds
            navigationController.navigationBar.isTranslucent = true
            navigationController.view.backgroundColor = .clear
            UIApplication.shared.statusBarUIView?.backgroundColor = .clear
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            navigationController.navigationBar.tintColor = UIColor.black
        }
    }
}
