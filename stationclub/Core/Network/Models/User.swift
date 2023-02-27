//
//  User.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

// MARK: - User

class User: NSObject, NSCoding, Codable {
    
    var id: Int
    var username: String
    var email: String
    var firstName: String
    var lastName: String
    var gender: String
    var image: String
    var token: String
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: CodingKeys.id.rawValue)
        coder.encode(username, forKey: CodingKeys.username.rawValue)
        coder.encode(email, forKey: CodingKeys.email.rawValue)
        coder.encode(firstName, forKey: CodingKeys.firstName.rawValue)
        coder.encode(lastName, forKey: CodingKeys.lastName.rawValue)
        coder.encode(gender, forKey: CodingKeys.gender.rawValue)
        coder.encode(image, forKey: CodingKeys.image.rawValue)
        coder.encode(token, forKey: CodingKeys.token.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.id = Int(coder.decodeInt64(forKey: CodingKeys.id.rawValue))
        self.username = coder.decodeObject(forKey: CodingKeys.username.rawValue) as? String ?? ""
        self.email = coder.decodeObject(forKey: CodingKeys.email.rawValue) as? String ?? ""
        self.firstName = coder.decodeObject(forKey: CodingKeys.firstName.rawValue) as? String ?? ""
        self.lastName = coder.decodeObject(forKey: CodingKeys.lastName.rawValue) as? String ?? ""
        self.gender = coder.decodeObject(forKey: CodingKeys.gender.rawValue) as? String ?? ""
        self.image = coder.decodeObject(forKey: CodingKeys.image.rawValue) as? String ?? ""
        self.token = coder.decodeObject(forKey: CodingKeys.token.rawValue) as? String ?? ""
    }
}

extension User {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case username
        case email
        case firstName
        case lastName
        case gender
        case image
        case token
    }
}

// MARK: - DeviceForm

struct DeviceForm: Codable {
    
    let deviceId: String
    let deviceToken: String
    let deviceType: String
}


extension DeviceForm {
    
    enum CodingKeys: String, CodingKey {
        
        case deviceId = "device_id"
        case deviceToken = "device_token"
        case deviceType = "device_type"
    }
}


