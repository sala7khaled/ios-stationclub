//
//  SignInController.swift
//  stationclub
//
//  Created by Salah Khaled on 07/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class SignInController: BaseController {
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var txtFldUsername: AppTextField!
    
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtFldPassword: AppTextField!
    
    @IBOutlet weak var lblForgetPassword: UILabel!
    @IBOutlet weak var btnSignIn: AppButton!
    
    var presenter: SignInPresenterInterface!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        lblUsername.text = "username".l()
        lblPassword.text = "password".l()
        lblForgetPassword.text = "forget_your_password".l()
        
        txtFldUsername.placeholder = "enter_username".l()
        txtFldPassword.placeholder = "enter_password".l()
        
        txtFldUsername.delegate = self
        txtFldPassword.delegate = self
        
        #warning("Dummy credential")
        txtFldUsername.text = "acharlota"
        txtFldPassword.text = "M9lbMdydMN"
        
        btnSignIn.setTitle("sign_in")
//        btnSignIn.setStatus(.inactive)
        
        txtFldUsername.roles = [
            RegExRole(errorMessage: "empty_username".l(), validate: Validator.shared.isNotEmpty),
            RegExRole(errorMessage: "invalid_username".l(), validate: Validator.shared.isName)
        ]
        
        txtFldPassword.roles = [
            RegExRole(errorMessage: "empty_password".l(), validate: Validator.shared.isNotEmpty),
            RegExRole(errorMessage: "invalid_password".l(), validate: Validator.shared.isPassword)
        ]
        
        txtFldPassword.enablePasswordToggle()
        
    }
    
    // MARK:- Events
    
    @IBAction func btnLogInClicked(_ sender: Any) {
        
        if !txtFldUsername.validate() {
            presenter.showError(txtFldUsername.errorMessage ?? "")
        } else if !txtFldPassword.validate() {
            presenter.showError(txtFldPassword.errorMessage ?? "")
        } else {
            let signForm = SignForm(username: txtFldUsername.text!, password: txtFldPassword.text!)
            presenter.didClickedLogin(signForm: signForm)
        }
    }
    
}

extension SignInController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        _ = (textField as! AppTextField).validate()
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        (textField as! AppTextField).isValid = true
    }
}

extension SignInController: SignInView {
    
    func showBtnLoading() {
        btnSignIn.showLoading()
    }
    
    func hideBtnLoading() {
        btnSignIn.hideLoading()
    }
}
