//
//  MeViewController.swift
//  Closet Matcher
//
//  Created by Jiayi Kou on 16/6/5.
//  Copyright © 2016年 Jiayi Kou. All rights reserved.
//

import UIKit
import Parse

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        
        tabBarItem = UITabBarItem(title: "Closet", image: UIImage(named: "Cloakroom-52.png"), tag: 0)
    }

    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        print("Logged out!")
        self.performSegueWithIdentifier("LogOutSegue", sender: self)
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
