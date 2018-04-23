//
//  FriendsList.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/19/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import Foundation
import UIKit

class FriendsList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct Friend {
        let name: String!
        let image: UIImage!
    
    }
    
    var friendsArray = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.delegate = self
       // tableView.dataSource = self
                
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "FriendBrowserCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventBrowserCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let friend = friendsArray[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row 
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
}


