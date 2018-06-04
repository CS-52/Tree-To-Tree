//
//  API.swift
//  TreeToTree
//
//  Created by Suzanne Joh on 5/1/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class API {
    static let databaseReference: DatabaseReference = Database.database().reference()
    static let eventsReference = databaseReference.child("events")
    static let usersReference = databaseReference.child("users")
    // firebase storage
    static let storage = Storage.storage()
    static let storageReference = storage.reference()
    static let eventImagesReference = storageReference.child("eventPics")
    
    
    class func createEvent(eventInfo: Dictionary<String, AnyObject>) /*-> Event*/ {
        let eventReference = eventsReference.childByAutoId()
        eventReference.setValue(eventInfo)
        return //Event(key: key, dictionary: eventInfo)
    }
    class func createUser(userInfo: Dictionary<String, AnyObject>) /*-> User*/ {
        let userReference = usersReference.childByAutoId()
        userReference.setValue(userInfo)
        return //User(key: key, dictionary: eventInfo)
    }
    
    class func createUserWithKey(_ key:String, userInfo: Dictionary<String, Any>) /*-> User*/ {
        let userReference = usersReference.child(key)
        userReference.setValue(userInfo)
        return //User(key: key, dictionary: eventInfo)
    }
    
    class func uploadProfileImage(key: String, image: UIImage, completed: ((URL?) -> Void)?) {
        let thisImageReferences = eventImagesReference.child(key)
        
        let data = UIImageJPEGRepresentation(image, 0.1)!
        let uploadTask = thisImageReferences.putData(data, metadata: nil, completion: { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type, and download URL.
            let downloadURL = metadata.downloadURL()
            completed?(downloadURL)
        })
    }

    
//    class func getEventWithKey(_ key: String, completed: ((Event?) -> Void)?) {
//        eventsReference.child(key).observeSingleEvent(of: .value, with: { snapshot in
//            var event: Event?
//
//            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
//                NSLog("printing the dictionary used to create a new Event")
//                NSLog(String(describing: dictionary))
//                event = Event(key: key, dictionary: dictionary)
//            }
//
//            completed?(event)
//        })
//    }
    
    class func getEvents(completed:(([Event])->Void)?){
        eventsReference.observeSingleEvent(of: .value, with: {snapshot in
            var events: [Event] = []
            
            if let dictionary = snapshot.value as? Dictionary<String, Dictionary<String, AnyObject>> {
                NSLog("printing the dictionary used to create a new Event")
                NSLog(String(describing: dictionary))
                var count = dictionary.keys.count
                for eventKey in dictionary.keys{
                    // retreive image here and let event be in the completed function
                    
                    count = count - 1
                    var profileImage: UIImage?
                    var event = dictionary[eventKey];
                    print(event)
                    print(String(describing: event!["image_url"]!))
                    let gsReference = API.storage.reference(forURL: String(describing: event!["image_url"]!))
                    gsReference.getData(maxSize: 1 * 1024 * 1024, completion:  { data, error in
                        if error != nil {
                            // Uh-oh, an error occurred!
                            NSLog("an error occured when downloading the image")
                            print(error)
                            profileImage = #imageLiteral(resourceName: "austinchow")
                        } else {
                            // Successfully gets and sets image
                            print("successfully downloaded image")
                            profileImage = UIImage(data: data!)
                        }
                
                        let event = Event(key: eventKey, dictionary: event!, image: profileImage!)
                        events.append(event)
                        if count == 0 {
                            completed?(events)
                        }
                    })
                }
            }
            
        })//look into live updating
    }
    
    
    class func getUserWithKey(_ key: String, completed: ((User?) -> Void)?) {
        usersReference.child(key).observeSingleEvent(of: .value, with: { snapshot in
            var event: User?
            
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                NSLog("printing the dictionary used to create a new Event")
                NSLog(String(describing: dictionary))
                event = User(key: key, dictionary: dictionary)
            }
            
            completed?(event)
        })
    }
    
    class func signUpUser(userInfo: Dictionary<String, Any>, password: String, signUpPage: SignUpViewController) {
        //Need better error checking
        Auth.auth().createUser(withEmail: userInfo["email"] as! String, password: password ) { (authResult, error) in
            if(authResult != nil){
              print("created New User")
              createUserWithKey((authResult?.uid)!, userInfo: userInfo)
              signUpPage.beginTutorial()
            }else{
                signUpPage.showAlert(errorString: (error?.localizedDescription)!)
            }
        }
    }
    
    class func signInUser(email: String, password:String, loginPage: InitialViewController){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if(user != nil){
                getUserWithKey((user?.uid)!, completed: { (user) in
                    currentUser = user
                    print(currentUser!)
                })
                loginPage.moveToEventsPage()
            } else{
                loginPage.showAlert(errorString: (error?.localizedDescription)!)
                print("Unable to login.")
                print(error ?? "")
            }
        }
    }
    
    func isValidUser(userInfo: Dictionary<String, Any>) -> Bool{
        if(validateEmail(enteredEmail: userInfo["email"] as! String) && (userInfo["password"] as! String != "")){
            return true
        } else{
            return false
        }
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    class func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            currentUser = nil
            print("User signed out")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    class func signUpForShift(eventID: String, shiftID: String){
        let eventShiftReference = eventsReference.child(eventID).child("shifts").child(shiftID).child("goingIDs")
        eventShiftReference.child((currentUser?.key)!).setValue(0) //0 is dummy data
        let userShiftReference = usersReference.child((currentUser?.key)!).child("goingIDs").child(eventID)
        userShiftReference.child(shiftID).setValue(0) //0 is dummy data
        
        return
    }
    
    class func signOutOfShift(eventID: String, shiftID: String){
        let eventShiftReference = eventsReference.child(eventID).child("shifts").child(shiftID).child("goingIDs")
        eventShiftReference.child((currentUser?.key)!).removeValue()
        let userShiftReference = usersReference.child((currentUser?.key)!).child("goingIDs").child(eventID)
        userShiftReference.child(shiftID).removeValue()
        
        return
    }
}



