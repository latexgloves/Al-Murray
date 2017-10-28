//
//  buttonRounded.swift
//  Mappr
//
//  Created by Tom Knighton on 25/09/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class roundedButton : UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
