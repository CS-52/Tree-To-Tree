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
        let name = "Challah Bake"
        let date = Date.init()
        let location = CLLocation(latitude: 37.42, longitude:-122.17)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMMM d, y h:mm"
        
        let eventInfo0: [String: Any] = [
            "name": name,
            "date": dateFormatter.string(from: date),
            "location": "Hillel"
        ]
        
        API.createEventWithKey(eventIDs[0], eventInfo: eventInfo0 as Dictionary<String, AnyObject>)
    }
}

