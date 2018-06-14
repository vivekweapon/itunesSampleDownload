//
//  Track.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 13/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation

struct Track {
    
   var artistName = ""
   var artWorkUrl = ""
   var trackName = ""
    
    init(dictionary:[String:AnyObject]) {
        if(dictionary["artistName"] != nil) {
            artistName = dictionary["artistName"] as! String
            artWorkUrl = dictionary["artworkUrl60"] as! String
            trackName = dictionary["trackName"] as! String
        }
    }
    
}
