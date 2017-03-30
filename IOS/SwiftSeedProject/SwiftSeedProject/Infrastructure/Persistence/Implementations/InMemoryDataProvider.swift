//
//  BadExampleDataProvider.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/29/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

class InMemoryDataProvider  {
    let entities : [AnyObject] = [
        PersonDataModel(name: "Marcelo"),
        PersonDataModel(name: "Lucas"),
        PersonDataModel(name: "Brian"),
        PersonDataModel(name: "Mauro"),
        PersonDataModel(name: "Mugu")
    ]
    
    func getEntities<T: AnyObject>() -> [T] {
        let result = entities.filter { $0 is T}
        
        return result as! [T]
    }
}
