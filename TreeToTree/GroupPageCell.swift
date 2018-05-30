//
//  GroupPageCell.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/26/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class GroupPageCell: UITableViewCell {


    @IBOutlet weak var groupPhoto: UIImageView!
    
    @IBOutlet weak var groupName: UILabel!
    @IBAction func onGroupClick(_ sender: Any) {
        let button = sender as! UIButton;
        if((button.image(for: .normal)) == #imageLiteral(resourceName: "Oval")) {
            button.setImage(#imageLiteral(resourceName: "Oval-1"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "Oval"), for: .normal)
        }
    }
   
}

