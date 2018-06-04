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
        if let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty{
            if(validateEmail(enteredEmail: email)){
                API.signInUser(email:email , password: password, loginPage: self)
            } else{
                showAlert(errorString: "Please provide a valid email address.")
            }
        } else{
            showAlert(errorString: "Please provide an email and a password")
        }
    }
    override func viewDidLoad() {
        self.loginButton.layer.cornerRadius = self.loginButton.frame.size.width / 20;
        self.signUpButton.layer.cornerRadius = self.signUpButton.frame.size.width / 20;
        passwordTextField.isSecureTextEntry = true //black dots, hides keys
        super.viewDidLoad()
        CreateEvents.addEvents()
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
        API.signOut()
        let initialViewController = storyboard?.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
        UIApplication.shared.keyWindow?.rootViewController = initialViewController
        
    }
    
    func moveToEventsPage(){
        let navigationController = storyboard?.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
        self.present(navigationController, animated: false)
    }
    
    func showAlert(errorString: String) {
        let alertController = UIAlertController(title: "TreeToTree", message:
            errorString, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
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

