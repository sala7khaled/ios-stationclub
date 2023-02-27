//
//  HomePresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterInterface {

    weak var view: HomeView?
    var router: HomeRouterInterface!
    var interactor: HomeInteractorInterface!
    
//    var stations: [Station]! = []
    
    func viewDidLoad() {
        view?.showViewLoading()
        interactor.getHome()
    }
    
    func viewWillAppear() {
        interactor.getHome()
    }
    
    func didClickedSearch() {
    }
    
    func didClickedStation(of station: Station) {
        router.presentStation(of: station)
    }
    
    func showError(with message: String?) {
        router.presentError(with: message)
    }
}
    
extension HomePresenter: HomeInteractorOutput {
        
//    func didGetHome(home: Home) {
//        view?.hideViewLoading()
//
//        stations = home.stations ?? []
//
//        view?.reloadUI()
//    }
    
    func didFailedGetHome(error: APIError) {
        view?.hideViewLoading()
        router.presentError(with: error.message)
    }
}
