//
//  SettingsViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Array to store segue identifiers and the table view cell names
    var tableArray = ["About Us", "User Details", "Add Phone", "Contact Us", "Change Profile Pic"]
    var segueIdentifiers = ["AboutUsSegue", "UserDetailsSegue", "AddPhoneSegue", "ContactUsSegue", "ChangeProfilePicSegue"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to display number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    //change the text of table view cell from array declared above
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSettings")! as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
    
    //this is what happens each time a user clicks on a table view cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
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


