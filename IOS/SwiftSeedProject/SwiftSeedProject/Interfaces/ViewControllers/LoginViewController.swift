//
//  ViewController.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/17/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond
import Dip_UI
import Dip

class LoginViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var getButton: UIButton!
    @IBOutlet var putButton: UIButton!
    @IBOutlet var postButton: UIButton!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.name.bidirectionalBind(to: nameTextField.reactive.text).dispose(in: reactive.bag)
        viewModel.email.bidirectionalBind(to: emailTextField.reactive.text).dispose(in: reactive.bag)
        getButton.reactive.tap
            .observe { _ in
                self.viewModel.getRandomUser()
            }.dispose(in: reactive.bag)
        putButton.reactive.tap
            .observe { _ in
                self.viewModel.updateUser()
            }.dispose(in: reactive.bag)
        postButton.reactive.tap
            .observe { _ in
                self.viewModel.createUser()
            }.dispose(in: reactive.bag)
    }

}

extension LoginViewController: StoryboardInstantiatable { }
