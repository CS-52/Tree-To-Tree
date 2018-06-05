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
    @IBOutlet weak var signUpButton: IdentifiedButton!
    
    @IBAction func onSignUpButtonClick(_ sender: Any) {
        let button = sender as! IdentifiedButton;
        if(button.title(for: .normal) == "Sign Up") {
            //should sign up
            
            API.signUpForShift(eventID: button.eventID, shiftID: button.shiftID!)
            //button.setSignedUp(button.self())
            button.backgroundColor = .gray
            button.setTitle("Signed Up!", for: .normal)
        } else {
            //should unsign
            API.signOutOfShift(eventID: button.eventID, shiftID: button.shiftID!)
            //button.setSignUp(button)
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

class IdentifiedButton: UIButton{
    var shiftID: String?
    var eventID: String!
    /*
    class func setSignedUp(){
        //super.awakeFromNib()
        self.backgroundColor = .gray
        self.setTitle("Signed Up!", for: .normal)
    }
    
    class func setSignUp(){
        self.backgroundColor = UIColor(displayP3Red: 135.0/255.0, green: 218.0/255.0, blue: 188.0/255.0, alpha: 1.0)
        self.setTitle("Sign Up", for: .normal)
    }*/
    
    //override func awakeFromNib() {
      //  super.awakeFromNib()
    //}
}
