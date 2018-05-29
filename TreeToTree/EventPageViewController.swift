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
    
    var shifts = [Shift](){didSet{shiftsTableView.reloadData()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shiftsTableView.delegate = self
        shiftsTableView.dataSource = self
        
        nameLabel.text = arrayElem?.name
        dateLabel.text = arrayElem?.date
        eventSummary.text = arrayElem?.description
        eventImage.image = arrayElem?.image
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
        
        //adjust size of description label
//        let maxSize = CGSize(width: 359, height: 1000)
//        let size = eventSummary.sizeThatFits(maxSize)
//        eventSummary.frame = CGRect(size: size)
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
        
//        for shiftKey in (arrayElem?.shifts.keys)! {
//            let shift = Shift(key: shiftKey, dictionary: (arrayElem?.shifts[shiftKey]!)!)
//            shifts.append(shift)
//        }
        
        let shift = shifts[indexPath.row]
        
        //COME BACK LATER -SUZANNE
        cell.nameLabel.text = shift.name
        cell.timeLabel.text = shift.start + "-" + shift.end

        
//        for shift in (arrayElem?.shifts)! {
//            self.shifts += shift;
//        }

        
        
        
        return cell
        
        
    }
    
    
}


