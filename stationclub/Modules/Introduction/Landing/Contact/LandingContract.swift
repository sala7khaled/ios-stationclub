//
//  LandingContract.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol LandingView: AnyObject {
    var presenter: LandingPresenterInterface! { get set }
}
    
protocol LandingPresenterInterface: AnyObject {
    var view: LandingView? { get set }
    var router: LandingRouterInterface! { get set }
    var interactor: LandingInteractorInterface! { get set }
    
    func didClickedSkip()
    func didClickedSignUp()
    func didClickedSignIn()
}

protocol LandingInteractorInterface: AnyObject {
    var output: LandingInteractorOutput? { get set }
}
    
protocol LandingInteractorOutput: AnyObject {
        
}
    
protocol LandingRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    
    func presentHome()
    func presentSignUp()
    func presentSignIn()

    static func assembleModule() -> UIViewController
}
