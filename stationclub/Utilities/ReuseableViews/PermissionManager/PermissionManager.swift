//
//  PermissionManager.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import Photos
import CoreLocation
import AVFoundation

class PermissionManager  {
    
    static func hasLocationPermission(completion: @escaping (_ hasPermession: Bool) -> ()) {
        
        let manager = CLLocationManager()
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                switch manager.authorizationStatus {
                case .notDetermined, .restricted, .denied:
                    completion(false)
                case .authorizedAlways, .authorizedWhenInUse:
                    completion(true)
                default:
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
    
    static func hasPhotosPermission(completion: @escaping (_ hasPermession: Bool) -> ()) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted :
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized:
                    completion(true)
                case .denied, .restricted, .notDetermined:
                    completion(false)
                case .limited:
                    completion(true)
                @unknown default:
                    completion(false)
                }
            }
        case .limited:
            completion(true)
        @unknown default:
            completion(false)
        }
    }
    
    static func hasCameraPermission(completion: @escaping (_ hasPermission: Bool) -> ()) {
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        switch cameraAuthorizationStatus {
        case .denied, .restricted:
            completion(false)
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                completion(granted)
            }
        @unknown default:
            completion(false)
        }
    }
}
