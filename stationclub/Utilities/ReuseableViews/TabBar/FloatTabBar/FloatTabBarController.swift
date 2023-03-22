//
//  FloatTabBarController.swift
//  stationclub
//
//  Created by Salah Khaled on 31/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class FloatTabBarController: UITabBarController {

    var height: CGFloat!
    var margin: CGFloat!
    var floatTabBarView: FloatTabBarView!
    
    enum TabVC {
        static let tab1 = HomeRouter.assembleModule()
        static let tab2 = OnboardingRouter.assembleModule()
        static let tab3 = OnboardingRouter.assembleModule()
        static let tab4 = OnboardingRouter.assembleModule()
    }
    
    enum TabTitle {
        static let tab1 = "home"
        static let tab2 = "Station"
        static let tab3 = "Podcast"
        static let tab4 = "Setting"
    }
    
    enum TabIcon {
        static let tab1 = "house"
        static let tab2 = "bubble.middle.bottom"
        static let tab3 = "flame"
        static let tab4 = "person"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupFloatingTabBar(height, margin)
    }
    
    func setupData() {
        tabBar.isHidden = true
        view.backgroundColor = .clear
        
        height = view.bounds.height * 0.09
        margin = 20
        floatTabBarView = FloatTabBarView([TabIcon.tab1, TabIcon.tab2, TabIcon.tab3, TabIcon.tab4])
        
        viewControllers = [
            TabVC.tab1,
            createNavController(vc: TabVC.tab2, title: TabTitle.tab2, icon: TabIcon.tab2),
            createNavController(vc: TabVC.tab3, title: TabTitle.tab3, icon: TabIcon.tab3),
            createNavController(vc: TabVC.tab4, title: TabTitle.tab4, icon: TabIcon.tab4)
        ]
        
    
    }
    
    private func createNavController(vc: UIViewController, title: String, icon: String) -> UIViewController {
        vc.navigationItem.title = title
        let nav = NavController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(systemName: icon)
        return nav
    }
    
    func setupFloatingTabBar(_ height: CGFloat, _ margin: CGFloat) {
        floatTabBarView.delegate = self
        view.addSubview(floatTabBarView)
        floatTabBarView.centerXInSuperView()
        floatTabBarView.constraintHeight(constant: height)
        floatTabBarView.constraints(equalTo: view, bottom: margin, left: margin, right: margin)
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
