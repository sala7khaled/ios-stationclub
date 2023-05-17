//
//  RootRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class RootRouter {
    
    static func pushVC(_ vc: UIViewController, in viewController: UIViewController, animated: Bool = true) {
        viewController.navigationController?.pushViewController(vc, animated: animated)
    }
    
    static func presentRootNav(with vc: UIViewController) {
        let nav = NavController(rootViewController: vc)
        presentRoot(nav)
    }
    
    static func presentRootTab() {
        #warning("Testing tab bar")
//        presentRoot(FloatTabBarController())
        presentRoot(AppTabBarController())
    }
    
    static func presentRootScreen(in window: UIWindow?, vc: UIViewController) {
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func presentRoot(_ vc: UIViewController) {
        let window = UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func createNavController(vc: UIViewController, title: String, icon: String) -> UINavigationController {
        vc.navigationItem.title = title
        let nav = NavController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(systemName: icon)
        return nav
    }
    
    static func resetApp() {
        resetApp(with: SplashRouter.assembleModule())
    }
    
    static func resetApp(with vc: UIViewController) {
        let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({$0 as? UIWindowScene})
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
        
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
}
