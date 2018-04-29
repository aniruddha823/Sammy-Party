//
//  WebViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var str: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //Error checking to see if the format of the url typed in is acceptable
        if(!str.contains("http") || !str.contains("www") || !str.contains("https"))
        {
            if(str.contains("N/A")){
                let alert = UIAlertController(title: "Alert", message: "This organizer has not entered a website name" , preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
  
        }
        
        //Loading the webpage request
        //  let url = URL(string: "https://www.\(str)")
        let url = URL(string: "\(str)")
        print(url!)
        let request = URLRequest(url: url!)
        webView.load(request)
        print(url!)
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
