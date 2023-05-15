//
//  AppTabBarController.swift
//  stationclub
//
//  Created by Salah's iMac on 07/05/2023.
//

import UIKit
//import Core

enum AppUserTaps: Int {
    case explore = 0, chat, learning, account
}

// MARK: - OrcasTabBarController

public class AppTabBarController: UITabBarController {
    
    private let controllers: [UINavigationController] = [
        .init(rootViewController: OnboardingRouter.assembleModule()),
        .init(rootViewController: SignInRouter.assembleModule()),
        .init(rootViewController: OnboardingRouter.assembleModule()),
        .init(rootViewController: OnboardingRouter.assembleModule())
    ]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        setValue(AppUserTaps(frame: tabBar.frame), forKey: "tabBar")
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.shadowImage = UIImage()
        
        viewControllers = tabBarItems
        
        configTabBarStyle()
//        setupInAppReviewDialog()
//        addUnAuthorizedObservers()
//        addNotificationObservers()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        PushNotificationsCenter.sharedInstance.handleRecivedNotification()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
//    private func addUnAuthorizedObservers() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.catchUnAuthorized), name: NSNotification.Name(rawValue: "UnAuthorizedHandler"), object: nil)
//    }
    
//    private func addNotificationObservers() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.catchIt), name: NSNotification.Name(rawValue: "NotificationHandler"), object: nil)
//    }
    
    @objc func catchUnAuthorized(_ userInfo: Notification) {
//        RealmManager.deleteUserData()
        restAppRoot()
    }
    
    private func restAppRoot() {
//        appDelegate?.userLoggedout()
    }
    
//    @objc func catchIt(_ userInfo: Notification) {
//        if let action = userInfo.userInfo?["action"] as? String,
//           let  url = URL.init(string: action.replacingOccurrences(of: "orcas_user", with: "orcas-user").replacingOccurrences(of: "//", with: "")),
//           let vc = DeepLinkNavigator.sharedInstance.getViewController(with: url) {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
    
    private func configTabBarStyle() {
        tabBar.unselectedItemTintColor = .appWhite
        tabBar.tintColor = .appWhite
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.mediumFont(ofSize: 14)
        ], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.mediumFont(ofSize: 14)
        ], for: .selected)
    }
    
//    private func setupInAppReviewDialog() {
//        if let shouldShowReviewDialoge =  UserDef.shouldShowReviewDialogWhenReopenApp,
//           shouldShowReviewDialoge == true {
//            ReviewService.shared.requestReview(with: DispatchTime.now() + 4)
//        }
//    }
    
    private lazy var tabBarItems: [UIViewController] = [
        tabBarItem(for: controllers[0],
                   icon: "ic-headphone",
                   selectedIcon: "ic-headphone",
                   title: "EXPLORE".l(),
                   tag: AppUserTaps.explore.rawValue),
        tabBarItem(for: controllers[1],
                   icon: "ic-headphone",
                   selectedIcon: "ic-headphone",
                   title: "ic-headphone".l(),
                   tag: AppUserTaps.chat.rawValue),
        tabBarItem(for: controllers[2],
                   icon: "ic-headphone",
                   selectedIcon: "ic-headphone",
                   title: "LEARNING".l(),
                   tag: AppUserTaps.learning.rawValue),
        tabBarItem(for: controllers[3],
                   icon: "ic-headphone",
                   selectedIcon: "ic-headphone",
                   title: "ACCOUNT".l(),
                   tag: AppUserTaps.account.rawValue)
    ]
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var safeAreaBottomInset: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            safeAreaBottomInset = view.safeAreaInsets.bottom
        }
        
        let newTabBarHeight: CGFloat = 86 + safeAreaBottomInset
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        tabBar.frame = newFrame
    }
    
    private func tabBarItem(for controller: UIViewController,
                            icon: String,
                            selectedIcon: String,
                            title: String,
                            tag: Int) -> UIViewController {
        let item = UITabBarItem(
            title: title,
            image: UIImage(named: icon),
            tag: tag)
        
        item.imageInsets = UIEdgeInsets(top: 18, left: 0, bottom: -18, right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -2.0)
        
        item.selectedImage = UIImage(named: selectedIcon)
        
        controller.tabBarItem = item
        controller.hidesBottomBarWhenPushed = true
        return controller
    }
    
    private func createNavController(vc: UIViewController, title: String, icon: String) -> UIViewController {
        vc.navigationItem.title = title
        let nav = NavController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(systemName: icon)
        return nav
    }
}



