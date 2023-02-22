//
//  FloatTabBarView.swift
//  stationclub
//
//  Created by Salah Khaled on 31/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol FloatTabBarViewDelegate: AnyObject {
    func didSelect(index: Int)
}

class FloatTabBarView: UIView {

    weak var delegate: FloatTabBarViewDelegate?
    var buttons: [UIButton] = []

    init(_ icons: [String]) {
        super.init(frame: .zero)
        setupStackView(icons)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

//        layer.backgroundColor = UIColor.tabBar.cgColor
        setRadius(bounds.height / 3.5)
        addBlur(alpha: 0.8)
        addShadow(shadowRadius: bounds.height / 5, color: .subText, offset: .zero, opacity: 0.2)
    }

    func setupStackView(_ icons: [String]) {
        for (index, icon) in icons.enumerated() {
            let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .medium)
            let normalIcon = UIImage(systemName: icon, withConfiguration: symbolConfig)
            let selectedIcon = UIImage(systemName: "\(icon).fill", withConfiguration: symbolConfig)
            let button = createButton(normalIcon: normalIcon!, selectedIcon: selectedIcon!, index: index)
            buttons.append(button)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }

    func createButton(normalIcon: UIImage, selectedIcon: UIImage, index: Int) -> UIButton {
        let button = UIButton()
        button.constraintWidth(constant: 60)
        button.constraintHeight(constant: 60)
        button.setImage(normalIcon, for: .normal)
        button.setImage(selectedIcon, for: .selected)
        button.tag = index
//        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(changeTab(_:)), for: .touchUpInside)
        return button
    }

    func updateUI(selectedIndex: Int = 0) {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.isSelected = true
                button.tintColor = .appRed
            } else {
                button.isSelected = false
                button.tintColor = .gray
            }
        }
    }
    
    @objc
    func changeTab(_ sender: UIButton) {
        sender.pulse()
        delegate?.didSelect(index: sender.tag)
        updateUI(selectedIndex: sender.tag)
    }

    func toggle(hide: Bool) {
        if !hide {
            isHidden = hide
        }

        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.alpha = hide ? 0 : 1
            self.transform = hide ? CGAffineTransform(translationX: 0, y: 10) : .identity
        }) { (_) in
            if hide {
                self.isHidden = hide
            }
        }
    }
}
