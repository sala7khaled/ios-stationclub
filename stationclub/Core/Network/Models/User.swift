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
    
    var firstName: String
    var lastName: String
    var phone: String
    var avatar: String?
    var isVerified: Bool?
    var accessToken: String?
    
    func encode(with coder: NSCoder) {
        coder.encode(firstName, forKey: "first_name")
        coder.encode(lastName, forKey: "last_name")
        coder.encode(phone, forKey: "phone")
        coder.encode(avatar, forKey: "avatar")
        coder.encode(isVerified, forKey: "is_verified")
        coder.encode(accessToken, forKey: "access_token")
    }
    
    required init?(coder: NSCoder) {
        self.firstName = coder.decodeObject(forKey: "first_name") as? String ?? ""
        self.lastName = coder.decodeObject(forKey: "last_name") as? String ?? ""
        self.phone = coder.decodeObject(forKey: "phone") as? String ?? ""
        self.avatar = coder.decodeObject(forKey: "avatar") as? String
        self.isVerified = coder.decodeObject(forKey: "is_verified") as? Bool ?? false
        self.accessToken = coder.decodeObject(forKey: "access_token") as? String
    }
}

extension User {
    
    enum CodingKeys: String, CodingKey {
        
        case firstName = "first_name"
        case lastName = "last_name"
        case phone
        case avatar
        case isVerified = "is_verified"
        case accessToken = "access_token"
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
