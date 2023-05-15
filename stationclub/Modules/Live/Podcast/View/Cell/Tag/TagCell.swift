//
//  TagCell.swift
//  stationclub
//
//  Created by Salah's iMac on 11/04/2023.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        viewBackground.oval()
        viewBackground.backgroundColor = UIColor(hex: 0xFAC359, a: 0.2)
    }
    
    func configure(with tag: String) {
        lblTag.text = tag
    }
    
}
