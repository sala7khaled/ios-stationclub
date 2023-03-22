//
//  StationCell.swift
//  stationclub
//
//  Created by Salah Khaled on 05/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {
    
    @IBOutlet weak var viewKind: UIView!
    @IBOutlet weak var lblKind: UILabel!
    
    @IBOutlet weak var imgPodcast: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblHostName: UILabel!
    @IBOutlet weak var lblListenerCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        imgPodcast.setRadius(imgPodcast.frame.height / 30)
        
        viewKind.setRadius(viewKind.bounds.height / 4)
        viewKind.backgroundColor = UIColor(hex: 0x000000, a: 0.2)
        lblKind.text = "Podcast"
    }

    func configure(with station: Station) {
        imgPodcast.loadImage(url: station.stationImage)

        lblHostName.text = station.hostName
        lblTitle.text = station.podcastTitle
        lblHostName.text = station.stationName
        lblListenerCount.text = station.listenCount
    }
    
}
