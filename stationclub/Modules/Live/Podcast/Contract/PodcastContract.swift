//
//  PodcastContract.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

protocol PodcastView: AnyObject {
    var presenter: PodcastPresenterInterface! { get set }
    
    func showViewLoading()
    func hideViewLoading()
    
    func reloadUI()
}
    
protocol PodcastPresenterInterface: AnyObject {
    var view: PodcastView? { get set }
    var router: PodcastRouterInterface! { get set }
    var interactor: PodcastInteractorInterface! { get set }
    
    var podcast: Podcast! { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    
    func didClickedSearch()
    func didClickedStation(of station: Station)
    
    func showError(with message: String?)
}
    
protocol PodcastInteractorInterface: AnyObject {
    var output: PodcastInteractorOutput? { get set }
    
    func getPodcast()
}
    
protocol PodcastInteractorOutput: AnyObject {
        
//    func didGetPodcast(Podcast: Podcast)
    func didFailedGetPodcast(error: APIError)
}
    
protocol PodcastRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }

    func presentStation(of station: Station)
    
    func presentError(with message: String?)
    
    static func assembleModule(podcast: Podcast) -> UIViewController
}
