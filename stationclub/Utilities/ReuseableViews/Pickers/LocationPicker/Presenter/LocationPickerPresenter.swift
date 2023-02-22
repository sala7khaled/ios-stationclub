//
//  LocationPickerPresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPickerPresenter: LocationPickerPresenterInterface {

    weak var view: LocationPickerView?
    var router: LocationPickerRouterInterface!
    var interactor: LocationPickerInteractorInterface!
    
    var delegate: LocationPickerDelegate?
    
    var initLocation: CLLocation?
    var myLocation: CLLocation?
    
    var currentLocation: CLLocation?
    var currentAddress: String?
    var currentHeading: Double?
    
    func didClickedPickLocation() {
        delegate?.didPickLocation(addressLine: currentAddress, location: currentLocation)
    }
}

extension LocationPickerPresenter: LocationPickerInteractorOutput {
    
}
