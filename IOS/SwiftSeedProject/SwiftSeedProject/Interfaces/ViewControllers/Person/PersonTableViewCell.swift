//
//  PersonTableViewCell.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/28/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    static let identifier = "PersonCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
