//
//  SplashContract.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol SplashView: AnyObject {
    var presenter: SplashPresenterInterface! { get set }
}
    
protocol SplashPresenterInterface: AnyObject {
    var view: SplashView? { get set }
    var router: SplashRouterInterface! { get set }
    var interactor: SplashInteractorInterface! { get set }
    
    func viewDidLoad()
}
    
protocol SplashInteractorInterface: AnyObject {
    var output: SplashInteractorOutput? { get set }
}
    
protocol SplashInteractorOutput: AnyObject {
        
}
    
protocol SplashRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    
    func presentOnboarding()
    func presentLanding()
    func presentHome()

    static func assembleModule() -> UIViewController
}
