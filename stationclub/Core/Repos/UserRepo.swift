//
//  UsersRepo.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class UsersRepo: Repo {
    
    var local = UserKeyChain()
    
    func store(user: User) {
        local.save(user: user)
    }
    
    func storeToken(token: String) {
        local.saveToken(token: token)
    }
    
    func verify() {
        if let user = local.get() {
            user.isVerified = true
            store(user: user)
        }
    }
    
    func logOut() {
        local.logOut()
    }
    
//    func profile(_ completion: @escaping (APIResponse<User>) -> ()) {
//        provider.request(type: APIData<User>.self, service: Api.Users.profile) { response in
//            switch (response) {
//            case let .onSuccess(response):
//                let user: User = response.data!
//                user.accessToken = UsersRepo().local.get()?.accessToken
//                UsersRepo().store(user: user)
//                completion(.onSuccess(user))
//            case let .onFailure(error):
//                completion(.onFailure(error))
//            }
//        }
//    }
//
//    func search(by phone: String, _ completion: @escaping (APIResponse<APIData<Partner>>) -> ()) {
//        provider.request(type: APIData<Partner>.self, service: Api.Users.search(phone: phone), completion: completion)
//    }
//
    func syncDeviceToken(form: DeviceForm, _ completion: @escaping (APIResponse<AnyCodable>) -> ()) {
        provider.request(type: AnyCodable.self, service: Api.User.syncDeviceToken(form: form), completion: completion)
    }
//
//    func notifications(page: Int, perPage: Int, _ completion: @escaping (APIResponse<APIData<[NotificationModel]>>) -> ()) {
//        provider.request(type: APIData<[NotificationModel]>.self, service: Api.Users.notifications(page: page, perPage: perPage), completion: completion)
//    }
}
