//
//  UITextField+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension UITextField {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
    }
    
    func localize() {
        self.textAlignment = (Localization.shared.currentLanguage() == .English ? .left : .right)
    }
    
    func setUnderLine(color: UIColor, width: CGFloat = 0.5) {
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - width,
                              width: self.frame.size.width - 10,
                              height: self.frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}

extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
