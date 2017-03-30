//
//  CompositionRoot.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Dip
import Dip_UI

extension DependencyContainer {
    
    //TODO: we need to create protocols
    static func configure() -> DependencyContainer {
        return DependencyContainer { container in
            container.register(.singleton) { CoreDataStack(modelName: "DataModel", completion: {}) as CoreDataStack }

            container.register { PersistenceData(coreDataManager: try! container.resolve() as CoreDataStack) as Persistence }
            
// MARK: - Services
            container.register(.singleton) { Api() as Api }

            container.register() { UserService(persistence: try! container.resolve() as Persistence) as UserService}
            
// MARK: - View Models
            container.register { try LoginViewModel(api: container.resolve() as Api) as LoginViewModel }

// MARK: - View Controllers
            container.register(tag: "LoginVC") { LoginViewController() }
                .resolvingProperties { container, controller in
                    controller.viewModel = try container.resolve() as LoginViewModel
            }
            
            DependencyContainer.uiContainers = [container]

        }
    }
    
}
