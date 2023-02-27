//
//  HomeRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterInterface {

    weak var viewController: UIViewController?
    
    func presentStation(of station: Station) {
//        let vc = StationRouter.assembleModule(with: station)
//        RootRouter.presentRootNav(with: vc)
    }
    
    func presentError(with message: String?) {
        viewController?.showError(message: message ?? "".l(), completion: { didConfirm in
            
        })
    }

    static func assembleModule() -> UIViewController {
        let view: HomeController = HomeController.loadFromNib()
            
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
