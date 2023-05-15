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
    
    let cover: String = "https://gbafrica.net/koojureh/2022/01/THE-WEEKENDNI.jpg"
    let avatar: String = "https://www.vvip.co/wp-content/uploads/2021/12/Weeknd-May-2021.jpg"
    
    var presenter: HomePresenterInterface!
    var stations = [Station]()
    
    override func viewWillAppear(_ animated: Bool) {
        toggleTabBar(hide: false)
        hideNavigationBar(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        let s1 = Station(id: 0,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        let s2 = Station(id: 1,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "Sala7Khaled",
                         podcastTitle: "Out of Time",
                         stationImage: cover,
                         stationName: "The Weeknd",
                         listenCount: "1,220,231")
        
        let s3 = Station(id: 0,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        let s4 = Station(id: 1,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "Sala7Khaled",
                         podcastTitle: "Out of Time",
                         stationImage: cover,
                         stationName: "The Weeknd",
                         listenCount: "1,220,231")
        
        let s5 = Station(id: 0,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover,
                         stationName: "Sala7Khaled",
                         listenCount: "1,220,231")
        
        let s6 = Station(id: 1,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "Sala7Khaled",
                         podcastTitle: "Out of Time",
                         stationImage: cover,
                         stationName: "The Weeknd",
                         listenCount: "1,220,231")
        
        let s7 = Station(id: 0,
                         cover: cover,
                         hostAvatar: avatar,
                         hostName: "The Weeknd",
                         podcastTitle: "Moth to a Flame",
                         stationImage: cover,
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
