//
//  Podcast.swift
//  stationclub
//
//  Created by Salah's iMac on 05/04/2023.
//

import Foundation

struct Podcast: Codable {
        
    var cover: String
    var hostAvatar: String
    var hostName: String
    var title: String
    var tags: [String]
    var members: [Member]

}

extension Podcast {
    
    enum CodingKeys: String, CodingKey {
        
        case cover
        case hostAvatar = "host_avatar"
        case hostName = "host_name"
        case title
        case tags
        case members
    }
}
