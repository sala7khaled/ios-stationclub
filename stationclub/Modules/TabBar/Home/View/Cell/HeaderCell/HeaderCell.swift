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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with title: String) {
        lblTitle.text = title
    }
    
}
