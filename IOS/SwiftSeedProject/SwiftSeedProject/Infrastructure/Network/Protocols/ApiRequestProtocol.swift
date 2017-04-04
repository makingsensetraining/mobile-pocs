//
//  ApiRequestProtocol.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 6/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ApiRequestProtocol {
    func apiResponse(completionHandler: @escaping (DataResponse<JSON>) -> Void) -> Self
}
