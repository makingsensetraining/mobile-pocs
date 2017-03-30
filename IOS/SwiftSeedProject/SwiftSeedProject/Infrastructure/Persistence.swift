//
//  Persistence.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 3/31/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import CoreData

protocol Persistence {
    func getAll<T: PersistenceObject>(entityName: String) -> [T]
    func getBy<T: PersistenceObject>(entityIdentifier: Int, entityName: String) -> T
    func add<T: PersistenceObject>(entity: T, entityName: String)
}


