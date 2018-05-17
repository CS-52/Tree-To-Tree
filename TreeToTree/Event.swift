//
//  Event.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/17/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

struct Event  {
    //var key: String!
    
    var name: String!
    var date: String!//Date
    var location: String? //cl location class for ios
    let shifts: String! //table within event
    let image: UIImage!
    let people: String! //interested, going
    
    //additional things needed: people interested, people going, about, location, organization, fix shifts and people so they are not strings
    
    /*init(key: String, dictionary: Dictionary<String, AnyObject>){
        self.key = key
        
        if let name = dictionary["name"] as? String{
            self.name = name
        }
        
        if let date = dictionary["date"] as? Date{
            self.date = date
        }
        
        if let location = dictionary["location"] as? CLLocation{
            self.location = location
        }
        
        
    }*/
}

