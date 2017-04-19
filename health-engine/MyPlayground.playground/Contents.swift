//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Foundation

 let airportSvcEndpointRequest = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=80968f2b2c113c7bc2fcbddcfe330089&lat=33.8688&lon=151.2093&format=json&nojsoncallback=1&auth_token=72157679580816463-17df17d56997b3f1&api_sig=488c9791b20d2ef205bda8cf5fb17e56")

let session = URLSession.shared

URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
let task = session.dataTask(with: airportSvcEndpointRequest!, completionHandler: { (data, response, error) in
    guard error == nil else {
        print("error calling GET on /Flicker Search API")
        print(error!)
        return
    }
    
    guard let data = data, error == nil else { return }
    
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
      //  print(json["photos"])

        let photos = json["photos"] as? [String: Any]
        let photo = photos?["photo"] as? [[String: Any]] ?? []
        
        for case let item in photo {
        
            print(item["title"] ?? 0)
            
        }
        
    } catch let error as NSError {
        print(error)
    }
    

});

task.resume()
PlaygroundPage.current.needsIndefiniteExecution = true