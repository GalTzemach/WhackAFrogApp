//
//  customTableViewCell.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 17/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    // outlets
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
