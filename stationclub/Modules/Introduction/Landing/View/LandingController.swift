//
//  LandingController.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class LandingController: BaseController {

    @IBOutlet weak var viewGradient: UIView!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblAppName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSignUp: AppButton!
    @IBOutlet weak var btnSignIn: AccentButton!
    @IBOutlet weak var btnSkip: AccentButton!
    
    var presenter: LandingPresenterInterface!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        imgBackground.image = UIImage.init(named: Images.landingBackground)
        viewGradient.alpha = 0.85
        viewGradient.addGradient(colorArray: [.appBlack, .appBlack])
        
        imgLogo.image = UIImage(named: Images.logo)
        lblAppName.text = "app_name".l()
        lblDescription.text = "app_desc".l()
        btnSignUp.setTitle("sign_up_now")
        btnSignIn.setTitle("sign_in")
        btnSkip.setTitle("skip")
        btnSkip.setRadius(20)
        
    }
    
    
    // MARK:- Events
    
    @IBAction func btnSignUpClicked(_ sender: Any) {
        presenter.didClickedSignUp()
    }
    
    @IBAction func btnSignInClicked(_ sender: Any) {
        presenter.didClickedLogIn()
    }
    
    @IBAction func btnSkipClicked(_ sender: Any) {
        presenter.didClickedSkip()
    }
    
}

extension LandingController: LandingView {

}
