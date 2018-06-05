//
//  UserProfile.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class UserProfile: UIViewController {
    
    @IBOutlet weak var userMajor: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userNumFriends: UILabel!
    @IBOutlet weak var userNumHours: UILabel!
    @IBOutlet weak var userNumBadges: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = ((currentUser?.firstName)! + " " + (currentUser?.lastName)!);
        userMajor.text = (currentUser?.major)!
        // change later after we add it to user
        userNumFriends.text = "5";
        userNumHours.text = "30";
        userNumBadges.text = "1";

        userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

