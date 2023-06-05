//
//  UIFont+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

enum FontName {
    case light
    case lightItalic
    case regular
    case regularItalic
    case medium
    case mediumItalic
    case bold
    case boldItalic
    case black
    case blackItalic
}

struct AppFontName {
    
    // light
    static var light: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.light : AppFontNameAr.light
    }
    static var lightItalic: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.lightItalic : AppFontNameAr.lightItalic
    }
    
    // regular
    static var regular: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.regular : AppFontNameAr.regular
    }
    static var regularItalic: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.regularItalic : AppFontNameAr.regularItalic
    }
    
    // medium
    static var medium: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.medium : AppFontNameAr.medium
    }
    static var mediumItalic: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.mediumItalic : AppFontNameAr.mediumItalic
    }
    
    // bold
    static var bold: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.bold : AppFontNameAr.bold
    }
    static var boldItalic: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.boldItalic : AppFontNameAr.boldItalic
    }
    
    // black
    static var black: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.black : AppFontNameAr.black
    }
    static var blackItalic: String {
        return Localization.shared.currentLanguage() == .English ? AppFontNameEn.blackItalic : AppFontNameAr.blackItalic
    }
}

struct AppFontNameEn {
    
    static let light = "AlbertSans-Light"
    static let lightItalic = "AlbertSans-LightItalic"
    
    static let regular = "AlbertSans-Regular"
    static let regularItalic = "AlbertSans-Italic"
    
    static let medium = "AlbertSans-Medium"
    static let mediumItalic = "AlbertSans-MediumItalic"
    
    static let bold = "AlbertSans-Bold"
    static let boldItalic = "AlbertSans-BoldItalic"
    
    static let black = "AlbertSans-Black"
    static let blackItalic = "AlbertSans-BlackItalic"
}

struct AppFontNameAr {
    
    static let light = "AlbertSans-Light"
    static let lightItalic = "AlbertSans-LightItalic"
    
    static let regular = "AlbertSans-Regular"
    static let regularItalic = "AlbertSans-Italic"
    
    static let medium = "AlbertSans-Medium"
    static let mediumItalic = "AlbertSans-MediumItalic"
    
    static let bold = "AlbertSans-Bold"
    static let boldItalic = "AlbertSans-BoldItalic"
    
    static let black = "AlbertSans-Black"
    static let blackItalic = "AlbertSans-BlackItalic"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    // light
    @objc class func lightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.light, size: size)!
    }
    @objc class func lightItalicFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightItalic, size: size)!
    }
    
    // regular
    @objc class func regularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    @objc class func regularItalicFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularItalic, size: size)!
    }
    
    // medium
    @objc class func mediumFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.medium, size: size)!
    }
    @objc class func mediumItalicFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumItalic, size: size)!
    }
    
    // bold
    @objc class func boldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    @objc class func boldItalicFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldItalic, size: size)!
    }
    
    // black
    @objc class func blackFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.black, size: size)!
    }
    @objc class func blackItalicFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.blackItalic, size: size)!
    }
    
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        if fontAttribute.lowercased().range(of: "light") != nil {
            fontName = AppFontName.light
        } else if fontAttribute.lowercased().range(of: "regular") != nil {
            fontName = AppFontName.regular
        } else if fontAttribute.lowercased().range(of: "medium") != nil {
            fontName = AppFontName.medium
        } else if fontAttribute.lowercased().range(of: "semibold") != nil
                    || fontAttribute.lowercased().range(of: "demi") != nil {
            fontName = AppFontName.bold
        } else if fontAttribute.lowercased().range(of: "bold") != nil
                    || fontAttribute.lowercased().range(of: "heavy") != nil
                    || fontAttribute.lowercased().range(of: "black") != nil {
            fontName = AppFontName.black
        } else if fontAttribute.lowercased().range(of: "italic") != nil {
            fontName = AppFontName.regularItalic
        } else  {
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(regularFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(boldFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(regularItalicFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: AppFontName.medium, size: 11)!
        ], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: AppFontName.medium, size: 11)!
        ], for: .selected)
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: AppFontName.medium, size: 20)!
        ]
        
        let attributes = [
            NSAttributedString.Key.font: UIFont.mediumFont(ofSize: 15)
        ]
        
        UITextField.appearance(whenContainedInInstancesOf: [
            UISearchBar.self
        ]).defaultTextAttributes = attributes
    }
}
