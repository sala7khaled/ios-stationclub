//
//  OnboardCell.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class OnboardCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    func configure(with onboardModel: OnboardModel) {
        img.image = UIImage(named: onboardModel.imgUrl)
        img.addGradient(colors: [.clear, .clear, .appBlack])
        title.text = onboardModel.title
        desc.text = onboardModel.desc
        
        #warning("Hidden labels")
        title.alpha = 0
        desc.alpha = 0
    }
}
