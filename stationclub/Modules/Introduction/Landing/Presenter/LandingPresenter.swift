//
//  LandingPresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class LandingPresenter: LandingPresenterInterface {
    
    weak var view: LandingView?
    var router: LandingRouterInterface!
    var interactor: LandingInteractorInterface!
}
    
extension LandingPresenter: LandingInteractorOutput {
    
    func didClickedSkip() {
        router.presentHome()
    }
    
    func didClickedSignUp() {
        router.presentSignUp()
    }
    
    func didClickedSignIn() {
        router.presentSignIn()
    }
}
