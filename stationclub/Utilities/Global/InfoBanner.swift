//
//  InfoBanner.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import SystemConfiguration

class InfoBanner {
    
    private var view = UIView()
    private var lbl = UILabel()
    
    private var isPresented = false
    
    init() {
        view = UIView(frame: CGRect(x: 0, y: -50, width: UIScreen.main.bounds.width, height: 80))
        lbl = UILabel(frame: CGRect(x: 0, y: 30, width: UIScreen.main.bounds.width, height: 50))
        lbl.textColor = .mainText
        lbl.font = UIFont.mediumFont(ofSize: 18)
        lbl.textAlignment = .center
        view.addSubview(lbl)
    }
    
    func show(color: UIColor, with message: String) {
        view.backgroundColor = color
        lbl.text = message
        
        let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({$0 as? UIWindowScene})
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
        
        window?.makeKeyAndVisible()
        
        if !isPresented {
            window?.addSubview(view)
            window?.makeKeyAndVisible()
            view.layer.zPosition = 3
            show()
        }
        
        if isPresented {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.hide()
            }
        }
    }
    
    func show() {
        isPresented = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .transitionCurlDown, animations: {
            self.view.frame.origin.y = 0
        })
    }
    
    func hide() {
        isPresented = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .transitionCurlUp, animations: {
            self.view.removeFromSuperview()
        })
    }
}
