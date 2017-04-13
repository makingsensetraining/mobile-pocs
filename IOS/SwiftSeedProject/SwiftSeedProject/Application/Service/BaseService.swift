//
//  BaseService.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

class BaseService<T: PersistenceObject>  {
    
    private let persistence: Persistence
    private let restClient: AnyObject? = nil
    
    //TODO: we should inclued the API access also
    init(persistence: Persistence) {
        self.persistence = persistence
    }
    
    public func getAll() -> [T] {
        return persistence.getAll(entityName: T.EntityName)
    }
    
    public func getEntityBy(identifier: Int) -> T {
        return persistence.getBy(entityIdentifier: identifier, entityName: T.EntityName)
    }
    
    public func updateLocalStoreWithServerInfo() {
        preconditionFailure("This method must be overridden")
    }
    
    public func getNotificationKeyName() -> Notification.Name {
        return Notification.Name(rawValue:persistence.getNotificationTagfor(entity: T.EntityName))
    }
}
