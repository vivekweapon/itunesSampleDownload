//
//  MusicSample.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 14/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation

class MusicSample {
    
    let trackName:String
    let artistName:String
    let previewUrl:URL
    let index:Int
    var downloaded = false
    
    init(trackName:String, artistName:String, previewUrl:URL, index:Int) {
        self.artistName = artistName
        self.trackName = trackName
        self.previewUrl = previewUrl
        self.index = index
    }
}
