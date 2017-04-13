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
            container.register(.singleton){ CoreDataStack(modelName: "DataModel", completion: {}) as CoreDataStack }

            container.register{ PersistenceData(coreDataManager: try! container.resolve() as CoreDataStack) as Persistence }
            
// MARK: - Services
            container.register(.singleton) { Api() as Api }
            
            //Comment: to mock the service we need to use Persistence mock
            container.register(){ BroadcastService(persistence: try! container.resolve()) as BroadcastService}
            container.register(){ ArticleService(persistence: try! container.resolve()) as ArticleService}
            container.register(){ SourceService(persistence: try! container.resolve()) as SourceService}
            container.register(){ LibraryService(persistence: try! container.resolve()) as LibraryService}
            
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
