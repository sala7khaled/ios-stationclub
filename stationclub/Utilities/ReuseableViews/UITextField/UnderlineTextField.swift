//
//  UnderlineTextField.swift
//  stationclub
//
//  Created by Salah Khaled on 10/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

@IBDesignable
class UnderlineTextField: UITextField {
    
    var insidePadding: CGFloat = 5
    var originalBorderWidth: CGFloat = 0.0
    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 20, right: 30)
    
    let border = CALayer()
    let label = UILabel()
    
    var roles: [RegExRole]?
    
    var isValid = true
    
    var errorMessage: String? {
        didSet {
            configure()
        }
    }
    
    @IBInspectable var icon: UIImage? {
        didSet {
            if let image = icon {
                let imageView = setupImageView(with: image, tintColor: .systemGray)
                leftViewMode = UITextField.ViewMode.always
                leftView = imageView
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        configure()
    }
    
    func setupView() {
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - 20,
                              width: self.frame.size.width + 30,
                              height: 1)
        border.borderWidth = 1
        layer.addSublayer(border)
        layer.masksToBounds = true
        
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure() {
        border.borderColor = errorMessage == nil ? UIColor.systemGray.cgColor : UIColor.red.cgColor
        
        if let message = errorMessage {
            label.text = message
            self.addSubview(label)
            
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            label.widthAnchor.constraint(equalToConstant: self.frame.size.width).isActive = true
            
            self.setNeedsDisplay()
        } else {
            label.removeFromSuperview()
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x += -insidePadding
        rect.origin.y -= 10
        return rect
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x -= -insidePadding
        rect.origin.y -= 10
        return rect
    }
    
    func setupImageView(with image: UIImage?, tintColor: UIColor) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.tintColor = tintColor
        return imageView
    }
    
    func validate() -> Bool {
        isValid = true
        errorMessage = nil
        
        if let roles = roles {
            for regExRole in roles {
                isValid = regExRole.validate(text)
                if !isValid {
                    errorMessage = regExRole.errorMessage
                    break
                }
            }
        }
        return isValid
    }
}
