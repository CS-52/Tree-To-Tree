//
//  Person.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/23/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit
import Foundation

class User {
    var key: String!
    var name: String!
    var image: UIImage!
    var major: String!
    var hours: Int!
    var badgesIDs: [String]!
    var friendsIDs: [String]!
    var goingIDs: Dictionary<String, Dictionary<String, [String]>>!
    var interestedIDs: [String]!
    
    
    init(key: String, dictionary: Dictionary<String, AnyObject>){
        self.key = key
        
        if let name = dictionary["name"] as? String{
            self.name = name
        }
        
        if let image = dictionary["image"] as? UIImage{
            self.image = image
        } else{
            self.image = #imageLiteral(resourceName: "austinchow")
        }
        
        if let  major = dictionary["major"] as? String{
            self.major = major
        }
        if let hours = dictionary["hours"] as? Int{
            self.hours = hours
        }
        if let friendsIDs = dictionary["friends"] as? [String]{
            self.friendsIDs = friendsIDs
        }
        if let goingIDs = dictionary["goingIDs"] as? Dictionary<String, Dictionary<String, [String]>>{
            self.goingIDs = goingIDs
        }
        if let interestedIDs = dictionary["interestedIDs"] as? [String]{
            self.interestedIDs = interestedIDs
        }
    }
    
    //additional properties needed: year, major, badges, events going, events interested, groups, friends...
}

/*
 let userInfo1: [String: Any] = [
 "name": name1,
 "year": year1,
 "major": major1,
 "hours": hours1,
 "friends": friendsIDs1,
 "badgesIDs": badgesIDs1,
 "goingIDs": goingIDs1,
 "interestedIDs": interestedIDs1
 ]
 */