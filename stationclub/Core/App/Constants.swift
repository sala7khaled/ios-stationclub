//
//  Constants.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation

enum Constants {
    static let defaultCountryCode = "+20"
    
    static let aboutAppUrl = "http://stationclub.com/"
    static let helpUrl = "http://help.stationclub.com/"
    
    static let termsAndConditionUrl = "http://stationclub/terms/"
    static let privacyPolicyUrl = "http:/stationclub/policy/"
    
    static let googleAPIKey = "AIzaSyBXP4PUjXIX4iaZNjN2K-5w-y-5sPeYKPg"
    
    static let defaultMapCoordinate = CLLocationCoordinate2D(latitude: 29.98363650061996, longitude: 31.230690662601187)
    
    static let buttonCornerRadius: CGFloat = 8
}

enum Images {
    static let logo = "ic-logo"
    static let appLogo = "app-logo"
    static let splash = "bg-splash"
    static let back = "ic-back"
    static let search = "ic-search"
    static let option = "ic-option"
    static let share = "ic-share"
    static let onboarding = ["onboard-1", "onboard-2", "onboard-3", "onboard-4", "onboard-5"]
    static let nextArrow = "ic-arrow-next"
    static let podcast = "ic-podcast"
    static let placeHolder = "ic-place-holder"
    static let placeHolderError = "place_holder_error"
    static let staticMarker = "ic-static-marker"
    static let landingBackground = "bg-landing"
    static let language = "ic-language"
    static let invisible = "ic-password-invisible"
    static let visible = "ic-password-visible"
    
    static let alertInfo = "ic-alert-info"
    static let alertSuccess = "ic-alert-success"
    static let alertDelete = "ic-alert-delete"
    static let alertError = "ic-alert-error"
    static let alertWarning = "ic-alert-warning"
    static let alertConnection = "ic-alert-connection"
}
