//
//  ApiManagerProtocol.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 6/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

protocol ApiManagerProtocol {
    func apiRequest(endpoint: Endpoint, parameters: [String : AnyObject]?, headers: [String : String]?) -> ApiRequestProtocol
}

extension ApiManagerProtocol {
    func apiRequest(endpoint: Endpoint) -> ApiRequestProtocol {
        return apiRequest(endpoint: endpoint, parameters: nil, headers: nil)
    }
    
    func apiRequest(endpoint: Endpoint, parameters: [String : AnyObject]?) -> ApiRequestProtocol {
        return apiRequest(endpoint: endpoint, parameters: parameters, headers: nil)
    }
}
