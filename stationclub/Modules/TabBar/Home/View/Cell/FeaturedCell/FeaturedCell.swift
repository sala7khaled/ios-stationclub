//
//  FeaturedCell.swift
//  stationclub
//
//  Created by Salah Khaled on 04/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class FeaturedCell: UITableViewCell {
    
    @IBOutlet weak var viewKind: UIView!
    @IBOutlet weak var lblKind: UILabel!
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgHostAvatar: UIImageView!
    
    @IBOutlet weak var lblHostName: UILabel!
    @IBOutlet weak var lblListenCount: UILabel!
    @IBOutlet weak var lblPodcastTitle: UILabel!
    
    @IBOutlet weak var btnPlay: AppButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        
        viewKind.setRadius(viewKind.bounds.height / 4)
        viewKind.backgroundColor = UIColor(hex: 0x000000, a: 0.2)
        lblKind.text = "Podcast"
        
        imgCover.addGradient(colors: [.clear, .appBlack , .appBlack, .appBlack])
        imgHostAvatar.oval()

        btnPlay.setTitle("join")
        btnPlay.oval()
        btnPlay.backgroundColor = .appWhite
        btnPlay.setTitleColor(.black, for: .normal)
        btnPlay.setInsets(imagePadding: 12)
    }

    func configure(with station: Station) {
        imgCover.loadImage(url: station.cover)
        imgHostAvatar.loadImage(url: station.hostAvatar)
        
        lblPodcastTitle.text = station.podcastTitle
        lblHostName.text = station.hostName
        lblListenCount.text = station.listenCount
    }
    
}
