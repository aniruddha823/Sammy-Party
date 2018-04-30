//
//  ContactUsViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //If the user presses on the contact via email
    
    @IBAction func contactViewEmailPressed(_ sender: Any) {
        
        //Opens mail app in iOS device (not simulator)
//        UIApplication.shared.open(URL(string: "mailtoCMPE137PartyApp@gmail.com")! as URL, options: [:], completionHandler: nil)
//        print("hrl")

        let email = "CMPE137PartyApp@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
   
    //contact via number pressed
    @IBAction func contactViaNumberPressed(_ sender: Any) {
        //opens ios Phone app, not in simulator
        if let url = URL(string: "tel://\(4087210921)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
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
