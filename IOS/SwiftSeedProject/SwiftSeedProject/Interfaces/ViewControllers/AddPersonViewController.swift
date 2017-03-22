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
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //Not sure if there's a better way to handle context rather than this way.
        let person =  Person(context: context) 
        person.name = txtFieldName.text!
        
        //Save  data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}
