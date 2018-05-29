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
    
    
    init(key: String, dictionary: Dictionary<String, String>){
        self.key = key
        
        if let name = dictionary["name"]{
            self.name = name
        }
        
        if let start = dictionary["start time"]{
            self.start = start
        }
        
        if let end = dictionary["end time"]{
            self.end = end
        }
   
    }
}
