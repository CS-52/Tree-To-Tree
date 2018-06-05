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
    var shifts: Dictionary<String, Dictionary<String, Any>>!//table within event
    //"shiftID": //starting with "0000"
    //  -"start time": String
    //  -"end time": String
    //  -"name":  String
    //  -"userIDs": [String]//user IDs going to that event
    var image: UIImage!
    var interestedIDs: [String]!
    var description: String!
    var organization: String!
    var goingIDs: [String]! //not in database, constructed locally from shifts
    
    //additional things needed: people interested, people going, about, location, organization, fix shifts and people so they are not strings
    
    init(key: String, dictionary: Dictionary<String, AnyObject>, image: UIImage){
        self.key = key
        self.image = image
        if let name = dictionary["name"] as? String{
            self.name = name
        }
        
        if let date = dictionary["date"] as? String{
            self.date = date
        }
        
        if let location = dictionary["location"] as? String{
            self.location = location
        }
        if let shifts = dictionary["shifts"] as? Dictionary<String, Dictionary<String, Any>>{
            self.shifts = shifts;
        }else{
            self.shifts = Dictionary<String, Dictionary<String, String>>();
        }
//        if let image = dictionary["image"] as? UIImage{
//            self.image = image;
//        } else{
//            self.image = #imageLiteral(resourceName: "Challah-Bread");
//        }
        interestedIDs = [String]()
        if let interestedIDs = dictionary["interestedIDs"] as? Dictionary<String, Any>{
            for userID in interestedIDs.keys{
                self.interestedIDs.append(userID)
            }
        }
        if let description = dictionary["description"] as? String{
            self.description = description
        }
        if let organization = dictionary["organization"] as? String{
            self.organization = organization
        }
        goingIDs = [String]()
        
        for key in self.shifts.keys {
            let shiftGoing = shifts[key]?["goingIDs"] as? Dictionary<String, Any>
            if(shiftGoing != nil){
                for ID in (shiftGoing?.keys)! {
                 print("GOING ID" + ID)
                 goingIDs.append(ID)
                }
            }
        }
        print("GOING!!!!")
        print(goingIDs)
    }
}

