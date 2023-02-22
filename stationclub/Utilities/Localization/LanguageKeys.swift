//
//  LanguageKeys.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

// MARK: - SupportedLanguagePrefix

public enum SupportedLanguagePrefix {
    
    public static let en = "en"
    public static let ar = "ar"
}

// MARK: - SupportedLanguageDirection

public enum SupportedLanguageDirection {
    
    case LTR
    case RTL
}

// MARK: - SupportedLanguage

public enum SupportedLanguage {
    
    case English
    case Arabic
    
    public var identifier: String {
        switch self {
        case .English:
            return SupportedLanguagePrefix.en
        case .Arabic:
            return SupportedLanguagePrefix.ar
        }
    }
    
    public var direction: SupportedLanguageDirection {
        switch self {
        case .English:
            return .LTR
        case .Arabic:
            return .RTL
        }
    }
}
