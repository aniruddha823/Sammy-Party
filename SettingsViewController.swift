//
//  SettingsViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableArray = ["About Us", "Change User Details", "Add Phone", "Contact Us", "Change Profile Pic"]
    var segueIdentifiers = ["AboutUsSegue", "ChangeUserDetailsSegue", "AddPhoneSegue", "ContactUsSegue", "ChangeProfilePicSegue"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSettings")! as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
    
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


