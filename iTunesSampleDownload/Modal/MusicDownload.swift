//
//  MusicDownload.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 14/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation

class MusicDownload {
    
    var sample:MusicSample
    
    init(sample:MusicSample){
        self.sample = sample
    }

    var downloadTask:URLSessionDownloadTask?
    var isDownloading = false
    var resumeData:Data?
    var progress: Float = 0.0
    
}
