//
//  Picker.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import CoreLocation

class Picker: NSObject {
    
    static let shared = Picker()
    var options: [PickerOptions]!
    var vc: UIViewController!
    
    let documentsPicker = DocumentsPicker.shared
    var documentsPickerDelegate: DocumentsPickerDelegate?
    
    let imagesPicker = ImagesPicker.shared
    var imagesPickerDelegate: ImagesPickerDelegate?
    
//    let countryPicker = CountryPicker.shared
//    var countryPickerDelegate: CountryPickerDelegate?
    
    var locationPickerDelegate: LocationPickerDelegate?
    
    func pick(in vc: UIViewController, options: [PickerOptions]) {
        self.vc = vc
        self.options = options
        
        guard !options.isEmpty else { return }
        
        if options.count == 1 {
            pickOne(option: options.first!)
        } else {
            pickMultiple()
        }
    }
    
    func pickOne(option: PickerOptions) {
        switch(option) {
        case .PHOTOS, .CAMERA:
            openImages(option: option)
        case let .DOCUMENT(types):
            openDocuments(types: types)
        case .COUNTRY:
            openCountries()
        case let .LOCATION(initLocation):
            openLocation(initLocation: initLocation)
            break
        }
    }
    
    func pickMultiple() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        vc.addActionSheetForIpad(actionSheet: alert)
        
        options.forEach { option in
            var image: UIImage?
            var action = UIAlertAction()
            
            switch(option) {
            case .PHOTOS:
                image = UIImage(systemName: "photo.fill")
                action = UIAlertAction(title: "photos".l(), style: .default)
                    {_ in self.openImages(option: option)}
                
            case .CAMERA:
                image = UIImage(systemName: "camera.fill")
                action = UIAlertAction(title: "camera".l(), style: .default)
                    {_ in self.openImages(option: option)}
                
            case let .DOCUMENT(types):
                image = UIImage(systemName: "doc.fill")
                action = UIAlertAction(title: "documents".l(), style: .default)
                    {_ in self.openDocuments(types: types)}
                
            case .COUNTRY:
                image = UIImage(systemName: "map.fill")
                action = UIAlertAction(title: "countries".l(), style: .default)
                    {_ in self.openCountries()}
            case let .LOCATION(initLocation):
                image = UIImage(systemName: "location.fill")
                action = UIAlertAction(title: "location".l(), style: .default)
                    {_ in self.openLocation(initLocation: initLocation)}
                break
            }
            
            action.setValue(image, forKey: "image")
            alert.addAction(action)
        }
        
        alert.addAction(UIAlertAction(title: "cancel".l(), style: .cancel))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func openImages(option: PickerOptions) {
        imagesPicker.delegate = imagesPickerDelegate
        imagesPicker.importImage(in: vc, option: option)
    }
    
    func openDocuments(types: [String]) {
        documentsPicker.delegate = documentsPickerDelegate
        documentsPicker.importFile(in: vc, documentTypes: types)
    }
    
    func openCountries() {
//        countryPicker.delegate = countryPickerDelegate
//        countryPicker.setupPicker(vc: vc, delegate: countryPickerDelegate!)
    }
    
    func openLocation(initLocation: CLLocation?) {
        PermissionManager.hasLocationPermission { _ in
            /// Handle open settings
        }
        
        vc.present(LocationPickerRouter.assembleModule(initLocation: initLocation,
                                                       delegate: locationPickerDelegate), animated: true, completion: nil)
    }
}
