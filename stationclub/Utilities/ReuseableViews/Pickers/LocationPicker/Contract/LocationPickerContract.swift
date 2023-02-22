//
//  LocationPickerContract.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationPickerView: AnyObject {
    var presenter: LocationPickerPresenterInterface! { get set }
}
    
protocol LocationPickerPresenterInterface: AnyObject {
    var view: LocationPickerView? { get set }
    var router: LocationPickerRouterInterface! { get set }
    var interactor: LocationPickerInteractorInterface! { get set }
    
    var delegate: LocationPickerDelegate? { get set }
    
    var initLocation: CLLocation? { get set }
    var myLocation: CLLocation? { get set }
    
    var currentLocation: CLLocation? { get set }
    var currentAddress: String? { get set }
    var currentHeading: Double? { get set }
    
    func didClickedPickLocation()
}
    
protocol LocationPickerInteractorInterface: AnyObject {
    var output: LocationPickerInteractorOutput? { get set }
}
    
protocol LocationPickerInteractorOutput: AnyObject {
    
}
    
protocol LocationPickerRouterInterface: AnyObject {
    
    static func assembleModule(initLocation: CLLocation?,
                               delegate: LocationPickerDelegate?) -> UIViewController
}
