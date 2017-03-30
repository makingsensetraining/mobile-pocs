//
//  UserService.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 3/31/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

final class UserService {
    
    private let persistence: Persistence
    
    //TODO: this need to be changed. I need to think more about it and fix the PersistenceObject
    private let entityName = "User"
    
    init(persistence: Persistence) {
        self.persistence = persistence
    }
    
    public func getUsers() -> [User] {
        return persistence.getAll(entityName: entityName)
    }
    
    public func getUserBy(identifier: Int) -> User {
        return persistence.getBy(entityIdentifier: identifier, entityName: entityName)
    }
    
    public func add(user: User) {
        persistence.add(entity: user, entityName: entityName)
    }
}
