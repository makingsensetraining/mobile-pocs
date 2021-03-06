//
//  Api.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 4/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class RestClient {
    // MARK: - Private Properties
    private let manager: RestClientManagerProtocol
    // MARK: - Internal Properties
    internal let persistence: Persistence
    
    // MARK: - Designated Initializer
    init(manager: RestClientManagerProtocol = RestClientConfiguration.manager, persistence: Persistence) {
        self.manager = manager
        self.persistence = persistence
    }
    
    // MARK: - Private Functions
    private func start<T: Any>(target: Target, completion: @escaping (DataResult<T>) -> Void, processResponse: @escaping (JSON) -> Any?) {
        let _ = manager.sendRequest(target: target).getResponse(errorSanitizer: target.errorSanitizer) { [weak self] response in
            switch response.result {
            case .success(let json):
                guard let strongSelf = self else {
                    return
                }
                let parsedObject = processResponse(json) as! T
                strongSelf.persistence.save()
                completion( DataResult{ return parsedObject } )
            case .failure(let error):
                completion( DataResult{ throw error })
            }
        }
    }
    
    // MARK: - Internal Functions
    internal func execute(target: Target, completion: @escaping (DataResult<Void>) -> Void, processResponse: @escaping (JSON) -> Void) {
        self.start(target: target, completion: completion, processResponse: processResponse)
    }
    
    internal func execute<T: AnyObject>(target: Target, completion: @escaping (DataResult<T>) -> Void, processResponse: @escaping (JSON) -> T?) {
        self.start(target: target, completion: completion, processResponse: processResponse)
    }
    
    internal func execute<T: AnyObject>(target: Target, completion: @escaping (DataResult<[T]>) -> Void, processResponse: @escaping (JSON) -> [T]?) {
        self.start(target: target, completion: completion, processResponse: processResponse)
    }
}
