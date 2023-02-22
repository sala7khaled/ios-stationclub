//
//  LanguageHandler.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

var bundleKey: UInt8 = 0

public protocol LocalizationDelegate: AnyObject {
    func resetApp()
}

public class Localization: NSObject {
    
    public static var shared: Localization = Localization()
    
    public var bundle: Bundle? = nil
    public weak var delegate: LocalizationDelegate?
    
    public static var isEnglish: Bool {
        return Localization.shared.currentLanguage() == .English
    }
    
    public static var isLTR: Bool {
        return Localization.shared.currentLanguage().direction == .LTR
    }
    
    public static var isRTL: Bool {
        return Localization.shared.currentLanguage().direction == .RTL
    }
    
    public func currentLanguage() -> SupportedLanguage {
        
        switch AppLanguage.currentLanguage() {
        case SupportedLanguagePrefix.en:
            return .English
        case SupportedLanguagePrefix.ar:
            return .Arabic
        default:
            return .English
        }
    }
    
    public static var local: Locale {
        return .init(identifier: Localization.shared.currentLanguage().identifier)
    }
    
    public func switchLanguage() {
        setlanguage(langauge: currentLanguage() == .English ? .Arabic : .English)
    }
    
    public func setlanguage(langauge: SupportedLanguage) {
        UserDefaults.standard.set([langauge.identifier, currentLanguage().identifier],
                                  forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        if let path = Bundle.main.path(forResource: langauge.identifier, ofType: "lproj") {
            bundle = Bundle(path: path)
        } else {
            resetLocalization()
        }
        
        Bundle.setLanguage(currentLanguage().identifier)
        resetApp()
    }
    
    public func resetLocalization() {
        bundle = Bundle.main
    }
    
    public func resetApp() {
        var semantic: UISemanticContentAttribute!
        var allighnment: NSTextAlignment!
        
        switch currentLanguage().direction {
        case .LTR:
            semantic = .forceLeftToRight
            allighnment = .left
        case .RTL:
            semantic = .forceRightToLeft
            allighnment = .right
        }
        
        UITabBar.appearance().semanticContentAttribute = semantic
        UIView.appearance().semanticContentAttribute = semantic
        UITableView.appearance().semanticContentAttribute = semantic
        UICollectionView.appearance().semanticContentAttribute = semantic
        UINavigationBar.appearance().semanticContentAttribute = semantic
        UITextField.appearance().textAlignment = allighnment
        UITextView.appearance().textAlignment = allighnment
        UILabel.appearance().semanticContentAttribute = semantic
        UIStackView.appearance().semanticContentAttribute = semantic
        UIImageView.appearance().semanticContentAttribute = semantic
        reset()
    }
    
    func reset(duration: Float = 0.5) {
        var transition = UIView.AnimationOptions.transitionFlipFromRight
        if !(currentLanguage().direction == SupportedLanguageDirection.RTL) {
            transition = .transitionFlipFromLeft
        }
        reset(transition: transition, duration: duration)
    }
    
    func reset(transition: UIView.AnimationOptions, duration: Float = 0.5) {
        func resetWhenNoScenesAvailable() {
            if let delegate = UIApplication.shared.delegate {
                if delegate is LocalizationDelegate {
                    (delegate as!LocalizationDelegate).resetApp()
                }
                UIView.transition(with: ((delegate.window)!)!, duration: TimeInterval(duration), options: transition, animations: {})
            }
        }
        
        if #available(iOS 13.0, *) {
            if let window = UIApplication.shared.delegate?.window, window != nil {
                resetWhenNoScenesAvailable()
            } else {
                for scene in UIApplication.shared.connectedScenes {
                    (scene.delegate as? LocalizationDelegate)?.resetApp()
                }
            }
        } else {
            resetWhenNoScenesAvailable()
        }
    }
}
