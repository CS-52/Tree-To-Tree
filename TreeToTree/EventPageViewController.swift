//
//  EventPageViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
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
    
    //var arrayElem:String?
    var arrayElem:Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nameLabel.text = arrayElem?.name
        dateLabel.text = arrayElem?.date
        eventImage.image = arrayElem?.image
        self.friend1.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend2.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend3.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend4.layer.cornerRadius = self.friend1.frame.size.width / 2;
        self.friend5.layer.cornerRadius = self.friend1.frame.size.width / 2;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "EventBrowserCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventBrowserCell  else {
            fatalError("The dequeued cell is not an instance of EventBrowserCell.")
        }
        
        let event = eventsArray[indexPath.row]
        cell.eventImage.image = event.image
        cell.date.text = event.date
        cell.eventName.text = event.name
        cell.shifts.text = "\(event.shifts.count) shifts available."
        cell.peopleGoing.text = "\(event.goingIDs.count) people going."
        //cell.interest.interest = event.interest
        
        
        return cell
        
        
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        //        cell.textLabel?.text = eventsArray[indexPath.row]
        //        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row //what user taps on
        performSegue(withIdentifier: "segue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    //SEGUE STUFF
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventPageViewController {
            destination.arrayElem = eventsArray[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
     private func loadSampleShifts() {
     //let photo = UIImage(named: "Challah-Bread")
        let shift1 = Shift(name: "Dough Making", start: "6:00 PM", end: "7:20 PM")
     
     
     let event2 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", location: "Hillel", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others")
     
     let event3 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", location: "Hillel", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others")
     
     eventsArray += [event1, event2, event3]
     
     
     }
    
}


