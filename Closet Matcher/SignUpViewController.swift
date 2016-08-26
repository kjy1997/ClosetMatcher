//
//  SignUpViewController.swift
//  Closet Matcher
//
//  Created by Jiayi Kou on 16/8/23.
//  Copyright © 2016年 Jiayi Kou. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet var avatarImage: UIImageView!

    @IBOutlet var phoneTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var birthdayTxtField: UITextField!
    @IBOutlet var countryTxtField: UITextField!
    @IBOutlet var genderTxtField: UITextField!
    @IBOutlet var nameTxtField: UITextField!
    @IBOutlet var WarningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Sign Up"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTapChangeButton(sender: AnyObject) {
//camera
        //        let vc = UIImagePickerController()
//        vc.delegate = self
//        vc.allowsEditing = true
//        vc.sourceType = UIImagePickerControllerSourceType.Camera
//        
//        self.presentViewController(vc, animated: true, completion: nil)
        
    //photo library
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            self.avatarImage.image = editedImage
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        let userID = PFUser.currentUser()?.objectId
        var userInfoQuery = PFQuery(className: "_User")
        userInfoQuery.getObjectInBackgroundWithId(userID!) { (user:PFObject?, error:NSError?) -> Void in
            if error != nil {
                print(error?.description)
            }else{
                user!["name"] = self.nameTxtField.text
                user!["gender"] = self.genderTxtField.text
                user!["country"] = self.countryTxtField.text
                user!["birthday"] = self.birthdayTxtField.text
                let email = self.emailTxtField.text
                if  !((email!.containsString("@")) && (email!.containsString("."))){
                    print("Email Address is invalid")
                    self.WarningLabel.text = "Email Address is invalid"
                }else{
                user!["email"] = self.emailTxtField.text
                user!["phone"] = self.phoneTxtField.text
                user?.saveInBackground()
                self.performSegueWithIdentifier("SignUpInfoSegue", sender: self)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
