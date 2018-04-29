//
//  SecondViewController.swift
//  Login
//
//  Created by PUNEET TOKHI on 4/15/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import Firebase

class PartyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var partyTableView: UITableView!
    
    //  var list = [Party]()
    
    var partyArray : [Party] = [Party]()
    
    @IBAction func logOutAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partyTableView.delegate = self
        partyTableView.dataSource = self
        
        // to register xib file
        
        partyTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        retrieveMessages()
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return list[section].belong.count //we will return database count here
        
        return partyArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = PastCells.dequeueReusableCell(withIdentifier: "cell")
        //        cell?.textLabel?.text = list[indexPath.section].belong[indexPath.row]
        //        return cell!
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
         cell.selectionStyle = .none
 
         
        cell.partyName.text = "Party Name: \(partyArray[indexPath.row].partyName)"
        cell.organizerName.text = "Organized By: \(partyArray[indexPath.row].partyOrganizer)"
        cell.dateAndTime.text = "Date: \(partyArray[indexPath.row].partyDate)"
        cell.locationLabel.text = "Location: \(partyArray[indexPath.row].partyLocation)"
        cell.postedBy.text = "Posted By: \(partyArray[indexPath.row].userName)"
        
        return cell;
    }
    
    func configureTableRow(){
        
        partyTableView.estimatedRowHeight = UITableViewAutomaticDimension
        partyTableView.rowHeight = 230.0
        
    }
    
    func retrieveMessages(){
        
        let partiesDB = Database.database().reference().child("Parties")
        
        partiesDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            let partyName = snapshotValue["PartyName"]!
            let userName = snapshotValue["Sender"]!
            let partyDate = snapshotValue["PartyDate"]!
            let partyLocation = snapshotValue["PartyLocation"]!
            let partyOrganizer = snapshotValue["PartyOrganizer"]!
            
            let party = Party()
            
            party.partyName = partyName
            party.userName = userName
            party.partyLocation = partyLocation
            party.partyDate = partyDate
            party.partyOrganizer = partyOrganizer
            
            self.partyArray.append(party)
            self.configureTableRow()
            self.partyTableView.reloadData()
            
            
        }
        
        
        
    }
}

