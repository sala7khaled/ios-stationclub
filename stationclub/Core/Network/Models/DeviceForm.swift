//
//  Device.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation


struct DeviceForm: Codable {
    
    let deviceId: String
    let deviceToken: String
    let deviceType: String
}


extension DeviceForm {
    
    enum CodingKeys: String, CodingKey {
        
        case deviceId = "device_id"
        case deviceToken = "device_token"
        case deviceType = "device_type"
    }
}
