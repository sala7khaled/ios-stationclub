//
//  FeaturedCell.swift
//  stationclub
//
//  Created by Salah Khaled on 04/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class FeaturedCell: UITableViewCell {
    
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgHostAvatar: UIImageView!
    @IBOutlet weak var imgStationLogo: UIImageView!
    
    @IBOutlet weak var lblHostName: UILabel!
    @IBOutlet weak var lblPodcastTitle: UILabel!
    @IBOutlet weak var lblStationName: UILabel!
    @IBOutlet weak var lblListenerCount: UILabel!
    
    @IBOutlet weak var btnPlay: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        
//        imgCover.addBlur(style: .systemThickMaterialDark, alpha: 0.5)
        imgCover.addGradient(colors: [.clear, .appBlack , .appBlack, .appBlack])
        
        imgStationLogo.setRadius(imgStationLogo.frame.height / 10)
        imgHostAvatar.oval()
        btnPlay.oval()
    }

    func configure(with station: Station) {
        imgCover.loadImage(url: station.cover)
        imgHostAvatar.loadImage(url: station.hostAvatar)
        imgStationLogo.loadImage(url: station.stationImage)
        
        lblHostName.text = station.hostName
        lblPodcastTitle.text = station.podcastTitle
        lblStationName.text = station.stationName
        lblListenerCount.text = station.listenCount
    }
    
}
