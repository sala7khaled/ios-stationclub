//
//  AccentButton.swift
//  stationclub
//
//  Created by Salah Khaled on 02/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class AccentButton: LoadingButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(textColor: .mainText, backColor: .transparent)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(textColor: .mainText, backColor: .transparent)
    }
}
