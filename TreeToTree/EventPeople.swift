//
//  InterestedFriends.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPeople : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var curEvent:Event?
    var peopleGoing = [User]()
    var peopleInterested = [User]()
    
    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segControlActionChanged(_ sender: Any) {
        peopleTableView.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch(segmentedControl.selectedSegmentIndex)
        {
        case 0:
            returnValue = peopleGoing.count
            break
        case 1:
            returnValue = peopleInterested.count
            break
        default:
            break
        }
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = peopleTableView.dequeueReusableCell(withIdentifier: "eventPersonCell", for: indexPath)
        
        switch(segmentedControl.selectedSegmentIndex)
        {
        case 0:
            //person cell corresponds to people going
            break
        case 1:
            //person cell corresponds to people interested
            break
            
        default:
            break
            
        }
        return personCell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        for goingId in (curEvent?.goingIDs)! {
            //load a user with goingId
            API.getUserWithKey(goingId, completed: {User in
                print("got going user")
                print(User!)
                self.peopleGoing.append(User!)
            })
        }
        
        //populate people interested array
        for interestedId in (curEvent?.interestedIDs)! {
            //load a user with interestedId
            API.getUserWithKey(interestedId, completed: {User in
                print("got interested user")
                print(User!)
                self.peopleInterested.append(User!)
            })
        }

        //Dynamically updating view constraints
        switch(segmentedControl.selectedSegmentIndex)
        {
        case 0:
            let goingCount = peopleGoing.count
            let goingHeight = goingCount * 50 //height of each cell
            //update height constraint for table view
            //edit to scroll view
            //self.updateViewConstraints()
            break
        case 1:
            let interestedCount = peopleInterested.count
            let interestedHeight = interestedCount * 50 //height of each cell
            //update height constraint for table view
            //edit to scroll view
            //self.updateViewConstraints()
            break
            
        default:
            break
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
