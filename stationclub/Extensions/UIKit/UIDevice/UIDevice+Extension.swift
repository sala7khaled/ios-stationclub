//
//  UIDevice+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension UIDevice {
    
    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
