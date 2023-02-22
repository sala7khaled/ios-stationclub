//
//  BaseController.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension BaseController {
    
    func getDirection () -> BarDirection {
        return Localization.shared.currentLanguage() == .English ? .left : .right
    }
    
    func hideNavigationBorder() {
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func hideNavigationBar(_ hide: Bool) {
        navigationController?.setNavigationBarHidden(hide, animated: false)
    }
    
    func setupTitleNavigation(_ title: String) {
        
        let lblTitle = UILabel()
        lblTitle.text = title
        setDirection(getDirection(), lblTitle)
    }
    
    func setupNavigation() {
        
        /// Remove back button title
        // navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.tintColor = .appWhite
        navigationController?.navigationBar.barTintColor = .appBlack
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupBackNavigation() {
        guard navigationController?.viewControllers.count ?? 0 > 1 else { return }
        customBarButton(.back)
    }
    
    // Custom bar button configuration
    func customBarButton(_ type: BarButtonType) {
        let button = UIButton.init(type: .custom)
        setFrameBarBtn(type, button)
        setImageBarBtn(type, button)
        setActionBarBtn(type, button)
        setDirection(getDirection(), button)
    }
    
    func setFrameBarBtn(_ type: BarButtonType, _ button: UIButton) {
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    }
    
    func setImageBarBtn(_ type: BarButtonType, _ button: UIButton) {
        
        // App customization
        button.layer.cornerRadius = 20
        button.backgroundColor = .appCell
        
        switch type {
        case .back:
            button.setImage(UIImage(named: Images.back), for: .normal)
             if Localization.shared.currentLanguage() == .Arabic {
                button.transform = CGAffineTransform(scaleX: -1, y: 1)
             }
        case .search:
            button.setImage(UIImage(named: Images.search), for: .normal)
            
        case .share:
            button.setImage(UIImage(named: Images.share), for: .normal)
        }
    }
    
    func setDirection(_ direction: BarDirection, _ customView: UIView) {
        switch direction {
        case .left:
            if navigationItem.leftBarButtonItems?.isEmpty ?? true {
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
            } else {
                navigationItem.leftBarButtonItems?.append(UIBarButtonItem(customView: customView))
            }
        case .right:
            if navigationItem.rightBarButtonItems?.isEmpty ?? true {
                navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customView)
            } else {
                navigationItem.rightBarButtonItems?.append(UIBarButtonItem(customView: customView))
            }
        }
    }
        
    func setActionBarBtn(_ type: BarButtonType, _ button: UIButton) {
        switch type {
        case .back:
            button.addTarget(self, action: #selector(presentBack), for: .touchUpInside)
        case .search:
            button.addTarget(self, action: #selector(presentSearch), for: .touchUpInside)
        case .share:
            button.addTarget(self, action: #selector(presentShare), for: .touchUpInside)
        }
    }
    
    @objc private func presentBack() {
        self.navigationController?.popViewController(animated: true)
        BaseRouter().presentBack(self)
    }
    
    @objc private func presentSearch() {
        BaseRouter().presentSearch(self)
    }
    
    @objc private func presentShare() {
        BaseRouter().presentSearch(self)
    }

}
