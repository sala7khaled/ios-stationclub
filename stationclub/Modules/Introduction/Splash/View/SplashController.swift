//
//  SplashController.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var viewBackground: UIImageView!
    @IBOutlet weak var lblCopyright: UILabel!
    
    var presenter: SplashPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        spinner.stopAnimating()
    }
    
    
    func setupView() {
        spinner.startAnimating()
        imgLogo.image = UIImage.init(named: Images.appLogo)
        viewBackground.image = UIImage.init(named: Images.splash)
        lblCopyright.text = "copy_right".l()
    }
    
}

extension SplashController: SplashView {
    
}
