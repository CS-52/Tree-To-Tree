//
//  CreateEvents.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 5/1/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import Foundation
import CoreLocation

class CreateEvents {
    class func addEvents() {
        ///*// CODE TO CREATE EVENTS IN BACK END.  REMOVE AFTER FIRST RUN \\
        let eventIDs = ["0000", "0001", "0002", "0003"]
        
        //EVENT 0
        
        
        
        let name1 = "Challah Bake with Picture"
        let date1 = Date.init()
        let location1 = "Hillel"
        let shifts1 = [
            "0000": [
                "name": "Dough-Making",
                "start time": "6:00 pm",
                "end time": "7:20 pm"
            ],
            "0001": [
                "name": "Baking",
                "start time": "7:30 pm",
                "end time": "9:00 pm",
            ]
        ]
        
        let interestedIDs1=[String]()
        let goingIDs1 = [
            "0000": [
                "shifts": ["0000", "0001"]
            ],
            "0001": [
                "shifts": ["0001"]
            ]
        ]
        let description1 = "Come bake some challah!\n It's gonna be lit"
        let organization1 = "Challah for Hunger"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMMM d, y h:mm"
        
//        let eventInfo0: [String: Any] = [
//            "name": name1,
//            "date": dateFormatter.string(from: date1),
//            "location": location1,
//            "shifts": shifts1,
//            "goingIDs": goingIDs1,
//            "interestedIDs": interestedIDs1,
//            "description": description1,
//            "organization": organization1
//        ]
        
        API.uploadProfileImage(key: "0000", image: #imageLiteral(resourceName: "Challah-Bread"), completed: { (profileImageURL) in
            if (profileImageURL != nil) {
                //do something with the imageURL, e.g. store it with the user
                let eventInfo0: [String: Any] = [
                    "name": name1,
                    "date": dateFormatter.string(from: date1),
                    "location": location1,
                    "shifts": shifts1,
                    "goingIDs": goingIDs1,
                    "interestedIDs": interestedIDs1,
                    "description": description1,
                    "organization": organization1,
                    "image_url":profileImageURL?.absoluteString
                ]
                API.createEvent(eventInfo: eventInfo0 as Dictionary<String, AnyObject>)

            } else {
                // self.createAccountButton.isEnabled = true
            }
        })

//
//        //EVENT 1
//        let name2 = "Challah Bake"
//        let date2 = Date.init()
//        let location2 = "Hillel"
//        let shifts2 = [
//            "0000": [
//                "name": "Dough-Making",
//                "start time": "6:00 pm",
//                "end time": "7:20 pm"
//            ],
//            "0001": [
//                "name": "Baking",
//                "start time": "7:30 pm",
//                "end time": "9:00 pm",
//            ]
//        ]
//        
//        let interestedIDs2=[String]()
//        let goingIDs2 = [
//            "0000": [
//                "shifts": ["0000", "0001"]
//            ],
//            "0001": [
//                "shifts": ["0001"]
//            ]
//        ]
//        let description2 = "Come bake some challah!\n It's gonna be lit"
//        let organization2 = "Challah for Hunger"
//
//        let dateFormatter2 = DateFormatter()
//        dateFormatter.dateFormat = "EEEE MMMM d, y h:mm"
//
//        let eventInfo1: [String: Any] = [
//            "name": name2,
//            "date": dateFormatter.string(from: date2),
//            "location": location2,
//            "shifts": shifts2,
//            "goingIDs": goingIDs2,
//            "interestedIDs": interestedIDs2,
//            "description": description2,
//            "organization": organization2
//        ]
//        
        
    }
}

