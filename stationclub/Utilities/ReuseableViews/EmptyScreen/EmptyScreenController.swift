//
//  EmptyScreenController.swift
//  stationclub
//
//  Created by Salah Khaled on 31/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

class EmptyScreenController: UIViewController {
    
    @IBOutlet weak var emptyScreenImage: UIImageView!
    @IBOutlet weak var lblEmptyScreenTitle: UILabel!
    
    var isPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        emptyScreenImage.image = UIImage(named: Images.splash)
        lblEmptyScreenTitle.text = "no_data_found".l()
    }
    
    func showAsSubView(_ view: UIView) {
        isPresented = true
        DispatchQueue.main.async {
            self.view.frame.size = view.frame.size
            view.addSubview(self.view)
        }
    }
    
    func close() {
        isPresented = false
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
        }
    }
}
