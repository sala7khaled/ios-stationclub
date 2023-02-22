//
//  FloatTabBarController.swift
//  stationclub
//
//  Created by Salah Khaled on 31/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class FloatTabBarController: UITabBarController {

    let floatTabBarView = FloatTabBarView(["house", "bubble.middle.bottom", "bolt.circle", "rectangle.3.offgrid"])

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            OnboardingRouter.assembleModule(),
            createNavViewController(vc: OnboardingRouter.assembleModule(), title: "About", icon: "bubble.middle.bottom.fill"),
            createNavViewController(vc: OnboardingRouter.assembleModule(), title: "Trending", icon: "flame.fill"),
            createNavViewController(vc: OnboardingRouter.assembleModule(), title: "Settings", icon: "rectangle.3.offgrid.fill")
        ]
        tabBar.isHidden = true

        setupFloatingTabBar()
    }
    
    private func createNavViewController(vc: UIViewController, title: String, icon: String) -> UIViewController {

        vc.navigationItem.title = title
        let nav = NavController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(systemName: icon)
        return nav
    }
    
    func setupFloatingTabBar() {
        floatTabBarView.delegate = self
        view.addSubview(floatTabBarView)
        floatTabBarView.centerXInSuperView()
        floatTabBarView.constraintHeight(constant: 80)
        floatTabBarView.constraints(equalTo: view, bottom: 20, left: 20, right: 20)
    }
    
    func toggle(hide: Bool) {
        floatTabBarView.toggle(hide: hide)
    }
}

extension FloatTabBarController: FloatTabBarViewDelegate {
    func didSelect(index: Int) {
        selectedIndex = index
    }
}
