//
//  IDataLocator.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/28/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

protocol DataProvider {
    func getEntities<T: AnyObject>() -> [T]
}
