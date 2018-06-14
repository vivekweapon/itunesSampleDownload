//
//  Networking.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 13/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation

class Networking {
  
    let downloadSession = URLSession(configuration: .default)
    var dataTask:URLSessionDataTask?
    
    func downloadSampleTunes(searchString:String,completionHandler:@escaping(_ responseObject:[Track],_ error:Error?)->Void) {
        
        dataTask?.cancel()
        

        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchString)"
            guard let url = urlComponents.url else {return}
            dataTask = downloadSession.dataTask(with: url, completionHandler: { (data, response, error) in
                defer {self.dataTask = nil}
                
                if let error =  error {
                    //print(error)
                }
                else if let data = data,let response = response as? HTTPURLResponse,response.statusCode == 200
                {
                    let searchDictionary = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                    let musicArray = searchDictionary!["results"] as? [[String:AnyObject]]
                    var trackArray = [Track]()
                    for trackDictionary in musicArray! {
                        trackArray.append(Track(dictionary: trackDictionary))
                    }
                    completionHandler(trackArray,error)
         
                }
                
            })
        }
        dataTask?.resume()
        
    }
}
