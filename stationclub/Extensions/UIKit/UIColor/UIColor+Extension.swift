//
//  UIColor+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension UIColor {

    static let appWhite = UIColor(hex: 0xFFFFFF)
    static let appBlack = UIColor(hex: 0x000000)
    static let appCell = UIColor(hex: 0x141418)
    
    static let primary = UIColor(hex: 0x6063CC)
    static let appRed = UIColor(hex: 0xDF4076)
    static let appBlue = UIColor(hex: 0x3489E5)
    static let appGreen = UIColor(hex: 0x89E49D)
    static let appYellow = UIColor(hex: 0xFAC359)
    
    static let mainText = UIColor(hex: 0xFFFFFF)
    static let subText = UIColor(hex: 0x676C7B)
    
    static let border = UIColor(hex: 0x404040, a: 0.8)
    
    static let transparent = UIColor(hex: 0xFFFFFF, a: 0.05)
    
    static let tabBar = UIColor(hex: 0x27272B)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, a: a)
    }
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
