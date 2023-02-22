//
//  LocationPickerController.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation
//import GoogleMaps

class LocationPickerController: UIViewController {
    
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnPickLocation: AppButton!
//    @IBOutlet weak var mapView: GMSMapView!
    
    var markerView: UIImageView!
    
    var presenter: LocationPickerPresenterInterface!
    
    var appLocationManager = AppLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        addStaticMarker()
        
        appLocationManager.checkLocationService()
        
        PermissionManager.hasLocationPermission { hasPermission in
            if !hasPermission {
                self.enableLocationPermission()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if let location = presenter.initLocation {
//            appLocationManager.getCameraOn(coordinate: location.coordinate, zoom: 17)
//        } else {
//            appLocationManager.getCameraOfMyLocation()
//        }
    }
    
//    private func setupView() {
//        viewAddress.setRadius(10)
//
//        mapView.isMyLocationEnabled = true
//        mapView.delegate = self
//
//        appLocationManager = AppLocationManager()
//        appLocationManager.delegate = self
//        appLocationManager.setupLocationManager()
//        appLocationManager.locationManager.startUpdatingHeading()
//    }
//
//    private func addStaticMarker() {
//        markerView = UIImageView(image: UIImage(named: Images.staticMarker))
//        markerView.frame = CGRect(x: mapView.center.x - 16, y: mapView.center.y - 32, width: 32, height: 32)
//        mapView.addSubview(markerView)
//    }
    
    @IBAction func actionPickLocation(_ sender: Any) {
        presenter.didClickedPickLocation()
        self.dismiss(animated: true)
    }
    
    @IBAction func actionMyLocation(_ sender: Any) {
//        appLocationManager.getCameraOfMyLocation()
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension LocationPickerController: LocationPickerView {
    
}

// MARK: App location Manager

extension LocationPickerController: AppLocationManagerDelegate {

//    func didGetCameraPosition(_ camera: GMSCameraPosition) {
//        mapView.animate(to: camera)
//        /// Console.log("Did get camera position", "\(camera)")
//    }
    
    func didUpdateLocation(_ locations: [CLLocation]) {
        guard let location = locations.last else { return }
        presenter.myLocation = location
        /// Console.log("Did update location", "\(location.coordinate)")
    }
    
    func didUpdateAddressLine(_ address: String) {
        lblAddress.text = address
        presenter.currentAddress = address
        /// Console.log("Did update address", "\(address)")
    }
    
    func didUpdateHeading(_ heading: Double) {
        presenter.currentHeading = heading
        /// Console.log("Did update heading", "\(heading)")
    }
}

// MARK: Map View

//extension LocationPickerController: GMSMapViewDelegate {
//
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        presenter.currentLocation = CLLocation(latitude: position.target.latitude,
//                                               longitude: position.target.longitude)
//
//        appLocationManager.getAddressLine(of: position)
//        /// Console.log("Current location", "\(presenter.currentLocation?.coordinate ?? CLLocationCoordinate2D())")
//    }
//}
