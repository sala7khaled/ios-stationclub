//
//  StationCell.swift
//  stationclub
//
//  Created by Salah Khaled on 05/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {
    
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgStationLogo: UIImageView!

    @IBOutlet weak var lblPodcastTitle: UILabel!
    @IBOutlet weak var lblHostName: UILabel!
    @IBOutlet weak var lblStationName: UILabel!
    @IBOutlet weak var lblListenerCount: UILabel!

    @IBOutlet weak var btnPlay: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        viewBackground.setRadius(10)
        imgStationLogo.setRadius(imgStationLogo.frame.height / 10)

//        imgHostAvatar.oval()
        btnPlay.oval()
    }

    func configure(with station: Station) {
        imgStationLogo.loadImage(url: station.stationImage)
//        imgHostAvatar.loadImage(url: station.hostAvatar)

        lblHostName.text = station.hostName
        lblPodcastTitle.text = station.podcastTitle
        lblStationName.text = station.stationName
        lblListenerCount.text = station.listenCount
    }
    
}
