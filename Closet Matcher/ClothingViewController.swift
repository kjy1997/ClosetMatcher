//
//  ClothingViewController.swift
//  Closet Matcher
//
//  Created by Jiayi Kou on 16/8/24.
//  Copyright © 2016年 Jiayi Kou. All rights reserved.
//

import UIKit

class ClothingViewController: UIViewController {

    @IBOutlet var stylePicker: UIPickerView!
    @IBOutlet var colorPicker: UIPickerView!
    @IBOutlet var fabricPicker: UIPickerView!
    @IBOutlet var brandTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
