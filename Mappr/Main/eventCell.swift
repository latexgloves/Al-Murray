//
//  eventCell.swift
//  Mappr
//
//  Created by Tom Knighton on 27/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit

class eventCell: UITableViewCell {
    
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var info : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
