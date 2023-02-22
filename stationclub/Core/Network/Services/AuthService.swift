//
//  AuthService.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

extension Api {
    
    enum Auth: ServiceProtocol {
        
        case regsiter(signForm: SignForm)
        case login(signForm: SignForm)
        case verify(code: String)
        case signOut(deviceId: String)
        case sendCode(phone: String)
        case sendVerificationCode(phone: String)
        case forgetPasswordCheck(code: String, phone: String)
        case resetPassword(code: String, phone: String, password: String)
        case updateProfile(firstName: String, lastName: String)
        case updatePassword(oldPassword: String, password: String)
        case invite(phone: String)
        
        var path: String {
            switch self {
            case .regsiter:
                return API.SERVICE_AUTH_REGSITER
            case .login:
                return API.SERVICE_AUTH_LOGIN
            case .verify:
                return API.SERVICE_AUTH_VERIFY
            case .signOut:
                return API.SERVICE_AUTH_SIGN_OUT
            case .sendCode:
                return API.SERVICE_AUTH_SEND_CODE
            case .sendVerificationCode:
                return API.SERVICE_AUTH_SEND_VERIFICATION_CODE
            case .forgetPasswordCheck:
                return API.SERVICE_AUTH_FORGET_PASSWORD_CHECK
            case .resetPassword:
                return API.SERVICE_AUTH_RESET_PASSWORD
            case .updateProfile:
                return API.SERVICE_AUTH_PROFILE
            case .updatePassword:
                return API.SERVICE_AUTH_UPDATE_PASSWORD
            case .invite:
                return API.SERVICE_USERS_INVITE
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .regsiter,
                 .login,
                 .verify,
                 .signOut,
                 .sendCode,
                 .sendVerificationCode,
                 .forgetPasswordCheck,
                 .resetPassword,
                 .invite:
                return .POST
            case .updateProfile,
                 .updatePassword:
                return .PUT
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .regsiter,
                 .login,
                 .verify,
                 .signOut,
                 .sendCode,
                 .sendVerificationCode,
                 .forgetPasswordCheck,
                 .resetPassword,
                 .updateProfile,
                 .updatePassword,
                 .invite:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .regsiter,
                 .login,
                 .verify,
                 .signOut,
                 .sendCode,
                 .sendVerificationCode,
                 .forgetPasswordCheck,
                 .resetPassword,
                 .updateProfile,
                 .updatePassword,
                 .invite:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case let .regsiter(signForm):
                return signForm
            case let .login(signForm):
                return signForm
            case let .verify(code):
                return ["code": code]
            case let .signOut(deviceId):
                return ["device_id": deviceId]
            case let .sendCode(phone):
                return ["phone": phone]
            case .sendVerificationCode:
                return nil
            case let .forgetPasswordCheck(code, phone):
                return [
                    "code": code,
                    "phone": phone
                ]
            case let .resetPassword(code, phone, password):
                return [
                    "code": code,
                    "phone": phone,
                    "password": password
                ]
            case let .updateProfile(firstName, lastName):
                return [
                    "first_name": firstName,
                    "last_name": lastName,
                ]
            case let .updatePassword(oldPassword, password):
                return [
                    "old_password": oldPassword,
                    "password": password,
                ]
            case let .invite(phone):
                return [
                    "phone": phone
                ]
            }
        }
    }
}
