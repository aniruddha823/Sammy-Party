//
//  SetEventViewController.swift
//  SammyFood
//
//  Created by PUNEET TOKHI on 11/12/17.
//  Copyright © 2017 SammyFood. All rights reserved.
//

import UIKit
import Firebase

//Class used to create an event
class SetPartyViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var website: UITextField!
    @IBAction func logOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
  
    
    
    @IBOutlet var hide: UIButton!
    @IBOutlet var partyNameTextField: UITextField!
    
    @IBOutlet var dateAndTimeTextField: UITextField!
    
    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var organizerTextField: UITextField!
    //Main view method on load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        hide.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Use picker view to enter a date
    
    @IBAction func dateAction(_ sender: UITextField) {
    
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        datePickerView.minimumDate = datePickerView.date
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        //     timeFormatter.dateFormat = "dd/MM/yyyy"
        timeFormatter.dateStyle = .medium
        timeFormatter.timeStyle = .short
        dateAndTimeTextField.text = timeFormatter.string(from: sender.date)
        //    dateInput = timeFormatter.string(from: sender.date)
    }
    
    
    //User touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    //Save button functionality
    @IBAction func saveButton(_ sender: Any) {
        
        if(partyNameTextField.text == ""){
            
            let alert = UIAlertController(title: "Alert", message: "Party name can't be blank ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        else if (locationTextField.text == ""){
            
            let alert = UIAlertController(title: "Alert", message: "Location can't be blank ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        else if(organizerTextField.text == ""){
            
            let alert = UIAlertController(title: "Alert", message: "Organizer name can't be blank", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
            
    //    else if(((website.text!.contains("N/A"))) || website.text!.contains(""))  {
        else if(website.text!.contains("")) {
            let alert = UIAlertController(title: "Alert", message: "Website name can't be blank", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(verifyUrl(urlString: website.text!)) == false{
            let alert = UIAlertController(title: "Alert", message: "Invalid URL. Please try again", preferredStyle: UIAlertControllerStyle.alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
//       else if(((website.text!.contains("N/A")))){
//            return
//        }
//
////
//            let alert = UIAlertController(title: "Alert", message: "Invalid URL. Please try again", preferredStyle: UIAlertControllerStyle.alert)
//
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //            self.present(alert, animated: true, completion: nil) }
        
            
        else{
            
            let partyDB = Database.database().reference().child("Party")
            
            let partyDictionary = ["Sender": Auth.auth().currentUser?.displayName, "PartyName": partyNameTextField.text!, "PartyDate": dateAndTimeTextField.text!, "PartyLocation": locationTextField.text!, "PartyOrganizer": organizerTextField.text!,"Website": website.text!]
            
            partyDB.childByAutoId().setValue(partyDictionary){
                
                (error, ref) in
                
                if(error != nil){
                    print(error!)
                }
                else{
                    print("Parties saved")
                    
                }
            }
        }
        
        
        performSegue(withIdentifier: "backToPartyView", sender: self)
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if(urlString.contains("N/A")){
                return true
            }
          else if let url  = NSURL(string: urlString) {
                
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

}


