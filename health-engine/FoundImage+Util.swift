//
//  DisplayImage+Util.swift
//  health-engine
//
//  Created by Farahani, Reza(AWF) on 19/04/2017.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import Foundation

extension FoundImage {

  static func makeFlickrSearchURL(byLocatoin locatoin:(latitude: Double, longitude: Double)) -> URL{

    let domainEdnpoint: String = "https://api.flickr.com/services/rest/?method=flickr.photos.search"
    let apiKey: String = "&api_key=e3eaa0bebc998ee957775d942766c6e8"
    let format: String = "&format=json"
    let auth_token: String = "&auth_token=72157680769617861-65533c22964cdc58"
    let apiSignature: String = "&api_sig=c67ea848bed1b9b9e32380b80df0c1cc"
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
