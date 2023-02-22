//
//  CustomAlertEntity.swift
//  stationclub
//
//  Created by Salah Khaled on 11/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

struct CustomAlert {
    var type: AlertType
    var action: AlertAction
    var title: String
    var message: String
    var buttonTitle: String
}

enum AlertType {
    case info
    case success
    case delete
    case error
    case warning
    case connection
}

enum AlertAction {
    case one
    case two
}
