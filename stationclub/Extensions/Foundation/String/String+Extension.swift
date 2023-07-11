//
//  String+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation
import CoreLocation

extension String {
    
    func isNotEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespaces).count > 0
    }
    
    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
    
    /**
     Returns the initials from a given string (first letter from the first and last words)
     
     - returns: The initials from the string
     */
    public var initial: String {
        return self.split(separator: " ").map { String($0.first!) }.joined()
    }
    
    /**
     Returns the first word of the string
     */
    public var firstWord: String? {
        return self.split(separator: " ").map { String($0) }.first
    }
    
    /**
     Converts the first letter of the string to an upper case letter
     
     - returns: The string with a capitalized first letter
     */
    public var capitalizedFirstCharacter: String {
        if self.count > 1 {
            let startIndex = self.index(self.startIndex, offsetBy: 1)
            let begin = self[..<startIndex]
            let end = self[startIndex...]
            let first = begin.uppercased()
            return first + end
        }
        return self.capitalized
    }
    
    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
        var count = 0
        var returnValue = self
        
        while let range = returnValue.range(of: search) {
            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
            count += 1
            
            if count == maxReplacements {
                return returnValue
            }
        }
        
        return returnValue
    }
    
    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }
        
        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]
        
        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    
    var toDouble: Double {
        return (self as NSString).doubleValue
    }
    
    var toInt: Int {
        return (self as NSString).integerValue
    }
    
    var toBoolean: Bool {
        return (self as NSString).boolValue
    }
    
    func l() -> String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
        /// return Localization.shared.localized(of: self)
    }
    
    func chopPrefix(_ count: Int = 1) -> String {
        if count >= 0 && count <= self.count {
            let indexStartOfText = self.index(self.startIndex, offsetBy: count)
            return String(self[indexStartOfText...])
        }
        return ""
    }
    
    func chopSuffix(_ count: Int = 1) -> String {
        if count >= 0 && count <= self.count {
            let indexEndOfText = self.index(self.endIndex, offsetBy: -count)
            return String(self[..<indexEndOfText])
        }
        return ""
    }
    
    func first(of char: Int) -> String {
        if char < self.count {
            return "\(String(self.prefix(20)))..."
        }
        return self
    }
    
    func htmlAttributed() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html
        ], documentAttributes: nil) else { return nil }
        return html
    }
    
    func toCLLocation() -> CLLocation {
        let location = self.components(separatedBy:",")
        return CLLocation(latitude: Double(location[0]) ?? 0.00, longitude: Double(location[1]) ?? 0.00)
    }
    
    func parseTime() -> Float {
        let stringArray = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        for item in stringArray {
            if let time = Float(item) {
                if self.contains("secs") {
                    return time / 60
                } else if self.contains("mins") {
                    return time
                } else {
                    return time * 60
                }
            }
        }
        return 0.0
    }
    
    func getQueryParameter(param: String) -> String? {
        guard let url = URLComponents(string: self) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
}
