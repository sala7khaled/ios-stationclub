//
//  PopupViewController.swift
//  stationclub
//
//  Created by Salah Khaled on 10/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class PopupViewController: BaseController {
    
    public let viewBack = UIView()
    
    public init(nibName: String, bundle: Bundle) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setupAction()
    }
    
    private func initUI() {
        view.backgroundColor = .clear
        view.insertSubview(viewBack, at: 0)
        viewBack.fillAnchors(toView: view)
    }
    
    public func setupAction() {
        let tab = UITapGestureRecognizer(target: self, action: #selector(viewBackTap))
        viewBack.addGestureRecognizer(tab)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewBack.fadeInBackground(duration: 0.35, after: 0.35, alpha: 0.5)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewBack.frame = view.frame
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewBack.fadeOutBackground()
    }
    
    @objc func viewBackTap() {
        dismiss(animated: true, completion: nil)
    }
}

extension UIView {
    
    func leadingAnchorEqual(toView: UIView, constant: CGFloat = 0) {
        self.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: constant).isActive = true
    }
    
    func topAnchorEqual(toView: UIView, constant: CGFloat = 0) {
        self.topAnchor.constraint(equalTo: toView.topAnchor, constant: constant).isActive = true
    }
    
    func bottomAnchorEqual(toView: UIView, constant: CGFloat = 0) {
        self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -constant).isActive = true
    }
    
    func trailingAnchorEqual(toView: UIView, constant: CGFloat = 0) {
        self.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -constant).isActive = true
    }
    
    func fillAnchors(toView: UIView, constant: CGFloat = 0) {
        self.leadingAnchorEqual(toView: toView, constant: constant)
        self.trailingAnchorEqual(toView: toView, constant: constant)
        self.topAnchorEqual(toView: toView, constant: constant)
        self.bottomAnchorEqual(toView: toView, constant: constant)
    }
    
    /**
     fadeInBackground a view with a duration
     
     - parameter duration: The custom animation duration
     - parameter after: The duration before start animate
     - parameter alpha: The last alpha value
     - parameter color: The background color of view
     */
    func fadeInBackground(duration: TimeInterval = 1,
                          after: TimeInterval = 0.25,
                          alpha: CGFloat = 0.5,
                          color backgroudColor: UIColor = .black) {
        self.backgroundColor = backgroudColor.withAlphaComponent(0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            UIView.animate(withDuration: duration, animations: {
                self.backgroundColor = backgroudColor.withAlphaComponent(alpha)
            })
        }
    }
    
    /**
     fadeOutBackground a view with a duration
     
     - parameter duration: The custom animation duration
     - parameter after: The duration before start animate
     - parameter alpha: The first alpha value
     - parameter color: The background color of view
     */
    func fadeOutBackground(duration: TimeInterval? = nil,
                           after: TimeInterval = 0.25,
                           alpha: CGFloat = 0.5,
                           color backgroudColor: UIColor = .black) {
        if let duration = duration {
            self.backgroundColor = backgroudColor.withAlphaComponent(alpha)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + after) {
                UIView.animate(withDuration: duration, animations: {
                    self.backgroundColor = backgroudColor.withAlphaComponent(0)
                })
            }
        } else {
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(0)
        }
    }
}
