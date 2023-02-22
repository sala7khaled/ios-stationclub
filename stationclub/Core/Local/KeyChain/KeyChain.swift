//
//  KeyChain.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class KeyChain {
    
    @discardableResult
    func store<T>(key: DefaultsKey, object: T) -> OSStatus? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let query = initStoreQuery(key.rawValue, data)
            SecItemDelete(query as CFDictionary)
            return SecItemAdd(query as CFDictionary, nil)
        } catch {
            print(error)
            return nil
        }
    }
    
    func load<T>(key: DefaultsKey) -> T? {
        let query = initLoadQuery(key.rawValue)
        var dataTypeRef: AnyObject? = nil
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            do {
                let result = dataTypeRef as! Data?
                let object: T? =  try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(result!) as? T ?? nil
                return object
            } catch {
                return nil
            }
        }
        return nil
    }
    
    @discardableResult
    func delete(key: DefaultsKey) -> OSStatus {
        let query = initStoreQuery(key.rawValue, Data())
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    private func initStoreQuery(_ key: String, _ data: Data) -> [String : Any] {
        return [
            kSecClass as String : kSecClassGenericPassword as String,
            kSecAttrAccount as String : createUId(key),
            kSecValueData as String : data
            ] as [String : Any]
    }
    
    private func initLoadQuery(_ key: String) -> [String : Any] {
        return [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : createUId(key),
            kSecReturnData as String : kCFBooleanTrue!,
            kSecMatchLimit as String : kSecMatchLimitOne
            ] as [String : Any]
    }
    
    func createUId(_ key: String) -> String {
        let uuid = UIDevice.current.identifierForVendor
        return "\(uuid?.uuidString ?? "")\(key)"
    }
}
