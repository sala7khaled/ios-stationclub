//
//  File.swift
//  stationclub
//
//  Created by Salah's iMac on 05/04/2023.
//

import Foundation

struct Guest: Codable {
        
    var avatar: String
    var name: String
    
}

extension Guest {
    
    enum CodingKeys: String, CodingKey {
        
        case avatar
        case name
    }
}
