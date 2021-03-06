//
//  SessionManagerExtensions.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 6/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager: RestClientManagerProtocol {
    
    func sendRequest(target: Target, parameters: [String : AnyObject]? = nil, headers: [String : String]? = nil) -> RestClientRequestProtocol {
        var httpHeaders = ["Accept" : "application/json"]
        if let targetSpecificHeaders = target.commonHeaders {
            httpHeaders += targetSpecificHeaders
        }
        if let headers = headers {
            httpHeaders += headers
        }
        
        return request(target.url, method: target.method, parameters: parameters, encoding: JSONEncoding.default, headers: httpHeaders)
    }
}
