//
//  UsersService.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

extension Api {
    
    enum  User: ServiceProtocol {
        
        case profile
        case search(phone: String)
        case getPaymentInfo(orderId: Int, promocode: String?)
        case track(orderId: Int, checkoutId: String)
        case howMuchPay(orderId: Int, code: String?)
        case cancelReservation(orderId: Int)
        case syncDeviceToken(form: DeviceForm)
        case notifications(page: Int, perPage: Int)
        
        var path: String {
            switch self {
            case .profile:
                return API.SERVICE_USERS_PROFILE
            case .search:
                return API.SERVICE_USERS_SEARCH
            case let .getPaymentInfo(orderId, _):
                return "\(API.SERVICE_USERS_RESERVE)/\(orderId)/pay"
            case let .track(orderId, _):
                return "\(API.SERVICE_USERS_RESERVE)/\(orderId)/pay/track"
            case let .howMuchPay(orderId, _):
                return "\(API.SERVICE_USERS_RESERVE)/\(orderId)/pay"
            case let .cancelReservation(orderId):
                return "\(API.SERVICE_USERS_RESERVE)/\(orderId)/cancel"
            case .syncDeviceToken:
                return API.SERVICE_USERS_DEVICE
            case .notifications:
                return API.SERVICE_NOTIFICATIONS
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .profile, .search, .howMuchPay, .notifications:
                return .GET
            case .getPaymentInfo, .cancelReservation, .syncDeviceToken:
                return .POST
            case .track:
                return .PUT
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .profile, .track, .cancelReservation, .syncDeviceToken:
                return nil
            case let .search(phone):
                return ["phone": phone]
            case let .getPaymentInfo(_, promocode):
                if let code = promocode {
                    return ["code": code]
                }
                return nil
            case let .howMuchPay(_, promocode):
                if let code = promocode {
                    return ["code": code]
                }
                return nil
            case let .notifications(page, perPage):
                return [
                    "page": page,
                    "per_page": perPage
                ]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .profile, .search, .getPaymentInfo, .track, .howMuchPay, .cancelReservation, .syncDeviceToken, .notifications:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .profile, .search, .getPaymentInfo, .howMuchPay, .cancelReservation, .notifications:
                return nil
            case let .track(_, checkoutId):
                return ["token_id": checkoutId]
            case let .syncDeviceToken(form):
                return form
            }
        }
    }
}
