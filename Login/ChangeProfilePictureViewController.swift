//
//  ChangeProfilePictureViewController.swift
//  Login
//
//  Created by Dominic on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

class ChangeProfilePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GIDSignInDelegate {
   
    // Upload button
    @IBOutlet weak var uploadImageButton: UIButton!
    
    // UIimage view of a profile picture
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        
        // URL of potential image
        let profilePicURL = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 175)
        
        // if image exists...
        if(profilePicURL != nil)
        {
            // set the image as the profile picture
            self.profilePic.image = UIImage(data: NSData(contentsOf: profilePicURL!)! as Data)
        }
            
        else{
            // else use the default picture
            print("No image")
        }
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
       
        
        
    }
    
    @IBAction func UploadImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker,animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        profilePic.clipsToBounds = true
        profilePic.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

}
