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
        
        /*
        
        //populate both people arrays
        
        //populate shifts
        for goingId in (curEvent?.goingIDs)! {
            //load sample user
            API.getUserWithKey(key: goingId, completed: {user in
                print("got user")
                print(user)
                self.peopleGoing += user
                
            })
    
            let user = User(key: goingId, dictionary: (arrayElem?.shifts[shiftKey]!)!)
            shifts.append(shift)
        }
        
        //Dynamically updating view constraints
        let shiftsCount = shifts.count
        let shiftsHeight = shiftsCount * 50
        shiftsTableViewHeightConstraint.constant = CGFloat(shiftsHeight)
        let newViewHeight = viewHeightConstraint.constant + CGFloat(shiftsHeight)
        viewHeightConstraint.constant = CGFloat(newViewHeight)
        self.updateViewConstraints()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    }
}
