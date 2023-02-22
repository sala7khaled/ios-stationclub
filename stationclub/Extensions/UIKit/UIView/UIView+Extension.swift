//
//  UIView+Extension.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

struct AssociatedKeys {
    static var actionState: UInt8 = 0
}

typealias ActionTap = () -> Void

extension UIView {
    
    func setRadius(_ radius: CGFloat? = nil) {
                
        if let radius = radius {
            layer.cornerRadius = radius
            clipsToBounds = true
        } else {
            oval()
        }
    }
    
    func oval() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    
    var addAction: ActionTap? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.actionState) as? ActionTap else {
                return nil
            }
            return value
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.actionState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.tapWithAnimation()
        }
    }
    
    func tapWithAnimation() {
        self.gestureRecognizers?.removeAll()
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(viewLongTap(_:)))
        longTap.minimumPressDuration = 0.035
        self.isUserInteractionEnabled = true
        longTap.delaysTouchesBegan = true
        self.addGestureRecognizer(longTap)
    }
    
    func addShadow(shadowRadius: CGFloat = 10.0,
                         color: UIColor = .purple,
                         offset: CGSize = CGSize(width: 1.0, height: 2.0),
                         opacity: Float = 0.3) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    func addShadow(color: UIColor,
                   alpha: Float,
                   x: CGFloat,
                   y: CGFloat,
                   blur: CGFloat,
                   spread: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func addGradient(colorArray: [UIColor], type: CAGradientLayerType! = .axial) {
                
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = type
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        
//        gradientLayer.startPoint = CGPoint(x: 100, y: 100)
//        gradientLayer.endPoint = CGPoint(x: self.bounds.width, y: self.bounds.height)
        
        var rec: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        gradientLayer.frame =  rec

        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addBlur(index: Int = 0, style: UIBlurEffect.Style = .systemThickMaterialDark, alpha: CGFloat = 0.5) {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.frame = self.bounds
        blurView.alpha = alpha
        blurView.setRadius(layer.cornerRadius)
        insertSubview(blurView, at: index)
    }

    
    @objc
    func viewLongTap(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state != .ended {
            animateView(alpha: 0.3)
            return
        } else if gesture.state == .ended {
            let touchLocation = gesture.location(in: self)
            if self.bounds.contains(touchLocation) {
                animateView(alpha: 1)
                addAction?()
                return
            }
        }
        animateView(alpha: 1)
    }
    
    fileprivate func animateView(alpha: CGFloat) {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.subviews.forEach { subView in
                subView.alpha = alpha
            }
        })
    }
    
    class var instanceFromNib: UIView {
        return Bundle(for: Self.self).loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! Self
    }
}


// MARK:- Auto Layout

extension UIView {

    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {

        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }

        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }

        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }

        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach {$0?.isActive = true}

        return anchoredConstraints
    }

    func fillSuperView(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }

        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }

        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }

        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }

    func centerInSuperView(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }

        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    func centerXInSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }

    func centerYInSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func constraints(equalTo view: UIView, top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottom).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -right).isActive = true
        }
    }

    func constraintWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func constraintHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}


// MARK:- Container View

extension UIView {
    
    func presentChildVC(in parent: UIViewController, with vc: UIViewController) {
        
        self.addSubview(vc.view)
        vc.view.bounds = self.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.didMove(toParent: parent)
        vc.view.fillSuperView()
        
    }
    
    func removeChildVC (with vc: UIViewController) {
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
}
