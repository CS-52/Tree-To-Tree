//
//  Filter.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class Filter: UIViewController {
    
    @IBOutlet weak var applyFiltersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyFiltersButton.layer.cornerRadius = 5
        applyFiltersButton.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
