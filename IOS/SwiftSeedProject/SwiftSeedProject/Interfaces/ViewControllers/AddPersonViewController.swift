//
//  AddPersonViewController.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/22/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import CoreData

class AddPersonViewController: UIViewController {

    @IBOutlet weak var txtFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnAddPersonTouchUpInsided(_ sender: Any) {
        
        let person =  Person(context: DataLocator.sharedInstance.context!)
        person.name = txtFieldName.text!
        
        //Save  data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}
