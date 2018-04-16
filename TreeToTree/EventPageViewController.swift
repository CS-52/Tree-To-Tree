//
//  EventPageViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController {
    
    @IBOutlet weak var orgLabel: UITextView!
    @IBOutlet weak var dateLabel: UITextView!
    @IBOutlet weak var nameLabel: UITextView!
    @IBOutlet weak var eventImage: UIImageView!
    
    //var arrayElem:String?
    var arrayElem:Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = arrayElem?.name
        dateLabel.text = arrayElem?.date
        eventImage.image = arrayElem?.image

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


