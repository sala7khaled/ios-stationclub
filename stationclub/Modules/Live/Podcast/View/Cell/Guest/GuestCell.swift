//
//  GuestCell.swift
//  stationclub
//
//  Created by Salah's iMac on 11/04/2023.
//

import UIKit

class GuestCell: UICollectionViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
    }
    
    func configure(with guest: Guest) {
        imgAvatar.loadImage(url: guest.avatar)
        imgAvatar.oval()
        lblName.text = guest.name
    }
    
}
