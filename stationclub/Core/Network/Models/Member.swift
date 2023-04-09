//
//  File.swift
//  stationclub
//
//  Created by Salah's iMac on 05/04/2023.
//

import Foundation

struct Member: Codable {
        
    var avatar: String
    var name: String
    
}

extension Member {
    
    enum CodingKeys: String, CodingKey {
        
        case avatar
        case name
    }
}
