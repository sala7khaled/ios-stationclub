//
//  NavController.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class NavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        /// navigationBar.tintColor = .primary
        /// navigationBar.barTintColor = .appWhite
        
        let font = UIFont.mediumFont(ofSize: 20)
        let largeFont = UIFont.boldFont(ofSize: 38)
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font
        ]
        
        navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: largeFont
        ]
        
        navigationBar.backIndicatorImage = UIImage(named: Images.back)
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Images.back)
        
        navigationBar.prefersLargeTitles = false
        
        /// navigationBar.isTranslucent = true
        /// navigationBar.setBackgroundImage(UIImage(), for: .default)
        /// navigationBar.shadowImage = UIImage()
        navigationBar.layoutIfNeeded()
    }
}
