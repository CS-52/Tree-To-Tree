//
//  FriendsTableViewController.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 4/23/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

struct Person {
    let name: String!
    let image: UIImage!
    
}

class FriendsTableViewController: UITableViewController {
    
    var friendsArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSamplePeople();
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsArray.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PersonCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PersonCell  else {
            fatalError("The dequeued cell is not an instance of PersonCell.")
        }

        // Configure the cell...
        let friend = friendsArray[indexPath.row]
        cell.personImg.image = friend.image
        cell.personName.text = friend.name
        cell.personImg.layer.cornerRadius = cell.personImg.frame.size.width / 2;

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfilePageViewController {
            destination.person = friendsArray[(tableView.indexPathForSelectedRow?.row)!]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        performSegue(withIdentifier: "segueToProfile", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func loadSamplePeople() {
        //let photo = UIImage(named: "austinchow")
        let person1 = Person(name: "Austin Chow", image: #imageLiteral(resourceName: "austinchow"))
        let person2 = Person(name: "Suzanne Joh", image: #imageLiteral(resourceName: "suzannejoh"))
        let person3 = Person(name: "Keith Schwartz", image: #imageLiteral(resourceName: "afriendlyface"))
        
        friendsArray += [person1, person2, person3]
        
        
    }

}
