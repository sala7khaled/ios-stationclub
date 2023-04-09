//
//  PodcastController.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class PodcastController: BaseController {
    
    var presenter: PodcastPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
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
