//
//  SignForm.swift
//  stationclub
//
//  Created by Salah Khaled on 10/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

struct SignForm: Codable {
    
    var email: String
    var password: String
}

extension SignForm {
    
    enum CodingKeys: String, CodingKey {
        
        case email
        case password
    }
}
