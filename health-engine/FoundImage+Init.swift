//
//  LocationImage+Init.swift
//  health-engine
//
//  Created by Farahani, Reza(AWF) on 19/04/2017.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import Foundation

extension FoundImage {

    init?(json:[String:Any]) throws {
        guard let id = json["id"] as? String else {
            throw SerializationImageViewerError.missing("image id")
        }
        guard let secret = json["secret"] as? String else {
            throw SerializationImageViewerError.missing("image secret")
        }
        guard let server = json["server"] as? Int else {
            throw SerializationImageViewerError.missing("image server")
        }
        guard let farm = json["farm"] as? Int else {
            throw SerializationImageViewerError.missing("image farm")
        }
        
        self.id = id
        self.secret = secret
        self.server = server
        self.farm = farm
    }
}
