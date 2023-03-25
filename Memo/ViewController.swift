//
//  ViewController.swift
//  Memo
//
//  Created by Jingyuan Yang on 3/20/23.
//

import UIKit
import ParseSwift
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    
    @IBAction func login(_ sender: Any) {
        // Retrieving the info from the text fields
        let username = usernameText.text
        let password = passwordText.text
               
               // Defining the user object
               PFUser.logInWithUsername(inBackground: username!, password: password!, block: {(user, error) -> Void in
                   if let error = error as NSError? {
                       let errorString = error.userInfo["error"] as? NSString
                       self.alert(message: errorString!, title: "Error")
                   }
                   else {
                       var user = User(username: username!, password: password!)
                       self.performSegue(withIdentifier: "homeSegue", sender: user)
                   }
               })
    }
    @IBAction func register(_ sender: Any) {
        // Retrieving the info from the text fields
                let username = usernameText.text
                let password = passwordText.text
                
                // Defining the user object
                let user = PFUser()
                user.username = username
                user.password = password
                
                // We won't set the email for this example;
                // Just for simplicity
                
                // Signing up using the Parse API
                user.signUpInBackground {
                    (success, error) -> Void in
                    if let error = error as NSError? {
                        let errorString = error.userInfo["error"] as? NSString
                        self.alert(message: errorString!, title: "Error")
                        
                    } else {
                        self.alert(message: "Registered successfully", title: "Registering")
                    }
                }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeSegue" {
            let user = User(username: usernameText.text!, password: passwordText.text!)
            guard let destinationViewController = segue.destination as? FlashcardsHomeTableViewController else {return }
            destinationViewController.user = user
        }
        
    }
}

