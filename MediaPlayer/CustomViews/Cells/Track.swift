//
//  Track.swift
//  MediaPlayer
//
//  Created by Exrhan Selmani on 17/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import Foundation

struct Track: Codable {
    
    let trackId: Int
    let artistName: String
    let trackName: String
    let previewUrl: String
    
    var downloaded = false
    
    private enum CodingKeys: String, CodingKey {
        case trackId, artistName, trackName, previewUrl
    }
}

struct TracksResult: Codable {
    let resultCount: Int
    let results: [Track]
}
