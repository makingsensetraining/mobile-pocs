//
//  Address.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 5/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class Address {
    
    var street: String
    var suite: String?
    var city: String
    var zipcode: String
    var location: Location?
    
    init(street: String, suite: String? = nil, city: String, zipcode: String, location: Location? = nil) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.location = location
    }
    
    init(json: JSON) {
        self.street = json["street"].stringValue
        self.suite = json["suite"].stringValue
        self.city = json["city"].stringValue
        self.zipcode = json["zipcode"].stringValue
        self.location = Location(json: json["geo"])
    }
}

extension Address {
    
    func toParameters() -> [String : AnyObject] {
        var parameters = ["street" : street, "city" : city, "zipcode" : zipcode] as [String : Any]
        if let suite = suite {
            parameters["suite"] = suite
        }
        if let location = location {
            parameters["geo"] = location.toParameters()
        }
        
        return parameters as [String : AnyObject]
    }
}
