//
//  UserProfile.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class UserProfile: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userMajor: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userNumFriends: UILabel!
    @IBOutlet weak var userNumHours: UILabel!
    @IBOutlet weak var userNumBadges: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var eventArray = [Event]() {
        didSet {
            tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        userName.text = ((currentUser?.firstName)! + " " + (currentUser?.lastName)!);
        userMajor.text = (currentUser?.major)!
        // change later after we add it to user
        userNumFriends.text = "5";
        userNumHours.text = "30";
        userNumBadges.text = "1";
        
        userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2;
        
        if(currentUser?.goingIDs != nil) {
            //eventArray = currentUser?.goingIDs;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UserCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserProfileCell  else {
            fatalError("The dequeued cell is not an instance of UserProfileCell.")
        }
        
        /*
        let event = eventsArray[indexPath.row]
        cell.eventImage.image = event.image
        cell.date.text = event.date
        cell.eventName.text = event.name
        cell.shifts.text = "\(event.shifts.count) shifts available."
        cell.peopleGoing.text = "\(event.goingIDs.count) people going."
        cell.interested.eventID = event.key
        if currentUser != nil,
            currentUser?.interestedIDs != nil,
            currentUser?.interestedIDs[event.key] != nil {
            cell.interested.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        }
        */
        
        return cell;
        
        
    }
    
}

