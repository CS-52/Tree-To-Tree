//
//  API.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 5/1/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import Foundation
import FirebaseDatabase

class API {
    static let databaseReference: DatabaseReference = Database.database().reference()
    static let eventsReference = databaseReference.child("events")
    static let usersReference = databaseReference.child("users")
    
    class func createEventWithKey(_ key: String, eventInfo: Dictionary<String, AnyObject>) /*-> Event*/ {
        let eventReference = eventsReference.child(key)
        eventReference.setValue(eventInfo)
        return //Event(key: key, dictionary: eventInfo)
    }
    class func createUserWithKey(_ key: String, userInfo: Dictionary<String, AnyObject>) /*-> Event*/ {
        let userReference = usersReference.child(key)
        userReference.setValue(userInfo)
        return //Event(key: key, dictionary: eventInfo)
    }
    
    class func getEventWithKey(_ key: String, completed: ((Event?) -> Void)?) {
        eventsReference.child(key).observeSingleEvent(of: .value, with: { snapshot in
            var event: Event?
            
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                NSLog("printing the dictionary used to create a new Event")
                NSLog(String(describing: dictionary))
                event = Event(key: key, dictionary: dictionary)
            }
            
            completed?(event)
        })
    }
    
}


