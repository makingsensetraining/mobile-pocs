//
//  PersistenceData.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/10/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData

class PersistenceData: Persistence {
    
    let coreDataManager: CoreDataStack
    
    init(coreDataManager: CoreDataStack) {
        self.coreDataManager = coreDataManager
    }
    
    public func getAll<T: PersistenceObject>(entityName: String) -> [T] {
        let objectContext = coreDataManager.privateChildManagedObjectContext()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let fetchedObjects = try objectContext.fetch(fetch) as! [T]
            return fetchedObjects
        } catch {
            fatalError("Failed to fetch \(entityName): \(error)")
        }
        return []
    }
    
    public func getBy<T: PersistenceObject>(entityIdentifier: Int, entityName: String) -> T {
        preconditionFailure("This method must be completed")
    }
    
    public func add<T: PersistenceObject>(entity: T, entityName: String) {
        preconditionFailure("This method must be completed")
    }
}
