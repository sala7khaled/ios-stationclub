//
//  Utilities.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class Utilities {
    
    static func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    static func openUrl(url: String) {
        if let safeUrl = URL(string: url) {
            UIApplication.shared.open(safeUrl)
        }
    }
    
    static func call(phone: String) {
        guard let url = URL(string: "telprompt://\(phone)"), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
