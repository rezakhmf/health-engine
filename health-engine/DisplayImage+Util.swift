//
//  DisplayImage+Util.swift
//  health-engine
//
//  Created by Farahani, Reza(AWF) on 19/04/2017.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import Foundation

extension FoundImage {

  func makeFlickrSearchURL(byLocatoin locatoin:(latitude: Double, longitude: Double)) -> URL{

    let domainEdnpoint: String = "https://api.flickr.com/services/rest/?method=flickr.photos.search"
    let apiKey: String = "api_key=80968f2b2c113c7bc2fcbddcfe330089"
    let format: String = "&format=json"
    let auth_token: String = "&auth_token=72157679580816463-"
    let apiSignature: String = "&api_sig=488c9791b20d2ef205bda8cf5fb17e56"
    let latitude: String = "&lat=" + String(locatoin.latitude)
    let longitude: String = "&lon=" + String(locatoin.longitude)
    
    let searchEndPoint = domainEdnpoint + apiKey + "&nojsoncallback=1" + format + auth_token + apiSignature + latitude + longitude
    
    
    guard let flickrSearchByLocationURL = URL(string: searchEndPoint) else {
        print("Error: cannot create URL for search in flicke")
        return URL(string: "flickr url is not created")!
    }
    
    return flickrSearchByLocationURL
    
    }

}
