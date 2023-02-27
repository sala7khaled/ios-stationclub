//
//  SignInPresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 07/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class SignInPresenter: SignInPresenterInterface {
    
    weak var view: SignInView?
    var router: SignInRouterInterface!
    var interactor: SignInInteractorInterface!
    
    func didClickedLogin(signForm: SignForm) {
        view?.showBtnLoading()
        interactor.login(signForm)
    }
    
    func showError(_ message: String) {
        router.presentError(message)
    }
}
    
extension SignInPresenter: SignInInteractorOutput {
    
    func didLogin(user: User) {
        view?.hideBtnLoading()
        UserRepo().store(user: user)
        router.presentHome()
        
//        if user.isVerified ?? false {
//            router.presentHome()
//        } else {
//            router.presentVerification(phone: user.phone)
//        }
    }
    
    func didFailedLogin(error: APIError) {
        view?.hideBtnLoading()
        router.presentError(error.message!)
    }

}
