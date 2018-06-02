//
//  SignUpViewController.swift
//  TreeToTree
//
//  Created by Jose Miguel Giron on 29/5/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func signUp(_ sender: UIButton) {
        if (!validateEmail(enteredEmail: emailTextField.text ?? "")){
            showAlert(errorString: "Please provide a valid email")
        } else if((passwordTextField.text?.characters.count)!  < 6){
            showAlert(errorString: "Password must be at least 6 characters wrong.")
        } else if let firstName = firstNameTextField?.text, !firstName.isEmpty, let lastName = lastNameTextField?.text, !lastName.isEmpty, let major = majorTextField?.text, !major.isEmpty  {
            let userInfo: [String: Any] = [
                "firstName": firstName,
                "lastName": lastName,
                "major": major,
                "email": emailTextField.text!,
                "hours": 0
            ]
            API.signUpUser(userInfo: userInfo, password: self.passwordTextField.text!, signUpPage: self) //calls segue if successful
            //SEGUE
            //let tutorialController = self.storyboard?.instantiateViewController(withIdentifier: "tutorialBegin")
            //self.present(tutorialController!, animated: true)
        } else{
            showAlert(errorString: "Please provide a first name, a last name, and a major.")
        }
    }
    
    func beginTutorial() {
        let tutorialController = self.storyboard?.instantiateViewController(withIdentifier: "tutorialBegin")
        self.present(tutorialController!, animated: true)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    override func viewDidLoad() {
        self.createAccountButton.layer.cornerRadius = self.createAccountButton.frame.size.width / 12;
        passwordTextField.isSecureTextEntry = true //black dots, hides keys
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    func showAlert(errorString: String) {
        let alertController = UIAlertController(title: "TreeToTree", message:
            errorString, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    

}
