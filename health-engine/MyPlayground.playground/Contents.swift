//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Foundation

 let airportSvcEndpointRequest = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=e3eaa0bebc998ee957775d942766c6e8&nojsoncallback=1&format=json&auth_token=72157680769617861-65533c22964cdc58&api_sig=c67ea848bed1b9b9e32380b80df0c1cc&lat=33.8688&lon=151.2093")

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
        
            print(item["farm"] ?? 0)
            
        }
        
    } catch let error as NSError {
        print(error)
    }
    

});

task.resume()
PlaygroundPage.current.needsIndefiniteExecution = true
