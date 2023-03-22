//
//  Home+TableView.swift
//  stationclub
//
//  Created by Salah Khaled on 04/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    
    func initTableView() {
        tableView.initialize(cellClass: FeaturedCell.self, delegate: self, dataSource: self, estimatedRowHeight: 400)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset.bottom = 112
        
        tableView.registerCellNib(cellClass: FeaturedCell.self)
        tableView.registerCellNib(cellClass: HeaderCell.self)
        tableView.registerCellNib(cellClass: StationCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(cellClass: FeaturedCell.self)
            cell.configure(with: stations[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeue(cellClass: HeaderCell.self)
            cell.configure(with: "on_live".l() + " " + "app_name".l())
            return cell
        default:
            let cell = tableView.dequeue(cellClass: StationCell.self)
            cell.configure(with: stations[indexPath.row - 1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 400
        case 1:
            return 44
        default:
            return 160
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didClickedStation(of: stations[indexPath.row])
    }
}
