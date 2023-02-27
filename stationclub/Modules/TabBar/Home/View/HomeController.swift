//
//  HomeController.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class HomeController: BaseController {
    
    @IBOutlet weak var tableView: IntrinsicTableView!
    
    let cover1: String = "https://gbafrica.net/koojureh/2022/01/THE-WEEKENDNI.jpg"
    
    let cover2: String = "https://ia802907.us.archive.org/22/items/mbid-556548e9-adee-47ac-91e4-ad9c52b2d578/mbid-556548e9-adee-47ac-91e4-ad9c52b2d578-25841812672.jpg"
    
    let avatar: String = "https://www.vvip.co/wp-content/uploads/2021/12/Weeknd-May-2021.jpg"
    
    var presenter: HomePresenterInterface!
    var stations = [Station]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        let s1 = Station(id: 0,
                         cover: cover1,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover2,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        let s2 = Station(id: 1,
                         cover: cover2,
                         hostAvatar: avatar,
                         hostName: "Sala7Khaled",
                         podcastTitle: "Out of Time",
                         stationImage: cover1,
                         stationName: "The Weeknd",
                         listenCount: "1,220,231")
        
        let s3 = Station(id: 0,
                         cover: cover1,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover2,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        let s4 = Station(id: 1,
                         cover: cover2,
                         hostAvatar: avatar,
                         hostName: "Sala7Khaled",
                         podcastTitle: "Out of Time",
                         stationImage: cover1,
                         stationName: "The Weeknd",
                         listenCount: "1,220,231")
        
        let s5 = Station(id: 0,
                         cover: cover1,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover2,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        let s6 = Station(id: 1,
                         cover: cover2,
                         hostAvatar: avatar,
                         hostName: "Sala7Khaled",
                         podcastTitle: "Out of Time",
                         stationImage: cover1,
                         stationName: "The Weeknd",
                         listenCount: "1,220,231")
        
        let s7 = Station(id: 0,
                         cover: cover1,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover2,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        
        stations = [s1, s2, s3, s4, s5, s6, s7]
        
        initTableView()
    }

}


extension HomeController: HomeView {
    
    func showViewLoading() {
        showLoading()
        /// view.showAnimatedGradientSkeleton()
    }
    
    func hideViewLoading() {
        hideLoading()
        /// view.hideSkeleton()
    }
    
    func reloadUI() {
        tableView.reloadData()
    }
}
