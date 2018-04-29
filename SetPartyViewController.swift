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
    
    //    var locationInput : String = ""
    //    var dateInput: String = ""
    //    var eventInput: String = ""
    //    var cuisineInput: String = ""
    //
    
   
    
    @IBOutlet var hide: UIButton!
    @IBOutlet var partyNameTextField: UITextField!
    
    @IBOutlet var dateAndTimeTextField: UITextField!
    
    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var organizerTextField: UITextField!
    //Main view method on load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  locationTextField.isEnabled = false
        
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
        else{
            
            let partyDB = Database.database().reference().child("Parties")
            
            let partyDictionary = ["Sender": Auth.auth().currentUser?.displayName, "PartyName": partyNameTextField.text!, "PartyDate": dateAndTimeTextField.text!, "PartyLocation": locationTextField.text!, "PartyOrganizer": organizerTextField.text!]
            
            //         eventsDB.updateChildValues(eventsDictionary)
            
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
}

