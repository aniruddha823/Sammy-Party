//
//  AboutUsWebViewViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/29/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit
import WebKit


class AboutUsWebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://github.com/aniruddha823/Sammy-Party")
        let request = URLRequest(url: url!)
        webView.load(request)

        // Do any additional setup after loading the view.
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
