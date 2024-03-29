//
//  AppTabBarController.swift
//  stationclub
//
//  Created by Salah's iMac on 07/05/2023.
//

import UIKit

extension AppTabBarController {
    
    enum Tab: Int, CaseIterable {
        case explore = 0, search, profile
        
        var title: String {
            return String(describing: self).l()
        }
        
        var icon: String {
            return Images.tabBarIcon[rawValue]
        }
        
        var selectedIcon: String {
            return Images.tabBarSelected[rawValue]
        }
        
        var viewController: UIViewController {
            switch self {
            case .explore:
                return HomeRouter.assembleModule()
            case .search:
                return OnboardingRouter.assembleModule()
            case .profile:
                return OnboardingRouter.assembleModule()
            }
        }
    }
}

public class AppTabBarController: UITabBarController {

    /// Edit for customization
    let barStyle: UIBarStyle = .black
    let barHeight: CGFloat = 74
    let selectedColor: UIColor = .appWhite
    let unselectedColor: UIColor = .subText

    let selectedFont: UIFont = .mediumFont(ofSize: 12)
    let unselectedFont: UIFont = .mediumFont(ofSize: 12)

    private var tabBarItems: [UIViewController] {
        var items: [UIViewController] = []
        
        Tab.allCases.forEach { tab in
            let tabBarItem = self.tabBarItem(for: RootRouter.createNavController(vc: tab.viewController,
                                                                                 title: tab.title,
                                                                                 icon: tab.icon),
                                             icon: tab.icon,
                                             selectedIcon: tab.selectedIcon,
                                             title: tab.title,
                                             tag: tab.rawValue)
            items.append(tabBarItem)
        }
        return items
    }

    public override func viewDidLoad() {
        super.viewDidLoad()


        setValue(AppTabBar(frame: tabBar.frame), forKey: "tabBar")
        viewControllers = tabBarItems
        tabBar.barStyle = barStyle

//        removeTabBarItemBackground()
        configTabBarStyle()
//        setupInAppReviewDialog()
        addUnAuthorizedObservers()
        addNotificationObservers()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        PushNotificationsCenter.sharedInstance.handleRecivedNotification()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func addUnAuthorizedObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.catchUnAuthorized), name: NSNotification.Name(rawValue: "UnAuthorizedHandler"), object: nil)
    }

    private func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.catchIt), name: NSNotification.Name(rawValue: "NotificationHandler"), object: nil)
    }

    @objc func catchUnAuthorized(_ userInfo: Notification) {
        restAppRoot()
    }

    private func restAppRoot() {
        UserRepo().logOut()
    }

    @objc func catchIt(_ userInfo: Notification) {
        print("Deep link navigation should active now.")
//        if let action = userInfo.userInfo?["action"] as? String,
//           let  url = URL.init(string: action.replacingOccurrences(of: "orcas_user", with: "orcas-user").replacingOccurrences(of: "//", with: "")),
//           let vc = DeepLinkNavigator.sharedInstance.getViewController(with: url) {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    private func removeTabBarItemBackground() {
        tabBar.backgroundColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }

    private func configTabBarStyle() {
        tabBar.unselectedItemTintColor = unselectedColor
        tabBar.tintColor = selectedColor

        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: unselectedFont
        ], for: .normal)

        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: selectedFont
        ], for: .selected)
    }


    private func setupInAppReviewDialog() {
//        if let shouldShowReviewDialoge =  UserDef.shouldShowReviewDialogWhenReopenApp,
//           shouldShowReviewDialoge == true {
//            ReviewService.shared.requestReview(with: DispatchTime.now() + 4)
//        }
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var safeAreaBottomInset: CGFloat = 0.0

        if #available(iOS 11.0, *) {
            safeAreaBottomInset = view.safeAreaInsets.bottom
        }

        let newTabBarHeight: CGFloat = barHeight + safeAreaBottomInset
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

        item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -10.0)

        item.selectedImage = UIImage(named: selectedIcon)

        controller.tabBarItem = item
        controller.hidesBottomBarWhenPushed = false
        return controller
    }
}
