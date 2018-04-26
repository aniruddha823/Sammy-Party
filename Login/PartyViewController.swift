//
//  SecondViewController.swift
//  Login
//
//  Created by PUNEET TOKHI on 4/15/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit


class PartyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var PastCells: UITableView!
    
    var list = [Party]()
   
    @IBAction func logOutAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PastCells.delegate = self
        PastCells.dataSource = self
        
        //Get From Database ---------------------
        let past = Party(type: "Past", belong: ["Johns SuperBowl Party","Spring Festival","St Patties"])
        let future = Party(type: "Future", belong: ["Before Finals Party","After Finals Party","Sigma Pi"])
        
        
        list.append(past)
        list.append(future)

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].belong.count //we will return database count here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PastCells.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = list[indexPath.section].belong[indexPath.row]
        return cell!
    }
    //header
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].type
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3
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
