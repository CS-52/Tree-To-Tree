//
//  ProfilePageViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/23/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    //var arrayElem:String?
    var person:Person?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        profileName.text = person?.name
        profileImg.image = person?.image
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
