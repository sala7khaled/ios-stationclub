//
//  UserKeyChain.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class UserKeyChain: KeyChain {
    
    func save(user: User) {
        _ = store(key: .User, object: user)
    }
    
    func saveToken(token: String) {
        _ = store(key: .Token, object: token)
    }
    
    func get() -> User? {
        return load(key: .User)
    }
    
    func isExist() -> Bool {
        return get() != nil
    }
    
    func logOut() {
        delete(key: .User)
    }
}
