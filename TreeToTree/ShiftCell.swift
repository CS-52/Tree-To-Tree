//
//  ShiftCell.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 5/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class ShiftCell: UITableViewCell {
    
    //MARK: Properties
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
