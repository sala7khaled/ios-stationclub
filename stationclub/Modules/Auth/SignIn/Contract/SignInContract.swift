//
//  SignInContract.swift
//  stationclub
//
//  Created by Salah Khaled on 07/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol SignInView: AnyObject {
    var presenter: SignInPresenterInterface! { get set }
    
    func showBtnLoading()
    func hideBtnLoading()
}
    
protocol SignInPresenterInterface: AnyObject {
    var view: SignInView? { get set }
    var router: SignInRouterInterface! { get set }
    var interactor: SignInInteractorInterface! { get set }
    
    func didClickedLogin(signForm: SignForm)
    func showError(_ message: String)
}

protocol SignInInteractorInterface: AnyObject {
    var output: SignInInteractorOutput? { get set }
    
    func login(_ signForm: SignForm)
    
}
    
protocol SignInInteractorOutput: AnyObject {
    
    func didLogin(user: User)
    func didFailedLogin(error: APIError)
}
    
protocol SignInRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    
    func presentHome()
    func presentError(_ message: String)

    static func assembleModule() -> UIViewController
}
