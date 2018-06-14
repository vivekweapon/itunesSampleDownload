//
//  SearchViewController+URLSessionDelegate.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 13/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation
extension SearchViewController:URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        print("")
    }
    
    
}

// MARK: - URLSessionDelegate

extension SearchViewController: URLSessionDelegate {
    
    // Standard background session handler
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
//        DispatchQueue.main.async {
//            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
//                let completionHandler = appDelegate.backgroundSessionCompletionHandler {
//                appDelegate.backgroundSessionCompletionHandler = nil
//                completionHandler()
//            }
       }
}
