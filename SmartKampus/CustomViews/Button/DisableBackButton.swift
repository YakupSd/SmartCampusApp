//
//  DisableBackButton.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 17.04.2024.
//
import UIKit

// Usage: call `UIViewController.classInit` in your UISceneDelegate
private func swizzle(
    targetClass: AnyClass,
    originalSelector: Selector,
    swizzledSelector: Selector
) {
    let originalMethod = class_getInstanceMethod(targetClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(targetClass, swizzledSelector)
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

private extension UIViewController {

    internal static let classInit: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzledViewWillAppear(_:))
        swizzle(
            targetClass: UIViewController.self,
            originalSelector: originalSelector,
            swizzledSelector: swizzledSelector
        )
    }()

    /// Hides the iOS 14 navigation menu (shown on a long press on any back
    /// button).
    ///
    /// More details at:
    /// https://sarunw.com/posts/what-should-you-know-about-navigation-history-stack-in-ios14/
    @objc func swizzledViewWillAppear(_ animated: Bool) {
        if #available(iOS 14.0, *) {
            let backButton = BackBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = .white // Geri butonunun rengini beyaz yap
            navigationItem.backBarButtonItem = backButton
        }
        // Call the original viewWillAppear
        swizzledViewWillAppear(animated)
    }
}

class BackBarButtonItem: UIBarButtonItem {
    @available(iOS 14.0, *)
    override var menu: UIMenu? {
        get {
            return super.menu
        }
        set {
            // Don't set the menu here
            // super.menu = menu
        }
    }
}
