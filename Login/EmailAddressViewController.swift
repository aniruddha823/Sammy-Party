//
//  EmailAddressViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/29/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

class EmailAddressViewController: UIViewController {

    @IBOutlet weak var emailID: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //Fetches email address from Database
        emailID.text = GIDSignIn.sharedInstance().currentUser.profile.email
        
        
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

}
