//
//  ViewModel.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 27/3/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Bond

class LoginViewModel {
    
    var email = Observable<String?>("")
    var password = Observable<String?>("")
    
    func login()  {
        // TODO: Implement dummy async login
    }
    
}
