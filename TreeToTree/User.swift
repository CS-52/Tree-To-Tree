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
    var firstName: String!
    var lastName: String!
    var image: UIImage!
    var major: String!
    var hours: Int!
    var badgesIDs: Dictionary<String, String>!
    var friendsIDs: Dictionary<String, String>!
    var goingIDs: Dictionary<String, Dictionary<String, String>>!
    var interestedIDs: Dictionary<String,String>!
    
    
    init(key: String, dictionary: Dictionary<String, AnyObject>){
        self.key = key
        
        if let name = dictionary["firstName"] as? String{
            self.firstName = name
        }
        if let name = dictionary["lastName"] as? String{
            self.lastName = name
        }
        
        if let image = dictionary["image"] as? UIImage{
            self.image = image
        } else{
            self.image = #imageLiteral(resourceName: "austinchow")
        }
        
        if let  major = dictionary["major"] as? String!{
            self.major = major
        } else{
            self.major = ""
        }
        if let hours = dictionary["hours"] as? Int{
            self.hours = hours
        }
        if let friendsIDs = dictionary["friends"] as? Dictionary<String, String>{
            self.friendsIDs = friendsIDs
        }
        if let goingIDs = dictionary["goingIDs"] as? Dictionary<String, Dictionary<String, String>>{
            self.goingIDs = goingIDs
        }
        if let interestedIDs = dictionary["interestedIDs"] as? Dictionary<String, String>{
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
