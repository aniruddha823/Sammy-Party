//
//  PartyViewController.swift
//  Login
//
//  Created by PUNEET TOKHI on 4/15/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import Firebase

class PartyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // table view outlet
    @IBOutlet weak var partyTableView: UITableView!
    
    // creating an empty array of data type Party
    var partyArray : [Party] = [Party]()
    
    // index tracker
    var myIndex = 0
    
    // variable used to pass data to WebViewController
    var webStr: String = ""
    
    // logs out user from the app and google account
    @IBAction func logOutAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        
        // takes user back to main screen
        performSegue(withIdentifier: "logOutSegue", sender: self)
    }
    
    // This is the action for the button used to show all available
    // parties on a map.
    @IBAction func showParties(_ sender: Any) {
        performSegue(withIdentifier: "showAllParties", sender: self)
    }
    
    // Function with switch cases for various segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier {
        case "showAllParties"?:
            var mapVC = segue.destination as! MapViewController
            
            // Passes the party array to the map view's controller
            mapVC.parties = partyArray
            
        case "webSegue"?:
            let webView = segue.destination as! WebViewController
            webView.str = webStr
            
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up required delegates to self
        partyTableView.delegate = self
        partyTableView.dataSource = self
        
        // to register xib file
        
        partyTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        
        // calling retreiveMessages function
        retrieveMessages()
        
        
    }
    
    // required method for UITableViewDataSource and delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        webStr = "\(partyArray[indexPath.row].website)"
        myIndex = indexPath.row
        performSegue(withIdentifier: "webSegue", sender: self)
        self.view.endEditing(true)
    }
    
    // returns number of rows based on party array size
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyArray.count
    }
    
    // displays the variablbes retrieved from database to the user in table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // using identifier assigned in TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.partyName.text = "\(partyArray[indexPath.row].partyName)"
        cell.organizerName.text = "\(partyArray[indexPath.row].partyOrganizer)"
        cell.dateAndTime.text = "\(partyArray[indexPath.row].partyDate)"
        cell.locationLabel.text = "\(partyArray[indexPath.row].partyLocation)"
        cell.postedBy.text = "\(partyArray[indexPath.row].userName)"
        cell.website.text = "\(partyArray[indexPath.row].website)"
       
        return cell
    }
    
    // configures the table row
    func configureTableRow(){
        
        partyTableView.estimatedRowHeight = UITableViewAutomaticDimension
        partyTableView.rowHeight = 230.0
        
    }
    
    // this function uses Firebase database child from SetPartyViewController to retrieve messages
    func retrieveMessages(){
        
        // accessing the child database and assigning it to partiesDB
        let partiesDB = Database.database().reference().child("Party")
        
        // gets the snapshot value
        partiesDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            let partyName = snapshotValue["PartyName"]!
            let userName = snapshotValue["Sender"]!
            let partyDate = snapshotValue["PartyDate"]!
            let partyLocation = snapshotValue["PartyLocation"]!
            let partyOrganizer = snapshotValue["PartyOrganizer"]!
            let website = snapshotValue["Website"]!
            
            let party = Party() // using Party class
            
            // using snapshot value and setting them to variable from the Party class
            party.partyName = partyName
            party.userName = userName
            party.partyLocation = partyLocation
            party.partyDate = partyDate
            party.partyOrganizer = partyOrganizer
            party.website = website
            
            // appends elements from snapshot to the partyArray
            self.partyArray.append(party)
            
            // calling configure table row method
            self.configureTableRow()
            
            // reloads tableview data after appending and configuring
            self.partyTableView.reloadData()
            
            
        }
        
        
        
    }
}

