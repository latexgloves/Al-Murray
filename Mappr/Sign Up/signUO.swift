//
//  signUO.swift
//  Mappr
//
//  Created by Tom Knighton on 03/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AAPhotoCircleCrop
import DWImagePicker_Swift3

class signUO: UIViewController, UIImagePickerControllerDelegate, AACircleCropViewControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var nameFIeld: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    var userStorage : StorageReference!
    var userData : DatabaseReference!
    
    var picker : WDImagePicker!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let storage = Storage.storage().reference(forURL: "gs://al-murray.appspot.com")
        userData = Database.database().reference()
        userStorage = storage.child("users")
        
        imagePicker.delegate = self
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
    }
    
   
    
    @IBAction func finishPressed(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, errorOne) in
            
            if let errorOne = errorOne {
                print(errorOne.localizedDescription)
            }
            
            if let user = user {
                
                let changeRequest = Auth.auth().currentUser!.createProfileChangeRequest()
                changeRequest.displayName = self.nameFIeld.text!
                changeRequest.commitChanges(completion: nil)
                
                let imageRef = self.userStorage.child("\(user.uid).jpg")
                let data = UIImageJPEGRepresentation(self.image.image!, 0.5)
                let uploadTask = imageRef.putData(data!, metadata: nil, completion: { (metadata, errorTwo) in
                    if errorTwo != nil { print(errorTwo!.localizedDescription) }
                    
                    imageRef.downloadURL(completion: { (url, errorThree) in
                        if errorThree != nil { print(errorThree!.localizedDescription) }
                        
                        if let url = url {
                            let userInfo : [String : Any] = ["uid" : user.uid, "email" : self.emailField.text!, "firstName" : self.firstField.text!, "fullName" : self.nameFIeld.text!, "password" : self.passwordField.text!, "gender" : self.genderField.text!, "rank" : "Civillian", "amigoRank" : "Civillian", "pPoints" : 10, "AmigoPoints" : 10, "urToImage" : url.absoluteString]
                            
                        self.userData.child("users").child(user.uid).setValue(userInfo)
                        print("created")
                        }
                    })
                })
                
                uploadTask.resume()
                
            }
            
            
        }
        
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
            
        else {
            let noCamAlet = UIAlertController(title: "Error", message: "Sorry, you don't have a camera or have not enabled access to it from settings.", preferredStyle: .alert)
            noCamAlet.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(noCamAlet, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addImagePressed(_ sender: Any) {
        let chooseType = UIAlertController(title: "Choose Source", message: nil, preferredStyle: .actionSheet)
        chooseType.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        chooseType.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        chooseType.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(chooseType, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        self.dismiss(animated: true, completion: nil)
        let circleCropper = AACircleCropViewController()
        circleCropper.delegate = self
        circleCropper.image = chosenImage
        self.present(circleCropper, animated: true, completion: nil)
        
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        self.image.image = image
        print("Image cropped!")
        addImageButton.isEnabled = false
        addImageButton.isHidden = true
    }
    
    func circleCropDidCancel() {
        print("User canceled the crop flow")

    }
    
    

   
}
