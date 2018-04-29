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
    var myIndex = 0
    var webStr: String = ""
    @IBAction func logOutAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        performSegue(withIdentifier: "logOutSegue", sender: self)
        
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
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
         webStr = "\(partyArray[indexPath.row].website)"
        myIndex = indexPath.row
        performSegue(withIdentifier: "webSegue", sender: self)
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
        
    //     cell.selectionStyle = .none
        
         
        cell.partyName.text = "\(partyArray[indexPath.row].partyName)"
        cell.organizerName.text = "\(partyArray[indexPath.row].partyOrganizer)"
        cell.dateAndTime.text = "\(partyArray[indexPath.row].partyDate)"
        cell.locationLabel.text = "\(partyArray[indexPath.row].partyLocation)"
        cell.postedBy.text = "\(partyArray[indexPath.row].userName)"
        cell.website.text = "\(partyArray[indexPath.row].website)"
       
        return cell
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "webSegue"){
            let webView = segue.destination as! WebViewController
            
            webView.str = webStr
        }
    }
    
    func configureTableRow(){
        
        partyTableView.estimatedRowHeight = UITableViewAutomaticDimension
        partyTableView.rowHeight = 230.0
        
    }
    
    func retrieveMessages(){
        
        let partiesDB = Database.database().reference().child("Party")
        
        partiesDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            let partyName = snapshotValue["PartyName"]!
            let userName = snapshotValue["Sender"]!
            let partyDate = snapshotValue["PartyDate"]!
            let partyLocation = snapshotValue["PartyLocation"]!
            let partyOrganizer = snapshotValue["PartyOrganizer"]!
            let website = snapshotValue["Website"]!
            
            let party = Party()
            
            party.partyName = partyName
            party.userName = userName
            party.partyLocation = partyLocation
            party.partyDate = partyDate
            party.partyOrganizer = partyOrganizer
            party.website = website
            
            self.partyArray.append(party)
            self.configureTableRow()
            self.partyTableView.reloadData()
            
            
        }
        
        
        
    }
}

