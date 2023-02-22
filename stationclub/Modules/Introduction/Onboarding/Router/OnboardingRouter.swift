//
//  OnboardingRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class OnboardingRouter: OnboardingRouterInterface {
        
    weak var viewController: UIViewController?
    
    func presentChangeLanguageAlert() {
        viewController?.switchLanguageAlert()
    }
    
    func presentLanding() {
        let vc = LandingRouter.assembleModule()
        RootRouter.presentRoot(vc)
    }
    
    static func assembleModule() -> UIViewController {
        let view: OnboardingController = OnboardingController.loadFromNib()
            
        let presenter = OnboardingPresenter()
        let interactor = OnboardingInteractor()
        let router = OnboardingRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
