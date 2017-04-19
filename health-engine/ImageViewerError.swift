//
//  ImageViewerError.swift
//  health-engine
//
//  Created by Farahani, Reza(AWF) on 19/04/2017.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import Foundation

enum SerializationImageViewerError: Error {
    case missing(String)
    case invalid(String, Any)
}
