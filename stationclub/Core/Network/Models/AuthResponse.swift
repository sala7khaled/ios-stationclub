//
//  AuthResponse.swift
//  stationclub
//
//  Created by Salah Khaled on 28/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

struct AuthResponse: Codable {
    
    var accessToken: String
    var confirm: String
    var pId: String
//    var user: User
}

extension AuthResponse {
    
    enum CodingKeys: String, CodingKey {
        
        case accessToken = "token"
        case confirm = "confirm"
        case pId = "p_id"
//        case user = "user"
    }
}
