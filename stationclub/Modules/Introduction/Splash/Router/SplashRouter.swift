//
//  SplashRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class SplashRouter: SplashRouterInterface {

    weak var viewController: UIViewController?
    
    
    func presentOnboarding() {
        let vc = OnboardingRouter.assembleModule()
        RootRouter.presentRoot(vc)
    }
    
    func presentLanding() {
        let vc = LandingRouter.assembleModule()
        RootRouter.presentRootNav(with: vc)
    }
    
    func presentHome() {
        RootRouter.presentRootTab()
    }

    
    static func assembleModule() -> UIViewController {
        let view: SplashController = SplashController.loadFromNib()

        let presenter = SplashPresenter()
        let interactor = SplashInteractor()
        let router = SplashRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view

        return view
    }
}

