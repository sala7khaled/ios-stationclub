//
//  PodcastPresenter.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class PodcastPresenter: PodcastPresenterInterface {

    weak var view: PodcastView?
    var router: PodcastRouterInterface!
    var interactor: PodcastInteractorInterface!
    
    var podcast: Podcast!
    
    func viewDidLoad() {
        view?.showViewLoading()
        interactor.getPodcast()
    }
    
    func viewWillAppear() {
        interactor.getPodcast()
    }
    
    func didClickedSearch() {
    }
    
    func didClickedStation(of station: Station) {
        router.presentStation(of: station)
    }
    
    func showError(with message: String?) {
        router.presentError(with: message)
    }
}
    
extension PodcastPresenter: PodcastInteractorOutput {
        
//    func didGetPodcast(Podcast: Podcast) {
//        view?.hideViewLoading()
//
//        stations = Podcast.stations ?? []
//
//        view?.reloadUI()
//    }
    
    func didFailedGetPodcast(error: APIError) {
        view?.hideViewLoading()
        router.presentError(with: error.message)
    }
}
