//
//  YourProfile.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class YourProfile: UIViewController {
    
    @IBOutlet weak var userMajor: UILabel!
    @IBOutlet weak var userYear: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

