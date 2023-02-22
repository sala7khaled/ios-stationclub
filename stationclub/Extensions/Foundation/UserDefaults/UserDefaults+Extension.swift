//
//  UserDefaults+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

enum DefaultsKey: String {
    case User = "user"
    case Token = "token"
    case Onboarding = "onboarding"
}

extension UserDefaults {
    
    func store<T: Encodable>(object: T, key: DefaultsKey) throws {
        let jsonData = try JSONEncoder().encode(object)
        set(jsonData, forKey: key.rawValue)
    }
    
    func retrive<T: Decodable>(type: T.Type, key: DefaultsKey) throws -> T? {
        guard let result = value(forKey: key.rawValue) as? Data else { return nil }
        return try JSONDecoder().decode(type, from: result)
    }
    
    func isExist(key: DefaultsKey) -> Bool {
        return object(forKey: key.rawValue) != nil
    }
    
    func delete(key: DefaultsKey) {
        if object(forKey: key.rawValue) != nil {
            removeObject(forKey: key.rawValue)
        }
    }
}
