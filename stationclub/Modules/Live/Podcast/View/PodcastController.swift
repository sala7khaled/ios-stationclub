//
//  PodcastController.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class PodcastController: BaseController {
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgHost: UIImageView!
    @IBOutlet weak var lblHostName: UILabel!
    @IBOutlet weak var lblHostTag: UILabel!
    
    @IBOutlet weak var tagCollectionView: IntrinsicCollectionView!
    @IBOutlet weak var guestCollectionView: IntrinsicCollectionView!
    
    var presenter: PodcastPresenterInterface!
    
    override func viewWillAppear(_ animated: Bool) {
        toggleTabBar(hide: true)
        hideNavigationBar(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initCollectionView()
    }
    
    func setupView() {
        
        let podcast = presenter.podcast!
        
        lblType.text = "podcast".l()
        lblTitle.text = podcast.title
        lblHostName.text = podcast.hostName
        lblHostTag.text = "broadcast_organizer".l()
        
        
        imgCover.loadImage(url: podcast.cover)
        imgCover.setRadius(4)
        imgHost.loadImage(url: podcast.hostAvatar)
        imgHost.setRadius()
    }
    
}

extension PodcastController: PodcastView {
    
    func showViewLoading() {
        showLoading()
        /// view.showAnimatedGradientSkeleton()
    }
    
    func hideViewLoading() {
        hideLoading()
        /// view.hideSkeleton()
    }
    
    func reloadUI() {
    }
}
