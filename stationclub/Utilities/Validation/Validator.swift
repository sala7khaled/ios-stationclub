//
//  Validator.swift
//  stationclub
//
//  Created by Salah Khaled on 10/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

struct RegExRole {
    let errorMessage: String
    let validate: (_ value: String?) -> Bool
}

class Validator: NSObject {
    
    struct ValidationRegEx {
        static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,256}"
        static let phone = "^[+]?[0-9.-٩ -]{7,18}$"
        static let accountNumber = "[0-9.-٩]{14,16}$"
    }
    
    static var shared = Validator()
    
    func isNotEmpty(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 0
    }
    
    func isName(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 3
    }
    
    func isEmail(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.email)
    }
    
    func isPhone(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.phone)
    }
    
    func isAccountNumber(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.accountNumber)
    }
    
    func isIBAN(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count == 24
    }
    
    func isPassword(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count >= 8
    }
    
    func isCode(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count == 6
    }
    
    func validate(_ text: String?, _ regEx: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regEx)
        return test.evaluate(with: text)
    }
}

