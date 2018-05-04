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
    
}
