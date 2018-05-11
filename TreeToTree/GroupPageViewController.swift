//
//  GroupPageViewController.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/26/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class GroupPageViewController: UITableViewController {
    
    var groupsArray = [Person]()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadSampleGroups()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GroupCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GroupPageCell  else {
            fatalError("The dequeued cell is not an instance of GroupCell.")
        }
        
        let group = groupsArray[indexPath.row]
        cell.groupPhoto.image = group.image
        cell.groupName.text = group.name
        
        return cell
    }
    
    private func loadSampleGroups() {
        //let photo = UIImage(named: "austinchow")
        let person1 = Person(name: "Austin Chow", image: #imageLiteral(resourceName: "austinchow"))
        let person2 = Person(name: "Suzanne Joh", image: #imageLiteral(resourceName: "suzannejoh"))
        let person3 = Person(name: "Keith Schwartz", image: #imageLiteral(resourceName: "afriendlyface"))
        let person4 = Person(name: "Chris Piech", image: #imageLiteral(resourceName: "piech"))
        let person5 = Person(name: "Mehran Sahami", image: #imageLiteral(resourceName: "Mehran"))
        
        groupsArray += [person1, person2, person3, person4, person5]
        
        
    }
    
    
}

