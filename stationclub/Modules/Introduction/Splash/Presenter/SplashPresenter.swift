//
//  SplashPresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class SplashPresenter: SplashPresenterInterface {
    
    weak var view: SplashView?
    var router: SplashRouterInterface!
    var interactor: SplashInteractorInterface!
    
    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if UserRepo().local.isExist(){
                self.router.presentOnboarding()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.router.presentOnboarding()
                }
            }
        }
    }
}

extension SplashPresenter: SplashInteractorOutput {
    
}
