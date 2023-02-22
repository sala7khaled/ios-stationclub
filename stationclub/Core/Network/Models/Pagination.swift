//
//  Pagination.swift
//  stationclub
//
//  Created by Salah Khaled on 02/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    
    let currentPage: Int
    let firstPageUrl: String
    let lastPageUrl: String
    let nextPageUrl: String?
    let prevPageUrl: String?
    let path: String
    let perPage: Int
    let lastPage: Int
    let from: Int
    let to: Int
    let total: Int
}

extension Pagination {
    
    enum CodingKeys: String, CodingKey {
        
        case currentPage = "current_page"
        case firstPageUrl = "first_page_url"
        case lastPageUrl = "last_page_url"
        case nextPageUrl = "next_page_url"
        case prevPageUrl = "prev_page_url"
        case path
        case perPage = "per_page"
        case lastPage = "last_page"
        case from
        case to
        case total
    }
}
