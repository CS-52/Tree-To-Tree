//
//  EventPageViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/15/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    var shifts = [String : Dictionary<String, [String]>](){didSet{shiftsTableView.reloadData()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shiftsTableView.delegate = self
        shiftsTableView.dataSource = self
        
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
        return (arrayElem?.shifts)!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ShiftCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ShiftCell  else {
            fatalError("The dequeued cell is not an instance of ShiftCell.")
        }
        //COME BACK LATER -SUZANNE
//        self.shifts = (arrayElem?.shifts)!
//        cell.nameLabel.text = shifts["0000"]?["name"]
//        cell.timeLabel.text = (shifts["0000"]?["start time"])! + "-" + (shifts["0000"]?["end time"])!
//
        
//        for shift in (arrayElem?.shifts)! {
//            self.shifts += shift;
//        }
//
//        for (id, shift) in shifts {
//
//            cell.nameLabel.text = shift[id]?["name"]
//            cell.timeLabel.text = (shift[id]?["start time"])! + "-" + (shift[id]?["end time"])!
//            //return cell
//
//        }
//
//        let shift = shifts[indexPath.row]
        
        
        return cell
        
        
    }
    
    
}


