//
//  WebViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {
    
    
 
    @IBOutlet weak var wView: WebKitViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://info.sjsu.edu/web-dbgen/catalog/courses/CMPE137.html")
        let request = URLRequest(url: url!)
        wView.load(request)
    }
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

