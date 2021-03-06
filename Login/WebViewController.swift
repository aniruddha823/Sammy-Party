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
        //Checking to see if the url does not contain http, www, or https
        if(!str.contains("http") || !str.contains("www") || !str.contains("https"))
        {
            //if the url contains "N/A"
            if(str.contains("N/A")){
                let alert = UIAlertController(title: "Alert", message: "This organizer has not entered a website name" , preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            //if the url contains http, www, or https
            else if(str.contains("http") || str.contains("www") || str.contains("https")){
                let alert = UIAlertController(title: "Alert", message: "Invalid URL Format: \(str)" , preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            //else append prefix    
            else
            {
                str = "https://www." + str
            }
            
        }
        
        
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
