//
//  DownloadClient.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 14/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation

class DownloadClient {

    
    var downloadsSession:URLSession!
    var activeDownloads:[URL:MusicDownload] = [:]
    
    func startDownload(_ musicSample:MusicSample) {
        
        let musicDownload = MusicDownload(sample: musicSample)
        musicDownload.downloadTask = downloadsSession.downloadTask(with: musicSample.previewUrl)
        
        musicDownload.downloadTask?.resume()
        musicDownload.isDownloading = true
        activeDownloads[musicDownload.sample.previewUrl] = musicDownload
        
    }
    
    func pauseDownload(_ musicSample: MusicSample) {
       
//        guard let sampleDownload = activeDownloads[musicSample.previewUrl] else { return }
//
//        if sampleDownload.isDownloading {
//                sampleDownload.downloadTask?.cancel(byProducingResumeData: { data in
//                sampleDownload.resumeData = data
//            })
//            sampleDownload.isDownloading = false
//        }
    }
    
    func cancelDownload(_ musicSample: MusicSample) {
        
//        if let sampleDownload = activeDownloads[musicSample.previewUrl] {
//            sampleDownload.downloadTask?.cancel()
//            activeDownloads[musicSample.previewUrl] = nil
//        }
    }
    
    func resumeDownload(_ musicSample: MusicSample) {

//        guard let sampleDownload = activeDownloads[musicSample.previewUrl] else {return}
//        if let resumeData = sampleDownload.resumeData {
//           sampleDownload.downloadTask = downloadsSession.downloadTask(withResumeData: resumeData)
//        }
//        
//        sampleDownload.downloadTask?.resume()
//        sampleDownload.isDownloading = true
        
    }
}
