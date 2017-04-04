//
//  ViewModel.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 27/3/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Bond

class LoginViewModel {
    
    // TODO: Create a service for authentication and remove references to Api
    private let api: Api
    private var user: User? {
        didSet {
            let user = self.user!
            self.name.value = user.name
            self.email.value = user.email
        }
    }
    
    var name = Observable<String?>("")
    var email = Observable<String?>("")
    
    init(api: Api) {
        self.api = api
    }
    
    func getRandomUser() {
        getUser(userId: String(arc4random_uniform(10) + 1));
    }
    
    func getUser(userId: String) {
        api.getUser(userId: userId) { [weak self] result in
            do {
                guard let strongSelf = self else {
                    return
                }
                try strongSelf.updateUserForResult(result: result)
                debugPrint("Got user with id: " + strongSelf.user!.id!)
            } catch let error as NSError {
                debugPrint("Get user error: \(error.localizedDescription)")
            }
        }
    }
    
    func updateUser() {
        guard let user = self.user else {
            return
        }
        user.name = self.name.value!; // Should we bind the model with the viewModel?
        user.email = self.email.value!;
        api.createUser(user: user) { [weak self] result in
            do {
                guard let strongSelf = self else {
                    return
                }
                try strongSelf.updateUserForResult(result: result)
                debugPrint("Updated user with id: " + strongSelf.user!.id!)
            } catch let error as NSError {
                debugPrint("Update user error: \(error.localizedDescription)")
            }
        }
    }
    
    func createUser() {
        let user = User(name: "Mike Insense", email: "minsense@makingsense.com")
        api.createUser(user: user) { [weak self] result in
            do {
                guard let strongSelf = self else {
                    return
                }
                try strongSelf.updateUserForResult(result: result)
                debugPrint("Created user with id: " + strongSelf.user!.id!)
            } catch let error as NSError {
                debugPrint("Create user error: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateUserForResult(result: ApiResult<User>) throws {
        self.user = try result.unwrap()
    }
    
}
