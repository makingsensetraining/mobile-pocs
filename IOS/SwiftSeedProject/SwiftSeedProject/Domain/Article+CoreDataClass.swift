//
//  Article+CoreDataClass.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData

@objc(Article)
public class Article: PersistenceObject {

    class override var EntityName: String {
        return "Article"
    }
}
