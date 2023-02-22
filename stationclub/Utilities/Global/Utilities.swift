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
    
    static func openUrl(_ urlStr: String) {
        if let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
    }
    
    static func call(phone: String) {
        guard let url = URL(string: "telprompt://\(phone)"), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
