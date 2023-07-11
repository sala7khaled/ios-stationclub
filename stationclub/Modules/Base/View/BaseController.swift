//
//  BaseController.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
//import GoogleMaps

public class BaseController: UIViewController {
    
    var loading: LoadingController?
    var empty: EmptyScreenController?
    
    var uiRefreshControl = UIRefreshControl()
    
    var appLocationManager = AppLocationManager()
//    static var currentLocation: CLLocation?
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        loading = LoadingController()
        empty = EmptyScreenController()
        
        appLocationManager = AppLocationManager()
//        appLocationManager.delegate = self
        appLocationManager.setupLocationManager()
        appLocationManager.checkLocationService()
        
        setupNavigation()
        setupBackNavigation()
        
    }
    
}

// MARK: Refresher

extension BaseController {
    
    func addRefresher(_ tableView: UITableView, _ color: UIColor? = .gray) {
        uiRefreshControl.tintColor = color
        tableView.refreshControl = uiRefreshControl
    }
    
    func endRefresher() {
        if uiRefreshControl.isRefreshing {
            uiRefreshControl.endRefreshing()
        }
    }
}

extension BaseController {
    
    /// Show Loading View over Full Screen
    ///
    func showLoading() {
        DispatchQueue.main.async {
            self.loading?.show()
        }
    }

    /// Hide Loading View
    ///
    func hideLoading() {
        DispatchQueue.main.async {
            self.loading?.close()
        }
    }
    
    func showEmpty(in view: UIView) {
        DispatchQueue.main.async {
            self.empty?.showAsSubView(view)
        }
    }

    func hideEmpty() {
        DispatchQueue.main.async {
            self.empty?.close()
        }
    }
}

extension BaseController {
    
    func toggleTabBar(hide: Bool) {
        guard let tabBar = tabBarController as? FloatTabBarController else { return }
        tabBar.toggle(hide: hide)
    }
}

//// MARK: LOCATION
//
//extension BaseController: AppLocationManagerDelegate {
//
//    func didGetCameraPosition(_ camera: GMSCameraPosition) {
//
//    }
//
//    func didUpdateLocation(_ locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        BaseController.currentLocation = location
//
//        #if DEBUG
//        print(BaseController.currentLocation?.coordinate ?? "")
//        #endif
//    }
//
//    func didUpdateAddressLine(_ address: String) {
//
//    }
//
//    func didUpdateHeading(_ heading: Double) {
//
//    }
//}
