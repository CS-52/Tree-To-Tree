//
//  GroupPageViewController.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/26/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class GroupPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    struct Group {
        var name: String;
        var image: UIImage;
    }
    
    @IBOutlet var tableView: UITableView!
    
    var groupsArray = [Group]() {
        didSet {
            tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        loadSampleGroups()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsArray.count
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GroupCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GroupPageCell  else {
            fatalError("The dequeued cell is not an instance of GroupCell.")
        }
        
        let group = groupsArray[indexPath.row]
        cell.groupPhoto.image = group.image
        cell.groupPhoto.layer.cornerRadius = cell.groupPhoto.frame.width / 2
        cell.groupPhoto.clipsToBounds = true
        cell.groupName.text = group.name
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func loadSampleGroups() {
        let photo = UIImage(named: "afriendlyface")
        let group1 = Group(name: "Austin Chow", image: #imageLiteral(resourceName: "austinchow"))
        let group2 = Group(name: "Suzanne Joh", image: #imageLiteral(resourceName: "suzannejoh"))
        let group3 = Group(name: "Keith Schwartz", image: #imageLiteral(resourceName: "afriendlyface"))
        let group4 = Group(name: "Chris Piech", image: #imageLiteral(resourceName: "piech"))
        let group5 = Group(name: "Mehran Sahami", image: #imageLiteral(resourceName: "Mehran"))
        
        groupsArray += [group1, group2, group3, group4, group5]
        
        
    }
    
    
    
}

