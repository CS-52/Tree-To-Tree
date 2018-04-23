//
//  EventPageViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController {
    
    @IBOutlet weak var eventSummary: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var orgLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    //image placeholders
    @IBOutlet weak var friend1: UIImageView!
    @IBOutlet weak var friend2: UIImageView!
    @IBOutlet weak var friend3: UIImageView!
    @IBOutlet weak var friend4: UIImageView!
    @IBOutlet weak var friend5: UIImageView!
    
    //var arrayElem:String?
    var arrayElem:Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = arrayElem?.name
        dateLabel.text = arrayElem?.date
        eventImage.image = arrayElem?.image
        self.friend1.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend2.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend3.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend4.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend5.layer.cornerRadius = self.friend1.frame.size.width / 2;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


