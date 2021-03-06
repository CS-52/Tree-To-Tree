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
    @IBOutlet weak var sideMenuName: UITextField!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var nextToFilter: UIView!
    @IBOutlet weak var filter: UIButton!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var hiddenSidebar: UIView!
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var EventBrowswer: UIStackView!
    var menuShowing = false
    
    @IBAction func onSignOut(_ sender: UIButton) {
//        let initialViewController = storyboard?.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
//        UIApplication.shared.keyWindow?.rootViewController = initialViewController
        
    }
    
    var eventsArray = [Event](){
        didSet {
            eventsArray.sort(by: {$0.name < $1.name})
            tableView.reloadData()
            
        }
    }
    
    @IBAction func showMenu(_ sender: Any) {
        self.sideMenuName.text = ((currentUser?.firstName)! + " " + (currentUser?.lastName)!);
        if (menuShowing) {
            leadingConstraint.constant = 0
            trailingConstraint.constant = 0
            EventBrowswer.layer.opacity = 1
            filter.isHidden = false;
            nextToFilter.isHidden = false;
            tableView.isUserInteractionEnabled = true;
        } else {
            leadingConstraint.constant = 250
            trailingConstraint.constant = -250
            EventBrowswer.layer.opacity = 0.3
            nextToFilter.isHidden = true;
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
            tableView.isUserInteractionEnabled = false;
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menuShowing = !menuShowing
        }
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let initialViewController = storyboard?.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
       // UIApplication.shared.keyWindow?.rootViewController = initialViewController
        
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
        cell.interested.eventID = event.key
        if currentUser != nil,
            currentUser?.interestedIDs != nil,
            currentUser?.interestedIDs[event.key] != nil {
            cell.interested.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        } else{
            cell.interested.setImage(#imageLiteral(resourceName: "heartOutline"), for: .normal)
        }
    
        
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
    
//    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
//        

//                    let unwindSegue = UnwindRightToLeft(identifier: "logout", source: fromViewController, destination: toViewController)
//                    return unwindSegue
//
//    }
    

   
}


