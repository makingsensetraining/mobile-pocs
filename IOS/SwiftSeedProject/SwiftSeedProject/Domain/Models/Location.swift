//
//  Location.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 5/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class Location {
    
    var lat: String
    var lng: String
    
    init(json: JSON) {
        lat = json["lat"].stringValue
        lng = json["lng"].stringValue
    }
}

extension Location {
    
    func toParameters() -> [String : AnyObject] {
        let parameters = ["lat" : lat, "lng" : lng]
        return parameters as [String : AnyObject]
    }
}
