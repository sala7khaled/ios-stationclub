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
    var buttonSize: CGFloat = 60

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
        layer.backgroundColor = UIColor.clear.cgColor
    
        setRadius(bounds.height / 2.8)
        addBlur()
        addShadow(shadowRadius: bounds.height / 3, color: .subText, offset: .zero, opacity: 0.2)
    }

    func setupStackView(_ icons: [String]) {
        for (index, icon) in icons.enumerated() {
            let symbolConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium, scale: .medium)
            let normalIcon = UIImage(systemName: icon, withConfiguration: symbolConfig)
            let selectedIcon = UIImage(systemName: "\(icon).fill", withConfiguration: symbolConfig)
            let button = createButton(normalIcon: normalIcon!, selectedIcon: selectedIcon!, index: index)
            buttons.append(button)
        }
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }

    func createButton(normalIcon: UIImage, selectedIcon: UIImage, index: Int) -> UIButton {
        let button = UIButton()
        button.constraintHeight(constant: buttonSize)
        button.setImage(normalIcon, for: .normal)
        button.setImage(selectedIcon, for: .selected)
        button.tag = index
        button.addTarget(self, action: #selector(changeTab(_:)), for: .touchUpInside)
        return button
    }

    func updateUI(selectedIndex: Int = 0) {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.isSelected = true
                button.tintColor = .appWhite
            } else {
                button.isSelected = false
                button.tintColor = .subText
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
