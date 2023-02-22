//
//  AuthRepo.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

class AuthRepo: Repo {
    
    static let shared = AuthRepo()
    
//    func regsiter(signForm: SignForm, _ completion: @escaping (APIResponse<APIData<AuthResponse>>) -> ()) {
//        provider.request(type: APIData<AuthResponse>.self, service: Api.Auth.regsiter(signForm: signForm)) { response in
//            switch (response) {
//            case let .onSuccess(response):
//                let user: User = response.data!.user
//                user.accessToken = response.data?.accessToken
//                UsersRepo().store(user: user)
//                AppDelegate.syncFirebaseToken()
//                completion(.onSuccess(response))
//            case let .onFailure(error):
//                completion(.onFailure(error))
//            }
//        }
//    }
//
    func login(signForm: SignForm, _ completion: @escaping (APIResponse<AuthResponse>) -> ()) {
        provider.request(type: AuthResponse.self, service: Api.Auth.login(signForm: signForm)) { response in
            switch (response) {
            case let .onSuccess(response):
                let token: String = response.accessToken
                UsersRepo().storeToken(token: token)
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
//
//    func verify(code: String, _ completion: @escaping (APIResponse<User>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.verify(code: code)) { response in
//            switch (response) {
//            case .onSuccess:
//                let user = UsersRepo().local.get()!
//                user.isVerified = true
//                UsersRepo().store(user: user)
//                completion(.onSuccess(user))
//            case let .onFailure(error):
//                completion(.onFailure(error))
//            }
//        }
//    }
//
//    func signOut(deviceId: String, _ completion: @escaping (APIResponse<Ignore>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.signOut(deviceId: deviceId), completion: completion)
//    }
//
//    func sendCode(phone: String, _ completion: @escaping (APIResponse<Ignore>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.sendCode(phone: phone), completion: completion)
//    }
//
//    func sendVerificationCode(phone: String, _ completion: @escaping (APIResponse<Ignore>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.sendVerificationCode(phone: phone), completion: completion)
//    }
//
//    func forgetPasswordCheck(code: String, phone: String, _ completion: @escaping (APIResponse<Ignore>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.forgetPasswordCheck(code: code, phone: phone), completion: completion)
//    }
//
//    func resetPassword(code: String,
//                       phone: String,
//                       password: String,
//                       _ completion: @escaping (APIResponse<Ignore>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.resetPassword(code: code,
//                                                                            phone: phone,
//                                                                            password: password),
//                         completion: completion)
//    }
//
//    func updateProfile(firstName: String, lastName: String, _ completion: @escaping (APIResponse<APIData<User>>) -> ()) {
//        provider.request(type: APIData<User>.self, service: Api.Auth.updateProfile(firstName: firstName, lastName: lastName)) { response in
//            switch (response) {
//            case let .onSuccess(response):
//                let user = UsersRepo().local.get()!
//                user.firstName = response.data?.firstName ?? ""
//                user.lastName = response.data?.lastName ?? ""
//                UsersRepo().store(user: user)
//                completion(.onSuccess(response))
//            case let .onFailure(error):
//                completion(.onFailure(error))
//            }
//        }
//    }
//
//    func updatePassword(oldPassword: String, password: String, _ completion: @escaping (APIResponse<Ignore>) -> ()) {
//        provider.request(type: Ignore.self, service: Api.Auth.updatePassword(oldPassword: oldPassword, password: password), completion: completion)
//    }
//
//    func invite(phone: String, _ completion: @escaping (APIResponse<AnyCodable>) -> ()) {
//        provider.request(type: AnyCodable.self, service: Api.Auth.invite(phone: phone), completion: completion)
//    }
}
