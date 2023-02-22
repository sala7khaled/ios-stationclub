//
//  UITableViewCell+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    var disclosureIndicatorColor: UIColor? {
        get {
            let button = getDisclosureIndicatorButton()
            return button?.tintColor
        }
        set {
            let button = getDisclosureIndicatorButton()
            let image = button?.backgroundImage(for: .normal)?.withRenderingMode(.alwaysTemplate)
            button?.setImage(image, for: .normal)
            button?.tintColor = newValue
        }
    }
    
    private func getDisclosureIndicatorButton() -> UIButton? {
        for view in subviews {
            if let button = view as? UIButton {
                return button
            }
        }
        return nil
    }
}
