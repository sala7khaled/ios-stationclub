//
//  SignInRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 07/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class SignInRouter: SignInRouterInterface {

    weak var viewController: UIViewController?
    
    func presentHome() {
        RootRouter.presentRootTab()
    }
    
    func presentSignUp() {
        
    }
    
    func presentError(_ message: String) {
        viewController?.showError(message: message, completion: {
            _ in
        })
    }
    
    static func assembleModule() -> UIViewController {
        let view: SignInController = SignInController.loadFromNib()
            
        let presenter = SignInPresenter()
        let interactor = SignInInteractor()
        let router = SignInRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
