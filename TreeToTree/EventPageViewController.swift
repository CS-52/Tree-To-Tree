//
//  EventPageViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var shiftsTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var eventSummary: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var orgLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    //image placeholders
    @IBOutlet weak var friend1: UIImageView!
    @IBOutlet weak var friend2: UIImageView!
    @IBOutlet weak var friend3: UIImageView!
    @IBOutlet weak var friend4: UIImageView!
    @IBOutlet weak var friend5: UIImageView!
    
    @IBOutlet weak var shiftsTableView: UITableView!
    
    //var arrayElem:String?
    var arrayElem:Event?
    
    var shifts = [Shift](){didSet{shiftsTableView.reloadData()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shiftsTableView.delegate = self
        shiftsTableView.dataSource = self
        
        nameLabel.text = arrayElem?.name
        dateLabel.text = arrayElem?.date
        eventSummary.text = arrayElem?.description
        eventImage.image = arrayElem?.image
        orgLabel.text = arrayElem?.organization
        locationLabel.text = arrayElem?.location
        
        self.friend1.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend2.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend3.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend4.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend5.layer.cornerRadius = self.friend1.frame.size.width / 2;
        
        //populate shifts
        for shiftKey in (arrayElem?.shifts.keys)! {
            let shift = Shift(key: shiftKey, dictionary: (arrayElem?.shifts[shiftKey]!)!)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayElem?.shifts)!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ShiftCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ShiftCell  else {
            fatalError("The dequeued cell is not an instance of ShiftCell.")
        }
        
        
        
        let shift = shifts[indexPath.row]
        
        //COME BACK LATER -SUZANNE
        cell.nameLabel.text = shift.name
        cell.timeLabel.text = shift.start + "-" + shift.end
        cell.signUpButton.shiftID = shift.key
        cell.signUpButton.eventID = arrayElem?.key
        print("Printing currentUser in shift class.")
        print(currentUser ?? "no current user")
        if currentUser?.goingIDs != nil,
            currentUser?.goingIDs[(arrayElem?.key)!] != nil,
            let shiftsGoing = currentUser?.goingIDs[(arrayElem?.key)!],
            shiftsGoing[shift.key] != nil{
            cell.signUpButton.backgroundColor = .gray
            cell.signUpButton.setTitle("Signed Up!", for: .normal)
        }
        
//        for shift in (arrayElem?.shifts)! {
//            self.shifts += shift;
//        }

        
        
        
        return cell
        
        
    }
    
    
}


