//
//  ImagesPicker.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import Photos

protocol ImagesPickerDelegate {
    func didSelectImage(selectedImage file: LocalFile?)
}

class ImagesPicker: NSObject {
    
    static let shared = ImagesPicker()
    var delegate: ImagesPickerDelegate?
    
    let imagePicker = UIImagePickerController()
    
    func importImage(in vc: UIViewController, option: PickerOptions) {
        switch option {
        case .PHOTOS:
            openPhotos(in: vc)
        case .CAMERA:
            openCamera(in: vc)
        default:
            break
        }
    }
    
    func openPhotos(in vc: UIViewController) {
        PermissionManager.hasPhotosPermission { hasPermission in
            DispatchQueue.main.async {
                if hasPermission {
                    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                        self.imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                        self.present(in: vc)
                    }
                } else {
                    vc.enablePhotosPermission()
                }
            }
        }
    }
    
    func openCamera(in vc: UIViewController) {
        PermissionManager.hasCameraPermission { hasPermission in
            DispatchQueue.main.async {
                if hasPermission {
                    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                        self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                        self.present(in: vc)
                    }
                } else {
                    vc.enableCameraPermission()
                }
            }
        }
    }
    
    func present(in vc: UIViewController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        vc.present(imagePicker, animated: true, completion: nil)
    }
}

extension ImagesPicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[.originalImage] as? UIImage
        let fileName = getFileName(of: info)
        
        var imageURL: URL?
        if let url = info[.imageURL] as? URL {
            imageURL = url
        }
        
        delegate?.didSelectImage(selectedImage: LocalFile(url: imageURL, name: fileName, image: pickedImage))
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getFileName(of info: [UIImagePickerController.InfoKey : Any]) -> String {
        if let asset = info[.phAsset] as? PHAsset, let name = asset.value(forKey: "filename") as? String {
            return name
        } else if let url = info[.imageURL] as? URL {
            return url.lastPathComponent
        }
        return "\(UUID().uuidString).png"
    }
}
