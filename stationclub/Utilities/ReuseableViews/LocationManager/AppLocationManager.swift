//
//  AppLocationManager.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
//import GoogleMaps

protocol AppLocationManagerDelegate {
//    func didGetCameraPosition(_ camera: GMSCameraPosition)
    func didUpdateLocation(_ locations: [CLLocation])
    func didUpdateAddressLine(_ address: String)
    func didUpdateHeading(_ heading: Double)
}

class AppLocationManager: NSObject {
    
    // MARK: Variables
    
    static let shared = AppLocationManager()
    let locationManager = CLLocationManager()
    
    var locations: [CLLocation] = []
    
    // MARK: Delegate
    
    var delegate: AppLocationManagerDelegate?
    
    override init() {
        super.init()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationService() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.setupLocationManager()
                self.checkLocationAuthorization()
            }
        }
//        if CLLocationManager.locationServicesEnabled() {
//            setupLocationManager()
//            checkLocationAuthorization()
//        }
    }
    
    func checkLocationAuthorization() {
        PermissionManager.hasLocationPermission { hasPermission in
            if hasPermission {
                self.locationManager.startUpdatingLocation()
            } else {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
    }
    
    func calculateDistance(to: CLLocation) -> CLLocationDistance {
        guard  let location = locationManager.location else { return 0 }
        return to.distance(from: location)
    }
    
    func calculateDistance(from: CLLocation, to: CLLocation) -> CLLocationDistance {
        return to.distance(from: from)
    }
}

// MARK: CLLocationManagerDelegate

extension AppLocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locations = locations
        delegate?.didUpdateLocation(locations)
    }
    
    /// Get camera on my location.
    ///
//    func getCameraOfMyLocation() {
//        let location = locations.last
//        let camera = GMSCameraPosition.camera(
//            withLatitude: location?.coordinate.latitude ?? Constants.defaultMapCoordinate.latitude,
//            longitude: location?.coordinate.longitude ?? Constants.defaultMapCoordinate.longitude, zoom: 17.0)
//        delegate?.didGetCameraPosition(camera)
//    }
    
    /// Get camera on location.
    ///
    /// - Parameters:
    ///   - coordinate: CLLocationCoordinate2D
    ///   - zoom: Float
    ///
//    func getCameraOn(coordinate: CLLocationCoordinate2D, zoom: Float) {
//        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude:  coordinate.longitude, zoom: zoom)
//        delegate?.didGetCameraPosition(camera)
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let heading: Double = newHeading.trueHeading
        delegate?.didUpdateHeading(heading)
    }
    
//    func getAddressLine(of position: GMSCameraPosition) {
//        let selectedLocation = CLLocationCoordinate2D(latitude: position.target.latitude,
//                                                      longitude: position.target.longitude)
//
//        let placeName = GMSGeocoder()
//        placeName.reverseGeocodeCoordinate(selectedLocation) { response, error in
//            guard let address = response?.firstResult(),
//                  let lines = address.lines else {
//                return
//            }
//
//            let addressLine = lines.joined(separator: "\n")
//            self.delegate?.didUpdateAddressLine(addressLine)
//        }
//    }
}

// MARK: Apple Map and Google Map

extension AppLocationManager {
    
    /// Open Apple Maps.
    ///
    /// - Parameters:
    ///   - latitude: CLLocationDegrees
    ///   - longitude: CLLocationDegrees
    ///   - name: String
    ///
    static func openAppleMap(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees, _ name: String) {
        let regionDistance: CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
    }
    
    /// Open Google Maps.
    ///
    /// - Parameters:
    ///   - latitude: CLLocationDegrees
    ///   - longitude: CLLocationDegrees
    ///   - name: String
    ///
    static func openGoogleMap(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees, _ name: String) {
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            UIApplication.shared.open(NSURL(string: "comgooglemaps://?saddr=&daddr=\(Float(latitude)),\(Float(longitude))&directionsmode=driving")! as URL)
        } else {
            openAppleMap(latitude, longitude, name)
        }
    }
}
