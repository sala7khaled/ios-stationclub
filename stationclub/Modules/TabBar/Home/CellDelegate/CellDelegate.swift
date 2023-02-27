//
//  CellDelegate.swift
//  stationclub
//
//  Created by Salah Khaled on 29/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

enum CellId: String {
    
    case FEATURED = "FeaturedCell"
    case HEADER = "HeaderCell"
    case STATION = "StationCell"
}

protocol CellDelegate {
    func didSelect(_ cellId: CellId, _ object: Any)
}
