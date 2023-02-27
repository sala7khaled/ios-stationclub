//
//  UIButton+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension UIButton {
    
    /**
     Addin a localized title to button
     
     - parameter key: The key localized to be a title of button with .normal style
     */
    func setTitle(_ key: String) {
        self.setTitle(key.l(), for: .normal)
    }
    
    func applyShadow(radius: CGFloat = 10, color: UIColor = .primary) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.7
        pulse.toValue = 1.0
        layer.add(pulse, forKey: "pulse")
    }
    
    func setInsets (top: CGFloat = 0, leading: CGFloat = 14, bottom: CGFloat = 0, trailing: CGFloat = 14, imagePadding: CGFloat = 0 ) {
        
        let contentPadding = UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
        
        if Localization.shared.currentLanguage() == .English {
            
            self.contentEdgeInsets = UIEdgeInsets(top: contentPadding.top,
                                                  left: contentPadding.left,
                                                  bottom: contentPadding.bottom,
                                                  right: contentPadding.right + imagePadding)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: imagePadding,
                                                bottom: 0,
                                                right: -imagePadding)
        } else {
            self.contentEdgeInsets = UIEdgeInsets(top: contentPadding.top,
                                                  left: contentPadding.left + imagePadding,
                                                  bottom: contentPadding.bottom,
                                                  right: contentPadding.right)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -imagePadding,
                                                bottom: 0,
                                                right: imagePadding)
        }
    }
}
