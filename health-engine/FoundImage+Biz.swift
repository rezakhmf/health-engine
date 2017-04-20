//
//  DisplayImage+Biz.swift
//  health-engine
//
//  Created by Farahani, Reza(AWF) on 19/04/2017.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import Foundation

extension FoundImage {

  static  func flickrImage(byLocatoin locatoin:(latitude: Double, longitude: Double), completionHandler: @escaping (([FoundImage]) -> Void)) {
        
        var foundImages: [FoundImage] = []
        
        let flickrSearchEndPoint = self.makeFlickrSearchURL(byLocatoin: locatoin)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: flickrSearchEndPoint, completionHandler: { (data, response, error) in
            guard error == nil else {
                print("error calling GET on /Flicker Search API")
                print(error!)
                return
            }
            
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
        
                let photosJson = json["photos"] as? [String: Any]
                let foundPhotoArrayJson = photosJson?["photo"] as? [[String:Any]] ?? []
                
                for case let item in foundPhotoArrayJson {
                    if let foundImage = try? FoundImage(json: item) {
                        foundImages.append(foundImage!)
                    }
                }
                
                } catch let error as NSError {
                        print(error)
                }
        
            completionHandler(foundImages)
        });
    
        task.resume()
    }
}
