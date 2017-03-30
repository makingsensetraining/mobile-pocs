//
//  PersonTableViewController.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/27/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit

class PersonTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    
    var service: PersonService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service = PersonService()
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (service?.persons.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as! PersonTableViewCell
        cell.lblName.text = service?.persons[indexPath.row].name
        
        return cell
    }
}
