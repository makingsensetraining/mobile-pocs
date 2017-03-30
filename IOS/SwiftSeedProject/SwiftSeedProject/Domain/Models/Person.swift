//
//  Person.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/28/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

class Person : NSObject {
    var name: String!
    
    public init(dataModel: PersonDataModel) {
        name = dataModel.name
    }
}
