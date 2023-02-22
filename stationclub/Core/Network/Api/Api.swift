//
//  Api.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

/**
 APIConfigurations
 
 - parameter development: For the application during the development phase.
 - parameter stage: For the application during the testing phase.
 - parameter production: For the application during the launching on App store.
 */

let API = Api(config: .production)

enum APIConfiguration {

    case development
    case stage
    case production
}

final class Api {
    
    let config: APIConfiguration
    
    var baseUrl: String {
        switch config {
        case .development:
            return "https://lms-doctoroid.herokuapp.com/"
        case .stage:
            return "https://lms-doctoroid.herokuapp.com/"
        case .production:
            return "https://lms-doctoroid.herokuapp.com/"
        }
    }
    
    init(config: APIConfiguration) {
        self.config = config
    }
    
    // MARK: - AUTH
    
    let SERVICE_AUTH_REGSITER = "register"
    let SERVICE_AUTH_LOGIN = "signin"
    let SERVICE_AUTH_VERIFY = "verify"
    let SERVICE_AUTH_SIGN_OUT = "logout"
    let SERVICE_AUTH_PROFILE = "profile"
    let SERVICE_AUTH_SEND_VERIFICATION_CODE = "verify/send"
    let SERVICE_AUTH_SEND_CODE = "reset/send"
    let SERVICE_AUTH_FORGET_PASSWORD_CHECK = "reset/check"
    let SERVICE_AUTH_RESET_PASSWORD = "reset"
    let SERVICE_AUTH_UPDATE_PASSWORD = "password"
    
    // MARK: - USERS
    
    let SERVICE_USERS_PROFILE = "users/profile"
    let SERVICE_USERS_SEARCH = "users/search"
    let SERVICE_USERS_RESERVE = "reservations"
    let SERVICE_USERS_INVITE = "users/invite"
    let SERVICE_PROMOCODE_CHECK = "promocode/check"
    let SERVICE_USERS_DEVICE = "devices"
    let SERVICE_NOTIFICATIONS = "notifications"
    
    // MARK: - RESTAURANTS
    
    let SERVICE_HOME = "home"
    let SERVICE_CATEGORIES = "categories"
    let SERVICE_RESTAURANTS = "restaurants"
    let SERVICE_DISHES = "dishes"
    
    let SERVICE_PUBLIC_CATEGORIES = "public/categories"
    let SERVICE_PUBLIC_RESTAURANTS = "public/restaurants"
    let SERVICE_PUBLIC_DISHES = "public/dishes"
}
