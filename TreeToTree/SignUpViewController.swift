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
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var major: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func signUp(_ sender: UIButton) {
        if (!validateEmail(enteredEmail: email.text ?? "")){
            showAlert(errorString: "Please provide a valid email")
        } else if((password.text?.characters.count)!  < 6){
            showAlert(errorString: "Password must be at least 6 characters wrong.")
        } else {
            let userInfo: [String: Any] = [
                "firstName": firstName.text ?? "",
                "lastName": lastName.text ?? "",
                "major": major.text ?? "",
                "email": email.text ?? "",
                "password": password.text ?? ""
            ]
            API.signUpUser(userInfo: userInfo)
            //SEGUE
            let tutorialController = self.storyboard?.instantiateViewController(withIdentifier: "tutorialBegin")
            self.present(tutorialController!, animated: true)
        }
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    override func viewDidLoad() {
        self.createAccountButton.layer.cornerRadius = self.createAccountButton.frame.size.width / 8;
        password.isSecureTextEntry = true //black dots, hides keys
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
