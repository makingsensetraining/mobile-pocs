//
//  PersistenceObject.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 3/31/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import CoreData

public class PersistenceObject:  NSManagedObject {
    
    //TODO: I need to investigate a bit more about this and how solve it problem
    static func getEntityName() -> String {
        preconditionFailure("This method must be overridden")
    }
}
