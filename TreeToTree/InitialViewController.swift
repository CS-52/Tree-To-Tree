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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func login(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            API.signInUser(email:email , password: password)
        }
    }
    override func viewDidLoad() {
        self.loginButton.layer.cornerRadius = self.loginButton.frame.size.width / 8;
        self.signUpButton.layer.cornerRadius = self.signUpButton.frame.size.width / 8;
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
        let initialViewController = storyboard?.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
        UIApplication.shared.keyWindow?.rootViewController = initialViewController
        
    }
    
    
//    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
//        
//        
//        UnwindRightToLeft(identifier: "logout", source: self, destination: subsequentVC)
//        
//        
//        
////        return super.unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController)
//    }
    

}

