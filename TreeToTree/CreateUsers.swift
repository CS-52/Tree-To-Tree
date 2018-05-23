//
//  CreateUsers.swift
//  TreeToTree
//
//  Created by Jose Miguel Giron on 22/5/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import Foundation

class CreateUsers {
    class func addUsers() {
        ///*// CODE TO CREATE EVENTS IN BACK END.  REMOVE AFTER FIRST RUN \\
        let userIDs = ["0000", "0001", "0002", "0003"]
        
        //USER 0
        let name0 = "Austin Chow"
        let year0 = "Sophomore"
        let major0 = "Computer Science"
        //let photo1
        let hours0 = 30
        let badgesIDs0 = ["0000"]
        let friendsIDs0 = ["0001"]
        let goingIDs0 = [
            "0000": [
                "shifts": ["0000", "0001"]
            ]
        ]
        let interestedIDs0 = ["0001"]
        
        let userInfo0: [String: Any] = [
            "name": name0,
            "year": year0,
            "major": major0,
            "hours": hours0,
            "friends": friendsIDs0,
            "badgesIDs": badgesIDs0,
            "goingIDs": goingIDs0,
            "interestedIDs": interestedIDs0
        ]
        
        //USER 1
        let name1 = "Suzanne Joh"
        let year1 = "Sophomore"
        let major1 = "Computer Science"
        //let photo1
        let hours1 = 30
        let badgesIDs1 = ["0000"]
        let friendsIDs1 = ["0000"]
        let goingIDs1 = [
            "0000": [
                "shifts": ["0001"]
            ]
        ]
        let interestedIDs1 = ["0001"]
        
        
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
        
        let userInfos = [userInfo0, userInfo1]
        
        for i in 0...1{
            API.createUserWithKey(userIDs[i], userInfo: userInfos[i] as Dictionary<String, AnyObject>)
        }
        
    }
}
