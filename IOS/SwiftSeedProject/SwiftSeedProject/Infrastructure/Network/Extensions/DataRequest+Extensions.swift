//
//  ApiProtocol.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 3/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension DataRequest: ApiRequestProtocol {
    
    static func apiResponseSerializer() -> DataResponseSerializer<JSON> {
        return DataResponseSerializer<JSON> { request, response, data, error in
            if let error = error {
                return .failure(error)
            }
            
            guard let validData = data else {
                let reason = "Data could not be serialized. Input data was nil."
                return .failure(NSError(domain: bundleNameKey(), code: 1001, userInfo: [NSLocalizedDescriptionKey : reason]))
            }
            
            let json = JSON(data: validData)
            // TODO: Should consider HTTP response as well.
            return sanitizeError(json: json)
        }
    }
    
    static func sanitizeError(json: JSON) -> Result<JSON> {
        if json["status"].stringValue == "ok" {
            return .success(json)
        }

        let message = json["message"].stringValue
        let error = NSError(domain: bundleNameKey(), code: ErrorCode.Undefined, userInfo: [NSLocalizedDescriptionKey : message])
        return .failure(error)
    }
    
    func apiResponse(completionHandler: @escaping (DataResponse<JSON>) -> Void) -> Self {
        self.validate { request, response, data in
            return .success
        }
        .response(responseSerializer: DataRequest.apiResponseSerializer()) { response in
            completionHandler(response)
        }
        return self;
    }
    
    // TODO: We should move this to an InfoUtils class
    private static func bundleNameKey() -> String {
        guard let info = Bundle.main.infoDictionary,
            let domain = info[kCFBundleNameKey as String] as? String else {
                fatalError("Cannot get bundle name key from Info.plist")
        }
        return domain;
    }
}
