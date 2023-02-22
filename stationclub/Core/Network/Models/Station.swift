//
//  Station.swift
//  stationclub
//
//  Created by Salah Khaled on 04/09/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

struct Station: Codable {
        
    var id: Int
    var cover: String
    var hostAvatar: String
    var hostName: String
    var podcastTitle: String
    var stationImage: String
    var stationName: String
    var listenCount: String

}

extension Station {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case cover
        case hostAvatar = "host_avatar"
        case hostName = "host_name"
        case podcastTitle = "podcast_title"
        case stationImage = "station_image"
        case stationName = "station_name"
        case listenCount = "listen_count"
    }
}
