//
//  MSButton.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/20/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit

@IBDesignable public class MSButton: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var rounded: Bool = true
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if(rounded)
        {
            layer.cornerRadius = 0.5 * bounds.size.width
        }
        clipsToBounds = true
    }
}
