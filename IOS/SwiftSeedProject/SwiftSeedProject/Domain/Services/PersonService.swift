//
//  PersonService.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/28/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

open class PersonService {
    let dataProvider : InMemoryDataProvider
    
    var persons = [Person]()
    
    init() {
        dataProvider = InMemoryDataProvider()
        let result : [AnyObject] = dataProvider.getEntities()
        
        for object in result {
            let person = Person(dataModel: object as! PersonDataModel)
            persons.append(person)
        }
    }
    
}
