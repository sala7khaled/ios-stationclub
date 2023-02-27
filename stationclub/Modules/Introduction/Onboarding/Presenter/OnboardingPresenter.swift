//
//  OnboardingPresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class OnboardingPresenter: OnboardingPresenterInterface {
    
    weak var view: OnboardingView?
    var router: OnboardingRouterInterface!
    var interactor: OnboardingInteractorInterface!
}
    
extension OnboardingPresenter: OnboardingInteractorOutput {
    
    func didClickedLanguage() {
        router.presentChangeLanguageAlert()
    }
    
    func didClickedSkip() {
        router.presentLanding()
    }
    
    func didClickedGetStarted() {
        router.presentLanding()
    }

}
