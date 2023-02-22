//
//  NotificationsManager.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

class NotificationsManager {
    
    let defaults = UserDefaults.standard
    let key = "LAST_NOTIFICATION_ID"
    
    func store(id: String) {
        defaults.set(id, forKey: key)
        defaults.synchronize()
    }
    
    func retrive() -> String? {
        return defaults.string(forKey: key)
    }
    
//    func validate() {
//        if UsersRepo().local.isExist() {
//            UsersRepo().notifications(page: 1, perPage: 1) { response in
//                switch response {
//                case let .onSuccess(response):
//                    if let notification = response.data?.first {
//                        if "\(notification.id)" == self.retrive() {
//                            self.post(false)
//                        } else {
//                            self.post(true)
//                        }
//                        self.store(id: "\(notification.id)")
//                    }
//                default:
//                    break
//                }
//            }
//        }
//    }
    
    func post(_ has: Bool) {
        if UsersRepo().local.isExist() {
            NotificationCenter.default.post(
                name: Notification.Name("HAS_NEW_NOTIFICATIONS"),
                object: nil,
                userInfo: ["has": has]
            )
        }
    }
}
