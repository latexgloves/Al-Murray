//
//  channelCell.swift
//  Mappr
//
//  Created by Tom Knighton on 29/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit

class channelCell: UITableViewCell {

    @IBOutlet weak var channelImage: UIImageView!
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
