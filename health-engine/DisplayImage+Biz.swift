//
//  DisplayImage+Biz.swift
//  health-engine
//
//  Created by Reza Farahani on 20/4/17.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import Foundation


extension DisplayImage {
    
    static func makeDisplayImage(foundImage: FoundImage) -> DisplayImage {
        let (thumbnailUrl, mediumImageUrl) = self.makeImageUrl(foundImage:foundImage)
        
        return DisplayImage(imageTitle: foundImage.title, thumbnailUrl: thumbnailUrl , mediumImageUrl: mediumImageUrl)
    }
    
}

extension DisplayImage {
    
    static fileprivate func makeImageUrl(foundImage: FoundImage) -> (thumbnailUrl: URL, mediumImageUrl: URL) {
        let thumbnailUrl =  URL(string: "https://farm\(foundImage.farm).staticflickr.com/\(foundImage.server)/\(foundImage.id)_\(foundImage.secret)_t.jpg")
        let mediumImageUrl =  URL(string: "https://farm\(foundImage.farm).staticflickr.com/\(foundImage.server)/\(foundImage.id)_\(foundImage.secret)_m.jpg")
        
        return (thumbnailUrl!, mediumImageUrl!)
    }
}
