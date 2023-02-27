//
//  HeaderCell.swift
//  stationclub
//
//  Created by Salah Khaled on 05/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
    }

    func configure(with title: String) {
        lblTitle.text = title
    }
    
}
