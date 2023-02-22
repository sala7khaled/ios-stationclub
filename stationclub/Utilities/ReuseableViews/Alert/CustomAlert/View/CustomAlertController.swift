//
//  CustomAlertController.swift
//  stationclub
//
//  Created by Salah Khaled on 11/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class CustomAlertController: PopupViewController {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnCancel: AccentButton!
    @IBOutlet weak var btnConfirm: AppButton!
    
    var callBack: ((_ didConfirm: Bool)-> Void)?
    
    var alertType: CustomAlertType?
    var alertAction: CustomAlertAction?
    var alertTitle: String?
    var alertMessage: String?
    
    init(type: CustomAlertType, action: CustomAlertAction, title: String, message: String) {
        
        self.alertType = type
        self.alertAction = action
        self.alertTitle = title
        self.alertMessage = message
        
        super.init(nibName: String(describing: Self.self), bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = alertTitle
        lblTitle.isHidden = alertTitle?.isEmpty ?? false
        
        lblMessage.text = alertMessage
        lblMessage.isHidden = alertMessage?.isEmpty ?? false
        
        viewBackground.setRadius(12)
        btnCancel.setRadius(8)
        btnConfirm.setRadius(8)
        
        btnCancel.setTitle("cancel")
        btnConfirm.setTitle("confirm")
        
        btnCancel.layer.backgroundColor = UIColor(hex: 0x16161A).cgColor
        
        switch alertType {
        case .info:
            imgIcon.image = UIImage(named: Images.alertInfo)
            btnConfirm.layer.backgroundColor = UIColor.appBlue.cgColor
        case .success:
            imgIcon.image = UIImage(named: Images.alertSuccess)
            btnConfirm.layer.backgroundColor = UIColor.appGreen.cgColor
            btnConfirm.setTitleColor(UIColor.appBlack, for: .normal)
        case .delete:
            imgIcon.image = UIImage(named: Images.alertDelete)
            btnConfirm.layer.backgroundColor = UIColor.appRed.cgColor
        case .error:
            imgIcon.image = UIImage(named: Images.alertError)
            btnConfirm.layer.backgroundColor = UIColor.primary.cgColor
        case .warning:
            imgIcon.image = UIImage(named: Images.alertWarning)
            btnConfirm.layer.backgroundColor = UIColor.appYellow.cgColor
            btnConfirm.setTitleColor(UIColor.appBlack, for: .normal)
        case .connection:
            imgIcon.image = UIImage(named: Images.alertConnection)
            btnConfirm.layer.backgroundColor = UIColor.primary.cgColor
        default:
            return
        }
        
        switch alertAction {
        case .one:
            btnCancel.isHidden = true
            btnConfirm.setTitle("got_it")
        case .two:
            btnCancel.isHidden = false
        default:
            return
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        if let callBack = callBack {
            callBack(false)
        }
    }
    
    @IBAction func confirm(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        if let callBack = callBack {
            callBack(true)
        }
    }
}
