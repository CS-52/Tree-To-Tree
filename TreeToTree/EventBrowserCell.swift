//
//  EventBrowserCell.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventBrowserCell: UITableViewCell {

    //MARK: Properties
    
   
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var shifts: UILabel!
    @IBOutlet weak var peopleGoing: UILabel!
    @IBOutlet weak var interest: UIButton!
    @IBAction func onHeartClick(_ sender: Any) { //add to interested - backend functionality
        let button = sender as! UIButton;
        if((button.image(for: .normal)) == #imageLiteral(resourceName: "heartOutline")) {
            button.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "heartOutline"), for: .normal)
        }
        
    }
    
    
    
}
