//
//  EventBrowserController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

struct Event {
    let name: String!
    let date: String!
    let shifts: String!
    let image: UIImage!
    let people: String!
    let interest: Int!
    
}

class EventBrowserController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchIcon: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
   
    
    var eventsArray = [Event]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadSampleEvents()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "EventBrowserCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventBrowserCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let event = eventsArray[indexPath.row]
        cell.eventImage.image = event.image
        cell.date.text = event.date
        cell.eventName.text = event.name
        cell.shifts.text = event.shifts
        cell.peopleGoing.text = event.people
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
        
    }
    
    //SEGUE STUFF
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventPageViewController {
            destination.arrayElem = eventsArray[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    private func loadSampleEvents() {
        let photo = UIImage(named: "Challah-Bread")
        let event1 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others", interest: 0)
        
        
       let event2 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others", interest: 0)
        
       let event3 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others", interest: 0) 
        
       eventsArray += [event1, event2, event3]
        
        
    }
    
    
    @IBAction func unwindToEventBrowser(segue:UIStoryboardSegue) { }
   
}


