//
//  PickerOptions.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation
import CoreLocation

enum PickerOptions {
    case PHOTOS
    case CAMERA
    case DOCUMENT(documentTypes: [String])
    case COUNTRY
    case LOCATION(initLocation: CLLocation? = nil)
}
