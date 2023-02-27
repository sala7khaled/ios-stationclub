//
//  LandingRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class LandingRouter: LandingRouterInterface {
    
    weak var viewController: UIViewController?
    
    
    func presentHome() {
        RootRouter.presentRootTab()
    }
    
    func presentSignUp() {
        
    }
    
    func presentSignIn() {
        let vc = SignInRouter.assembleModule()
        RootRouter.pushVC(vc, in: viewController!)
    }
    
    static func assembleModule() -> UIViewController {
        let view: LandingController = LandingController.loadFromNib()
            
        let presenter = LandingPresenter()
        let interactor = LandingInteractor()
        let router = LandingRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
