//
//  Track.swift
//  MediaPlayer
//
//  Created by Exrhan Selmani on 17/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import Foundation

class Track {
    
    let index: Int
    let artist: String
    let title: String
    let url: URL
    
    var downloaded = false
    
    init(index: Int, artist: String, title: String, url: URL) {
        self.index = index
        self.artist = artist
        self.title = title
        self.url = url
    }
}
