//
//  ViewController.swift
//  Closet Matcher
//
//  Created by Jiayi Kou on 16/5/30.
//  Copyright © 2016年 Jiayi Kou. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    @IBOutlet var usernameField: UITextField!

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var passwordField: UITextField!
    @IBAction func onLogIn(sender: AnyObject) {
        if (usernameField.text == "") || (passwordField.text == "" ) {
            self.infoLabel.text = "Please fill all the required field!"
        }else{

            PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user:PFUser?, error:NSError?) -> Void in
                if user != nil {
                    print("Logged in!")
                    self.infoLabel.text = "You're logged in!"
                    self.performSegueWithIdentifier("LoginSegue", sender: self)
                }
        }
        }
    }
   
    @IBAction func onSignUp(sender: AnyObject) {
        let newuser = PFUser()
        if (usernameField.text == "") || (passwordField.text == "" ) {
            self.infoLabel.text = "Please fill all the required field!"
        }else{
        newuser.username = usernameField.text
        newuser.password = passwordField.text
        newuser.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success {
                print("Created a user")
                self.infoLabel.text = "Sign up successfully!"
                self.performSegueWithIdentifier("SignUpSegue", sender: self)
            }else{
                print(error?.localizedDescription)
                if error?.code == 202 {
                    self.infoLabel.text = "User already exists!"
                }
            }
        }
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let signup = segue.destinationViewController as! SignUpViewController
//        signup.userID = self.userID
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

