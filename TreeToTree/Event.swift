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

class Event  {
    //var key: String!
    
    var key: String!
    var name: String!
    var date: String!//Date
    var location: String? //cl location class for ios
    var shifts: Dictionary<String, Dictionary<String, String>>!//table within event
    var image: UIImage!
    var interestedIDs: [String]!
    var goingIDs: Dictionary<String, Dictionary<String, [String]>>!
    var description: String!
    var organization: String!
    
    //additional things needed: people interested, people going, about, location, organization, fix shifts and people so they are not strings
    
    init(key: String, dictionary: Dictionary<String, AnyObject>){
        self.key = key
        
        if let name = dictionary["name"] as? String{
            self.name = name
        }
        
        if let date = dictionary["date"] as? String{
            self.date = date
        }
        
        if let location = dictionary["location"] as? String{
            self.location = location
        }
        if let shifts = dictionary["shifts"] as? Dictionary<String, Dictionary<String, String>>{
            self.shifts = shifts;
        }else{
            self.shifts = Dictionary<String, Dictionary<String, String>>();
        }
        if let image = dictionary["image"] as? UIImage{
            self.image = image;
        } else{
            self.image = #imageLiteral(resourceName: "Challah-Bread");
        }
        if let interestedIDs = dictionary["interestedIDs"] as? [String]{
            self.interestedIDs = interestedIDs;
        } else {
            self.interestedIDs = [String]();
        }
        if let goingIDs = dictionary["shifts"] as? Dictionary<String, Dictionary<String, [String]>>{
            self.goingIDs = goingIDs;
        }else{
            self.goingIDs = Dictionary<String, Dictionary<String, [String]>>();
        }
        if let description = dictionary["description"] as? String{
            self.description = description
        }
        if let organization = dictionary["organization"] as? String{
            self.organization = organization
        }
    }
}

