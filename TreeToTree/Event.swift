//
//  Event.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/17/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit
import Foundation

struct Event  {
    let name: String!
    let date: String!
    let location: String? //cl location class for ios
    let shifts: String! //table within event
    let image: UIImage!
    let people: String! //interested, going
    
    //additional things needed: people interested, people going, about, location, organization, fix shifts and people so they are not strings
}

