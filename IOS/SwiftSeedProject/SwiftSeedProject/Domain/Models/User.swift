//
//  User.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 4/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserM {
    
    var id: String?
    var name: String?
    var email: String?
    var description: String?
    var address: Address?
    
    init(id: String? = nil, name: String? = nil, email: String? = nil, description: String? = nil, address: Address? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.description = description
        self.address = address
    }
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.email = json["email"].stringValue
        self.description = json["description"].string
        self.address = Address(json: json["address"])
    }
}

extension UserM {
    
    func toParameters() -> [String : AnyObject] {
        var parameters: [String : Any] = [:]
        if let id = id {
            parameters["id"] = id
        }
        if let name = name {
            parameters["name"] = name
        }
        if let email = email {
            parameters["email"] = email
        }
        if let description = description {
            parameters["description"] = description
        }
        if let address = address {
            parameters["address"] = address.toParameters()
        }
        
        return parameters as [String : AnyObject]
    }
}
