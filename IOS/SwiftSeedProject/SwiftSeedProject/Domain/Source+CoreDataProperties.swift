//
//  Source+CoreDataProperties.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData


extension Source {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Source> {
        return NSFetchRequest<Source>(entityName: "Source")
    }

    @NSManaged public var identifier: Int16
    @NSManaged public var url: String?
    @NSManaged public var detail: String?
    @NSManaged public var name: String?
    @NSManaged public var category: String?
    @NSManaged public var language: String?
    @NSManaged public var country: String?
    @NSManaged public var urlsToLogos: String?
    @NSManaged public var sortByAvailable: String?
    @NSManaged public var broadcast: Broadcast?

}
