//
//  ViewController.swift
//  Login
//
//  Created by Paramjot Bhatia on 4/14/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

//import statements and Firebase for sign in
import UIKit
import Firebase

//Google Sign in
class ViewController: UIViewController, GIDSignInUIDelegate {
    
    
    @IBOutlet var nextButton: UIButton!
    
    
    // Google Sign in
//    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().signInSilently()
        //logo.image = UIImage(named: "Unknown.png")
        button.setTitle("", for: .normal)
        
  //      GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().uiDelegate = self
        self.nextButton.isHidden = true
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    //if user signs in sucessfully, this is what happens
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if error != nil {
            // ...
            return
        }
            
        else{
            print("signed in")
            self.nextButton.isHidden = false
       //     self.performSegue(withIdentifier: "toHomeScreen", sender: self)
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

