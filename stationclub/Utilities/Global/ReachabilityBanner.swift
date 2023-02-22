//
//  ReachabilityBanner.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import SystemConfiguration

class ReachabilityBanner {
    
    private var view = UIView()
    private var lbl = UILabel()
    
    private var isPresented = false
    
    init() {
        view = UIView(frame: CGRect(x: 0, y: -50, width: UIScreen.main.bounds.width, height: 80))
        lbl = UILabel(frame: CGRect(x: 0, y: 30, width: UIScreen.main.bounds.width, height: 50))
        lbl.textColor = .mainText
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.textAlignment = .center
        view.addSubview(lbl)
    }
    
    func notifyStatusBar(in window: UIWindow?, for flags: SCNetworkReachabilityFlags) {
        switch flags.rawValue {
        case 0:
            view.backgroundColor = .systemRed
            lbl.text = "no_internet_connection".l()
        default:
            view.backgroundColor = .systemGreen
            lbl.text = "connected".l()
        }
        
        if flags.rawValue == 0 && !isPresented {
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
