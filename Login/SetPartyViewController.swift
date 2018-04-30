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
    
    // logs the user out from the app and gmail
    @IBAction func logOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    
    
    @IBOutlet var hide: UIButton! // hidden button used for segue to main screen after logout
    @IBOutlet var partyNameTextField: UITextField!
    
    @IBOutlet var dateAndTimeTextField: UITextField!
    
    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var organizerTextField: UITextField!
    //Main view method on load
    override func viewDidLoad() {
        super.viewDidLoad()

        hide.isHidden = true // hides the hide button
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Use picker view to enter a date
    @IBAction func dateAction(_ sender: UITextField) {
        
        // This sets up the picker view programmatically
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        datePickerView.minimumDate = datePickerView.date
        
        // using the selector method handleDataPicker to add pickerview target
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    // This is an Objective-C selector method which is used above to format date and time
    @objc func handleDatePicker(sender: UIDatePicker) {
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.dateStyle = .medium
        timeFormatter.timeStyle = .short
        
        // formats the date and time
        dateAndTimeTextField.text = timeFormatter.string(from: sender.date)
    }
    
    
    // User touch method to shut down the keyboard when user presses outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Save button functionality to save user entered data to the Database
    @IBAction func saveButton(_ sender: Any) {
        
        // checks if party name is blank
        if(partyNameTextField.text == ""){
            
            // shows an alert message to the user
            let alert = UIAlertController(title: "Alert", message: "Party name can't be blank ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        // checks if location field is blank
        else if (locationTextField.text == ""){
            
            // shows an alert message to the user
            let alert = UIAlertController(title: "Alert", message: "Location can't be blank ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // checks if organizer field is blank
        else if(organizerTextField.text == ""){
            
            // shows an alert message to the user
            let alert = UIAlertController(title: "Alert", message: "Organizer name can't be blank", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
            
        // checks if website name is blank
        else if(website.text!.contains("")) {
            
            // shows an alert message to the user
            let alert = UIAlertController(title: "Alert", message: "Website name can't be blank", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            /*
             else if(verifyUrl(urlString: website.text!)) == false{
             let alert = UIAlertController(title: "Alert", message: "Invalid URL. Please try again", preferredStyle: UIAlertControllerStyle.alert)
             
             alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
             }
             
             else if(((website.text!.contains("N/A")))){
             
             let alert = UIAlertController(title: "Alert", message: "Invalid URL. Please try again", preferredStyle: UIAlertControllerStyle.alert)
             
             alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
             }
             */
        
        // executed after checking errors in input
        else{
            
            // creating a Database called Party
            let partyDB = Database.database().reference().child("Party")
            
            // storing everything based on user input to a partyDictionary
            let partyDictionary = ["Sender": Auth.auth().currentUser?.displayName, "PartyName": partyNameTextField.text!, "PartyDate": dateAndTimeTextField.text!, "PartyLocation": locationTextField.text!, "PartyOrganizer": organizerTextField.text!,"Website": website.text!]
            
            // prints an error if parties aren't stored in database and
            // prints "Parties Saved" if everything goes well
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
        
        // segues user back to the party screen after storing information in the Database
        performSegue(withIdentifier: "backToPartyView", sender: self)
    }
    /*
     
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
     */
    
}


