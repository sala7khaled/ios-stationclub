//
//  OnboardingController.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class OnboardingController: BaseController {
    
    @IBOutlet weak var collectionView: IntrinsicCollectionView!
    @IBOutlet weak var btnNext: AppButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDesc: UILabel!
    
    
    var presenter: OnboardingPresenterInterface!
    
    var currentPage = 0 {
        didSet {
            if oldValue != currentPage {
                updateProgress()
            }
        }
    }
    
    var onboardList : [OnboardModel] = []
    
    var onboardText : [String ] = [
        "Welcome to the club",
        "Bring back radio to life!",
        "Not just a station",
        "Listen anytime anywhere"
    ]
    var onboardDesc : [String] = [
        "Connect over too many live talks and music streaming. Connect over too many live talks and music streaming. 1",
        "Connect over too many live talks and music streaming. Connect over too many live talks and music streaming. 2",
        "Connect over too many live talks and music streaming. Connect over too many live talks and music streaming. 3",
        "Connect over too many live talks and music streaming. Connect over too many live talks and music streaming. 4"
    ]
    
    var colors : [UIColor] = [
        .primary,
        .appYellow,
        .appRed,
        .primary
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initCollectionView()
    }
    
    func setupViews() {
        btnNext.setTitle("next")
        
        setupData()
        updateProgress()
    }
    
    func setupData () {
        onboardList.removeAll()
        for i in Images.onboarding.indices {
            onboardList.append(OnboardModel(id: i,
                                            imgUrl: Images.onboarding[i],
                                            title: onboardText[i],
                                            desc: onboardDesc[i],
                                            color: colors[i]))
        }
        
    }
    
    
    // MARK: - Events
    
    @IBAction func btnNextClicked(_ sender: Any) {
        if currentPage == onboardList.count - 1 {
            presenter.didClickedGetStarted()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

// MARK: - Update interface

extension OnboardingController {
    
    func updateProgress() {
        let progressValue = (Float(currentPage) + 1 ) / Float(onboardList.count)
        self.cellTitle.alpha = 0
        self.cellDesc.alpha = 0
        
        UIView.animate(withDuration: 0.75) {
            self.progressBar.setProgress(Float(progressValue), animated: true)
            self.lblProgress.text = "\(self.currentPage + 1) of \(self.onboardList.count)"
            
            self.cellTitle.text = self.onboardText[self.currentPage]
            self.cellDesc.text = self.onboardDesc[self.currentPage]
            
            self.cellTitle.alpha = 1
            self.cellDesc.alpha = 1
            
            if self.currentPage == self.onboardList.count - 1 {
                self.btnNext.setTitle("get_started")
            } else {
                self.btnNext.setTitle("next")
            }
        }
        
        
    }
    
}

extension OnboardingController: OnboardingView {
    
}
