//
//  SessionManagerExtensions.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 6/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager: ApiManagerProtocol {
    
    func apiRequest(endpoint: Endpoint, parameters: [String : AnyObject]? = nil, headers: [String : String]? = nil) -> ApiRequestProtocol {
        // Insert your common headers here, for example, authorization token or accept.
        var commonHeaders = ["Accept" : "application/json"]
        if let headers = headers {
            commonHeaders += headers
        }
        
        return request(endpoint.url, method: endpoint.method, parameters: parameters, encoding: JSONEncoding.default, headers: commonHeaders)
    }
}
