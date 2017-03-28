//
//  ViewController.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/17/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.email.bidirectionalBind(to: emailTextField.reactive.text).dispose(in: reactive.bag)
        viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text).dispose(in: reactive.bag)
        loginButton.reactive.tap
            .observe { _ in
                self.viewModel.login()
            }.dispose(in: reactive.bag)
    }

}
