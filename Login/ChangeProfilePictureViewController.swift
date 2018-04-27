//
//  ChangeProfilePictureViewController.swift
//  Login
//
//  Created by Dominic on 4/26/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

class ChangeProfilePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var profilePic: UIImageView!
    
    
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
        profilePic.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
