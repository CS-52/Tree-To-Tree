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
    
    @IBAction func onSignUpButtonClick(_ sender: Any) {
        let button = sender as! UIButton;
        if(button.title(for: .normal) == "Sign Up") {
            button.backgroundColor = .gray
            button.setTitle("Signed Up!", for: .normal)
        } else {
            button.backgroundColor = UIColor(displayP3Red: 135.0/255.0, green: 218.0/255.0, blue: 188.0/255.0, alpha: 1.0)
            button.setTitle("Sign Up", for: .normal)
        }
        //set isSelected through backend
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.signUpButton.layer.cornerRadius = self.signUpButton.frame.size.width / 8;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
