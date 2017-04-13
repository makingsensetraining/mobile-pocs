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
    
    static let NotificationTag = "%@EntityHasChanged"
    
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
        } catch let error as NSError {
            fatalError("Failed to fetch \(entityName): \(error)")
            print("Could not getAll. \(error), \(error.userInfo)")
        }
        return []
    }
    
    public func getBy<T: PersistenceObject>(entityIdentifier: Int, entityName: String) -> T {
        let objectContext = coreDataManager.privateChildManagedObjectContext()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetch.predicate = NSPredicate(format: "identifier == %@", entityIdentifier)
        do {
            let fetchedObjects = try objectContext.fetch(fetch) as! T
            return fetchedObjects
        } catch let error as NSError {
            fatalError("Failed to fetch \(entityName): \(error)")
            print("Could not getBy. \(error), \(error.userInfo)")
        }
    }
    
    public func add(attributes: [String : AnyObject], entityName: String) {
        let objectContext = coreDataManager.privateChildManagedObjectContext()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: objectContext)!
        let entityModel = NSManagedObject(entity: entity, insertInto: objectContext)
        
        for (key, value) in attributes {
            entityModel.setValue(value, forKey: key)
        }
        do {
            try objectContext.save()
        } catch let error as NSError {
            fatalError("Failed to save one new \(entityName): \(error)")
            print("Could not save one new Entity. \(error), \(error.userInfo)")
        }
        entityHasChanged(entity: entityName)
    }
    
    public func addAll<T: PersistenceObject>(entity: [T], entityName: String) {
        preconditionFailure("This method must be completed")
        entityHasChanged(entity: entityName)
    }
    
    public func getNotificationTagfor(entity: String) -> String {
        return String(format: PersistenceData.NotificationTag, entity)
    }
    
    private func entityHasChanged(entity: String) {
        let nc = NotificationCenter.default
        nc.post(name:NSNotification.Name(rawValue: getNotificationTagfor(entity: entity)), object: nil)
    }
}
