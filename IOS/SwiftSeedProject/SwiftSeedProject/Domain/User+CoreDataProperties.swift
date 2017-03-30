//
//  User+CoreDataProperties.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/10/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var id: Int16
    @NSManaged public var lastName: String?
    @NSManaged public var username: String?

}
