//
//  InitialViewController.swift
//  TreeToTree
//
//  Created by Jose Miguel Giron on 8/4/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

var currentUser: User?

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //CreateEvents.addEvents()
        //CreateUsers.addUsers()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToInitialViewController(segue:UIStoryboardSegue) { }
    

}

