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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnNext: AppButton!
    @IBOutlet weak var btnChangeLanguage: AccentButton!
    @IBOutlet weak var btnNextWidth: NSLayoutConstraint!
    @IBOutlet weak var viewGradient: UIView!
    
    var presenter: OnboardingPresenterInterface!
    
    var currentPage = 0 {
        didSet {
            
            pageControl.currentPage = currentPage
            createGradient(color: onboardList[currentPage].color)
            
            // Configure Button
            if currentPage == onboardList.count - 1 {
                morphRecButtom()
            } else {
                morphCircleButtom()
            }
        }
    }
    var onboardList : [OnboardModel] = []
    
    var onboardText : [String ] = [
        "Welcome to the club",
        "Bring back radio to life!",
        "Not just a station",
        "Listen anytime anywhere",
        "In-touch while listening"
    ]
    var onboardDesc : [String] = [
        "Connect over too many live talks and music streaming.1",
        "Connect over too many live talks and music streaming.2",
        "Connect over too many live talks and music streaming.3",
        "Connect over too many live talks and music streaming.4",
        "Connect over too many live talks and music streaming.5"
    ]
    
    var colors : [UIColor] = [
        .primary,
        .appYellow,
        .appRed,
        .primary,
        .appBlue
    ]
            
        override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
            initCollectionView()
        }
    
    func setupViews() {
        
        setupData()
        morphCircleButtom()
        
        btnChangeLanguage.setTitle("language")
        btnChangeLanguage.setImage(UIImage.init(named: Images.language), for: .normal)
        btnChangeLanguage.setRadius(20)
        btnChangeLanguage.setInsets()
        
        viewGradient.alpha = 0.2
        viewGradient.addGradient(colorArray: [onboardList[currentPage].color, .appBlack])
        
        pageControl.numberOfPages = Images.onboarding.count
    }
    
    func setupData () {
        onboardList.removeAll()
        
        var count: Int = 0
        for img in Images.onboarding {
            
//            Pick the color from the image
//            let colorFromImg = UIImage(named: img)!.averageColor ?? UIColor.appBlack
            
            onboardList.append(OnboardModel(id: count,
                                            imgUrl: img,
                                            title: onboardText[count],
                                            desc: onboardDesc[count],
                                            color: colors[count]))
            count += 1
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
    
    @IBAction func btnChnageLanguageClicked(_ sender: Any) {
        presenter.showChangeLanguageAlert(title: "change_language_title".l(), message: "change_language_message".l(), delegate: self)
    }
    
}

    // MARK: - Buttons

extension OnboardingController {
    
    func morphRecButtom() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: { () -> Void in
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.btnNext.setTitle("get_started")
                self.btnNextWidth.constant = self.view.bounds.width * 0.85
                self.btnNext.setImage(nil, for: .normal)
            })
        })

    }
    
    func morphCircleButtom() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: { () -> Void in
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.btnNext.setTitle("")
                self.btnNextWidth.constant = self.btnNext.frame.height
                self.btnNext.setImage(UIImage.init(named: Images.nextArrow), for: .normal)
                self.btnNext.imageView?.tintColor = .appWhite
            })
        })
    }
    
}

    // MARK: - Gradient

extension OnboardingController {
    
    func createGradient(color : UIColor) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: { () -> Void in
            UIView.animate(withDuration: 3, animations: { () -> Void in

                self.viewGradient.alpha = 0.1

                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: { () -> Void in
                    UIView.animate(withDuration: 2, animations: { () -> Void in

                        self.viewGradient.alpha = 0.2
                        self.viewGradient.addGradient(colorArray: [color, .appBlack])
                    })
                })
            })
        })
        
    }
}

extension OnboardingController: OnboardingView {

}

extension OnboardingController: CustomAlertControllerDelegate {
    func didConfirm() {
        Localization.shared.switchLanguage()
    }
}
