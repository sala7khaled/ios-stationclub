//
//  UIViewController+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    private func present(_ vc: UIViewController) {
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
    
    func showAlert(_ alert: CustomAlert, completion: @escaping (Bool) -> ()) {
        let alert = CustomAlertController(type: alert.type,
                                          action: alert.action,
                                          title: alert.title,
                                          message: alert.message,
                                          buttonTitle: alert.buttonTitle) { didConfirm in
            completion(didConfirm)
        }
        present(alert)
    }
    
    func showError(message: String, completion: @escaping (Bool) -> ()) {
        let alert = CustomAlertController(type: .error,
                                          action: .one,
                                          title: "",
                                          message: message,
                                          buttonTitle: "ok".l()) { didConfirm in
            completion(didConfirm)
        }
        present(alert)
    }
    
    func showNetworkError(completion: @escaping (Bool) -> ()) {
        let alert = CustomAlertController(type: .connection,
                                          action: .one,
                                          title: "No internet connection!".l(),
                                          message: "",
                                          buttonTitle: "try_again".l()) { didConfirm in
            completion(didConfirm)
        }
        present(alert)
    }
    
    func switchLanguageAlert() {
        let alert = CustomAlertController(type: .info,
                                            action: .two,
                                            title: "change_language_title".l(),
                                          message: "change_language_message".l(),
                                            buttonTitle: "change".l()) { _ in
            Localization.shared.switchLanguage()
        }
        present(alert)
        
//        AlertController.shared.show(in: self,
//                                    title: "change_language".l(),
//                                    message: Localization.shared.currentLanguage() == .English ? "change_language_to_arabic".l() : "change_language_to_english".l(),
//                                    btnTitle: "ok".l(),
//                                    withCancel: true,
//                                    style: .actionSheet) { _ in
//            Localization.shared.switchLanguage()
//        }
    }
    
    public func addActionSheetForIpad(actionSheet: UIAlertController) {
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }
    
    func enablePhotosPermission() {
        AlertController.shared.show(in: self,
                                    title: "enable_photos_permission".l(),
                                    btnTitle: "go_to_settings".l(),
                                    withCancel: true,
                                    style: .actionSheet) { _ in Utilities.openSettings() }
    }
    
    func enableCameraPermission() {
        AlertController.shared.show(in: self,
                                    title: "enable_camera_permission".l(),
                                    btnTitle: "go_to_settings".l(),
                                    withCancel: true,
                                    style: .actionSheet) { _ in Utilities.openSettings() }
    }
    
    func enableLocationPermission() {
        AlertController.shared.show(in: self,
                                    title: "enable_location_permission".l(),
                                    btnTitle: "go_to_settings".l(),
                                    withCancel: true,
                                    style: .actionSheet) { _ in Utilities.openSettings() }
    }
}
