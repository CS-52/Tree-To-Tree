//
//  InterestedFriends.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPeople: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var curEvent:Event?
    
    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var peopleGoing = [User](){
        didSet {
            peopleTableView.reloadData()
        }
    }
        
    var peopleInterested = [User](){
        didSet {
            peopleTableView.reloadData()
        }
    }
        
    
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
        
        let cellIdentifier = "eventPersonCell"
        
        guard let personCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventPersonCell  else {
            fatalError("The dequeued cell is not an instance of EventPersonCell.")
        }
        print("user count")
        print(self.peopleGoing.count)
        
        switch(segmentedControl.selectedSegmentIndex)
        {
        case 0:
            
            let going = peopleGoing[indexPath.row]
            //person cell corresponds to people going
            personCell.personName.text = going.firstName + " " + going.lastName
           // personCell.personImg.image = going.image
            break
        case 1:
            let interested = peopleInterested[indexPath.row]
            //person cell corresponds to people interested
            personCell.personName.text = interested.firstName + " " + interested.lastName
           // personCell.personImg.image = interested.image
            break
            
        default:
            break
        }
        return personCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
////        performSegue(withIdentifier: "segue", sender: self)
////        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("going Ids")
        print(curEvent?.goingIDs!)
        
        //populate people going array
        for goingId in (curEvent?.goingIDs)! {
            //load a user with goingId
            print(goingId)
            API.getUserWithKey(goingId, completed: {user in
                print("got going user")
                print(user?.firstName)
                self.peopleGoing.append((user)!)
                print("appended!")
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
//        switch(segmentedControl.selectedSegmentIndex)
//        {
//        case 0:
//            let goingCount = peopleGoing.count
//            let goingHeight = goingCount * 50 //height of each cell
//            //update height constraint for table view
//            //edit to scroll view
//            //self.updateViewConstraints()
//            break
//        case 1:
//            let interestedCount = peopleInterested.count
//            let interestedHeight = interestedCount * 50 //height of each cell
//            //update height constraint for table view
//            //edit to scroll view
//            //self.updateViewConstraints()
//            break
//
//        default:
//            break
//
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
