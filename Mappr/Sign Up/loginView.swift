//
//  loginView.swift
//  Mappr
//
//  Created by Tom Knighton on 25/09/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import TextFieldEffects
import Firebase



class loginView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logoText: UIImageView!
    @IBOutlet weak var loginTexr: UILabel!
    @IBOutlet weak var nameField: KaedeTextField!
    @IBOutlet weak var passwordField: KaedeTextField!
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    
    var keyboardAdjusted = false
    var lastKeyboardOffset: CGFloat = 0.0
    var shouldStatusHide = false
    var originalY : CGFloat = 0
    var originalBY : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        passwordField.delegate = self
        
        
        
        
        signInButton.layer.cornerRadius = signInButton.frame.height / 2
        originalY = fieldsView.frame.origin.y
        originalBY = signInButton.frame.origin.y
        nameField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        nameField.layer.masksToBounds = true
        passwordField.layer.masksToBounds = true
        hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if keyboardAdjusted == false {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                UIView.animate(withDuration: 2, animations: {
                    let keyboardHeight = keyboardSize.height
                    self.keyboardAdjusted = true
                    self.logoText.isHidden = true
                    self.loginTexr.isHidden = true
                    self.fieldsView.frame.origin.y = keyboardHeight - 70
                    self.shouldStatusHide = true
                    self.setNeedsStatusBarAppearanceUpdate()
                })
                
            }
            
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
    
        keyboardAdjusted = false
        logoText.isHidden = false
        loginTexr.isHidden = false
        self.fieldsView.frame.origin.y = originalY
        shouldStatusHide = false
        setNeedsStatusBarAppearanceUpdate()
        
    }
   
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        keyboardAdjusted = false
        logoText.isHidden = false
        loginTexr.isHidden = false
        self.fieldsView.frame.origin.y = originalY
        shouldStatusHide = false
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if nameField.hasText == false || passwordField.hasText == false {
            let textError = UIAlertController(title: "Error", message: "Please enter your full name and Password", preferredStyle: .alert)
            textError.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(textError, animated: true, completion: nil)
        }
        
        else {
            Auth.auth().signIn(withEmail: passwordField.text!, password: nameField.text!, completion: { (user, error) in
                if error != nil {
                    if let errCode = AuthErrorCode(rawValue: error!._code) {
                        switch errCode {
//                        case .invalidEmail:
//                            let authError = UIAlertController(title: "Error", message: "Whoops! Al Murray detects your email is invalid!", preferredStyle: .alert)
//                            authError.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                            self.present(authError, animated: true, completion: nil)
                        
                        case .wrongPassword:
                            let authError = UIAlertController(title: "Error", message: "Whoops! Al Murray detects your password is wrong!", preferredStyle: .alert)
                            authError.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(authError, animated: true, completion: nil)
                            
                        case .networkError:
                            let authError = UIAlertController(title: "Error", message: "Whoops! Al Murray needs you to have an internet connection to log in!" , preferredStyle: .alert)
                            authError.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(authError, animated: true, completion: nil)
                            
                        case .userNotFound:
                            let authError = UIAlertController(title: "Error", message: "Whoops! Al Murray can't find your profile!", preferredStyle: .alert)
                            authError.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(authError, animated: true, completion: nil)
                        default:
                            print(error!.localizedDescription)
                    }
                }
                }
                
                else {
                    print("Logged in")
                    self.performSegue(withIdentifier: "loginToMain", sender: self)
                }
            })
        }
        
    }
    
    

    
 

  

}

//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//        keyboardAdjusted = false
//        logoText.isHidden = false
//        loginTexr.isHidden = false
//        self.fieldsView.frame.origin.y = originalY
//        shouldStatusHide = false
//        setNeedsStatusBarAppearanceUpdate()
//    }
//}

