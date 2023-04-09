//
//  PodcastRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class PodcastRouter: PodcastRouterInterface {

    weak var viewController: UIViewController?
    
    func presentStation(of station: Station) {
//        let vc = StationRouter.assembleModule(with: station)
//        RootRouter.presentRootNav(with: vc)
    }
    
    func presentError(with message: String?) {
        viewController?.showError(message: message ?? "".l(), completion: { didConfirm in
            
        })
    }

    static func assembleModule(podcast: Podcast) -> UIViewController {
        let view: PodcastController = PodcastController.loadFromNib()
            
        let presenter = PodcastPresenter()
        let interactor = PodcastInteractor()
        let router = PodcastRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        presenter.podcast = podcast
        
        return view
    }
}
