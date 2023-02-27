//
//  OnboardingContract.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol OnboardingView: AnyObject {
    var presenter: OnboardingPresenterInterface! { get set }
}
    
protocol OnboardingPresenterInterface: AnyObject {
    var view: OnboardingView? { get set }
    var router: OnboardingRouterInterface! { get set }
    var interactor: OnboardingInteractorInterface! { get set }
    
    func didClickedLanguage()
    func didClickedSkip()
    func didClickedGetStarted()
}

protocol OnboardingInteractorInterface: AnyObject {
    var output: OnboardingInteractorOutput? { get set }
}
    
protocol OnboardingInteractorOutput: AnyObject {
        
}
    
protocol OnboardingRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    
    func presentChangeLanguageAlert()
    func presentLanding()

    static func assembleModule() -> UIViewController
}
