//
//  BaseRouter.swift
//  stationclub
//
//  Created by Salah Khaled on 07/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class BaseRouter: UIViewController {

    func presentBack(_ vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }
    
    func presentSearch(_ vc: UIViewController) {
        print("Present Search...")
    }
    
    func presentShare(_ vc: UIViewController) {
        print("Present Share...")
    }

}
