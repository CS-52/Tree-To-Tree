//
//  Shift.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 5/25/18.
//


import UIKit
import Foundation
import CoreLocation

class Shift  {
    //var key: String!
    
    var key: String!
    var name: String!
    var start: String!
    var end: String!
    var goingIDs: [String]!
    
    
    init(key: String, dictionary: Dictionary<String, Any>){
        self.key = key
        
        if let name = dictionary["name"]{
            self.name = name as! String
        }
        
        if let start = dictionary["start time"]{
            self.start = start as! String
        }
        
        if let end = dictionary["end time"]{
            self.end = end as! String
        }
        if let goingIDs = dictionary["goingIDs"]{
            self.goingIDs = goingIDs as! [String]
        }
   
    }
}
