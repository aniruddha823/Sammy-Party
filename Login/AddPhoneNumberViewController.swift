//
//  AddPhoneNumberViewController.swift
//  Login
//
//  Created by Dominic on 4/29/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import Firebase

class AddPhoneNumberViewController: UIViewController {
    
    //Phone number Field
    @IBOutlet weak var phoneNumberField: UITextField!
    //Phone number button
    @IBOutlet weak var phoneNumberButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savePhoneNumber(_ sender: Any) {
        //Instance in the Db
        let partyDB = Database.database().reference().child("Users")
        //Create a feature of attribute of Phonenumber for Users
        let partyDictionary = ["PhoneNumber": phoneNumberField.text!, ]
        //add phone number to Db
        partyDB.childByAutoId().setValue(partyDictionary){
            
            (error, ref) in
            
            if(error != nil){
                print(error!)
            }
            else{
                print("PhoneNumber added")
                
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
}
