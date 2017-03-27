//
//  DataLocator.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/23/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData

class DataLocator {
    private let context : NSManagedObjectContext?
    
    static let sharedInstance = DataLocator()
    
    private init() {
        print("DataLocator Initialized")
        
        if(persistentContainer != nil)
        {
            context = persistentContainer.viewContext
        }
    }
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SwiftSeedModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // TODO: Proper Error handling should be done here.
                // fatalError() causes the application to generate a crash log and terminate. While useful in development this should be changed later. - Mugu.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Proper Error handling should be done here.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
