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
    
    var alertType: AlertType?
    var alertAction: AlertAction?
    var alertTitle: String?
    var alertMessage: String?
    var alertButtonTitle: String?
    var completion: (Bool) -> ()
    
    init(type: AlertType, action: AlertAction, title: String, message: String, buttonTitle: String, completion: @escaping (Bool) -> ()) {
        
        self.alertType = type
        self.alertAction = action
        self.alertTitle = title
        self.alertMessage = message
        self.alertButtonTitle = buttonTitle
        self.completion = completion
        
        super.init(nibName: String(describing: Self.self), bundle: .init(for: Self.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        lblTitle.text = alertTitle
        lblTitle.isHidden = alertTitle?.isEmpty ?? false
        
        lblMessage.text = alertMessage
        lblMessage.isHidden = alertMessage?.isEmpty ?? false
        
        viewBackground.setRadius(12)
        btnCancel.setRadius(8)
        btnConfirm.setRadius(8)
        
        btnCancel.setTitle("cancel")
        btnConfirm.setTitle(alertButtonTitle!)
        
        
        btnCancel.layer.backgroundColor = UIColor(hex: 0x19191E).cgColor
        btnCancel.setTitleColor(UIColor.subText, for: .normal)
        
        btnConfirm.layer.backgroundColor = UIColor.primary.cgColor
        
        switch alertType {
        case .info:
            imgIcon.image = UIImage(named: Images.alertInfo)
        case .success:
            imgIcon.image = UIImage(named: Images.alertSuccess)
            btnConfirm.layer.backgroundColor = UIColor.appGreen.cgColor
            btnConfirm.setTitleColor(UIColor.appCell, for: .normal)
        case .delete:
            imgIcon.image = UIImage(named: Images.alertDelete)
            btnConfirm.layer.backgroundColor = UIColor.appRed.cgColor
        case .error:
            imgIcon.image = UIImage(named: Images.alertError)
        case .warning:
            imgIcon.image = UIImage(named: Images.alertWarning)
            btnConfirm.layer.backgroundColor = UIColor.appYellow.cgColor
            btnConfirm.setTitleColor(UIColor.appCell, for: .normal)
        case .connection:
            imgIcon.image = UIImage(named: Images.alertConnection)
        default:
            return
        }
        
        switch alertAction {
        case .one:
            btnCancel.isHidden = true
        case .two:
            btnCancel.isHidden = false
        default:
            return
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func confirm(_ sender: Any) {
        completion(true)
        dismiss(animated: true)
    }
}
