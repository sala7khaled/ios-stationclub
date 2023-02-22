//
//  String+SafelyLimit.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

extension String {
    
    func safelyLimitedTo(length n: Int) -> String {
        if (self.count <= n) {
            return self
        }
        return String(Array(self).prefix(upTo: n))
    }
}
