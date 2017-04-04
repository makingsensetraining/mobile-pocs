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

final class Api {
    // MARK: - Private Properties
    private let manager: ApiManagerProtocol
    private let processUser: (Result<JSON>, (ApiResult<User>) -> Void) -> Void = { result, completion in
        switch result {
            case .success(let json):
                let user = User(json: json)
                completion(ApiResult{ return user })
            case .failure(let error):
                completion(ApiResult{ throw error })
        }
    }
    
    // MARK: - Designated Initializer
    init(manager: ApiManagerProtocol = Configuration.manager) {
        self.manager = manager
    }
    
    // MARK: - Public Methods
    func getUser(userId: String, completion: @escaping (ApiResult<User>) -> Void) {
        let _ = manager.apiRequest(endpoint: .GetUser(userId: userId)).apiResponse { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            strongSelf.processUser(response.result, completion)
        }
    }
    
    func updateUser(user: User, completion: @escaping (ApiResult<User>) -> Void) {
        let _ = manager.apiRequest(endpoint: .UpdateUser(userId: user.id!), parameters: user.toParameters()).apiResponse { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            strongSelf.processUser(response.result, completion)
        }
    }
    
    func createUser(user: User, completion: @escaping (ApiResult<User>) -> Void) {
        let _ = manager.apiRequest(endpoint: .CreateUser(), parameters: user.toParameters()).apiResponse { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            strongSelf.processUser(response.result, completion)
        }
    }
    
}

struct Configuration {
    static var manager: ApiManagerProtocol {
        return SessionManager.default
    }
}
