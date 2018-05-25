//
//  EventBrowserController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventBrowserController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sideMenuImage: UIImageView!
    @IBOutlet weak var searchIcon: UIBarButtonItem!
    
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var filter: UIButton!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var EventBrowswer: UIStackView!
    var menuShowing = false
    
    var eventsArray = [Event](){didSet{tableView.reloadData()}}
    
    @IBAction func showMenu(_ sender: Any) {
        if (menuShowing) {
            leadingConstraint.constant = 0
            trailingConstraint.constant = 0
            EventBrowswer.layer.opacity = 1
            filter.isHidden = true;

            tableView.isUserInteractionEnabled = true;
        } else {
            leadingConstraint.constant = 250
            trailingConstraint.constant = -250
            EventBrowswer.layer.opacity = 0.3
            filter.isHidden = true;
            tableView.isUserInteractionEnabled = false;
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        menuShowing = !menuShowing
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        if(menuShowing) {
            leadingConstraint.constant = 0
            trailingConstraint.constant = 0
            EventBrowswer.layer.opacity = 1
            tableView.isUserInteractionEnabled = true;
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menuShowing = !menuShowing
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowRadius = 10
        
        self.sideMenuImage.layer.cornerRadius = self.sideMenuImage.frame.size.width / 2;
        
        //loadSampleEvents()
        API.getEvents(completed: {events in

     
            print("got events")
            print(events)
            self.eventsArray = events
            
        })
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
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
    
    /*
    private func loadSampleEvents() {
        //let photo = UIImage(named: "Challah-Bread")
        let event1 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", location: "Hillel", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others")
        
        
        let event2 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", location: "Hillel", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others")
        
        let event3 = Event(name: "Challah Bake", date: "Sunday April 15th, 4:30 - 7:30 PM", location: "Hillel", shifts: "3 shifts available", image: #imageLiteral(resourceName: "Challah-Bread"), people: "Jose, Michelle, Julie, and 5 others")
        
       eventsArray += [event1, event2, event3]
        
        
    }*/
    
    
    @IBAction func unwindToEventBrowser(segue:UIStoryboardSegue) { }
   
}


