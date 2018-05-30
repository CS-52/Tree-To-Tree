//
//  InitialViewController.swift
//  TreeToTree
//
//  Created by Jose Miguel Giron on 8/4/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//


import UIKit

var currentUser: User?
//have a did set method for user

class InitialViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func login(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            API.signInUser(email:email , password: password)
        }
    }
    override func viewDidLoad() {
        passwordTextField.isSecureTextEntry = true //black dots, hides keys
        super.viewDidLoad()
        //CreateEvents.addEvents()
        //CreateUsers.addUsers()
        //Check if current user is saved from firebase
            // -if so, segue to browser
            // -else do nothing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToInitialViewController(segue:UIStoryboardSegue) { }
    
    @IBAction func unwindFromLogOut(segue: UIStoryboardSegue) {
        // segue back
    }
    
    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        
        if let id = identifier {
            if id == "logout" {
                let unwindSegue = UnwindRightToLeft(identifier: id, source: fromViewController, destination: toViewController)
                return unwindSegue
            }
        }
        
        return super.segueForUnwinding(to: toViewController, from: fromViewController, identifier: identifier)!
    }
    

}

