//
//  SignInInteractor.swift
//  stationclub
//
//  Created by Salah Khaled on 07/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
    
class SignInInteractor: SignInInteractorInterface {
        
    weak var output: SignInInteractorOutput?
    
    func login(_ signForm: SignForm) {
        AuthRepo.shared.login(signForm: signForm) { [ weak self ] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(response):
                    self.output?.didLogin(user: response)
                case let .onFailure(error):
                    self.output?.didFailedLogin(error: error)
                }
            }
        }
    }
}
