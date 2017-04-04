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
    
    static func configure() -> DependencyContainer {
        return DependencyContainer { container in
            
// MARK: - Services
            container.register(.singleton) { Api() as Api }

// MARK: - View Models
            container.register { try LoginViewModel(api: container.resolve()) as LoginViewModel }

// MARK: - View Controllers
            
            container.register(tag: "LoginVC") { LoginViewController() }
                .resolvingProperties { container, controller in
                    controller.viewModel = try container.resolve() as LoginViewModel
            }
            
            DependencyContainer.uiContainers = [container]

        }
    }
    
}
