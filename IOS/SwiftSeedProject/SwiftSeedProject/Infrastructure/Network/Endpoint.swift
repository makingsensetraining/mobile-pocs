//
//  Endpoint.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 3/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint {
    
    case GetUser(userId: String)
    case UpdateUser(userId: String)
    case CreateUser()
    
    // MARK: - Public Properties
    var method: Alamofire.HTTPMethod {
        switch self {
            case .GetUser:
                return .get
            case .UpdateUser:
                return .put
            case .CreateUser:
                return .post
        }
    }
    
    var url: URL {
        let baseUrl = NSURL.getBaseUrl()
        switch self {
            case .GetUser(let userId):
                return baseUrl.appendingPathComponent("users/\(userId)")!
            case .UpdateUser(let userId):
                return baseUrl.appendingPathComponent("users/\(userId)")!
            case .CreateUser():
                return baseUrl.appendingPathComponent("users")!
        }
    }
}

private extension NSURL {
    static func getBaseUrl() -> NSURL {
        guard let info = Bundle.main.infoDictionary,
            let urlString = info["Base URL"] as? String,
            let url = NSURL(string: urlString) else {
                fatalError("Cannot get base url from Info.plist")
        }
        
        return url
    }
}
