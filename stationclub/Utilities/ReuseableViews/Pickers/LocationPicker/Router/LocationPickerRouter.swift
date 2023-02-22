//
//  LocationPickerRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationPickerDelegate {
    func didPickLocation(addressLine: String?, location: CLLocation?)
}

class LocationPickerRouter: LocationPickerRouterInterface {
    
    var viewController: UIViewController?
    
    static func assembleModule(initLocation: CLLocation? = nil,
                               delegate: LocationPickerDelegate? = nil) -> UIViewController {
        let view: LocationPickerController = LocationPickerController.loadFromNib()
        
        let presenter = LocationPickerPresenter()
        let interactor = LocationPickerInteractor()
        let router = LocationPickerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        presenter.initLocation = initLocation
        presenter.delegate = delegate
        
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
