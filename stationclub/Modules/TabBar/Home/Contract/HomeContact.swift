//
//  HomeContract.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresenterInterface! { get set }
    
    func showViewLoading()
    func hideViewLoading()
    
    func reloadUI()
}
    
protocol HomePresenterInterface: AnyObject {
    var view: HomeView? { get set }
    var router: HomeRouterInterface! { get set }
    var interactor: HomeInteractorInterface! { get set }
    
//    var stations: [Station]! { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    
    func didClickedSearch()
    func didClickedStation(of station: Station)
    
    func showError(with message: String?)
}
    
protocol HomeInteractorInterface: AnyObject {
    var output: HomeInteractorOutput? { get set }
    
    func getHome()
}
    
protocol HomeInteractorOutput: AnyObject {
        
//    func didGetHome(home: Home)
    func didFailedGetHome(error: APIError)
}
    
protocol HomeRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }

    func presentStation(of station: Station)
    
    func presentError(with message: String?)
    
    static func assembleModule() -> UIViewController
}
