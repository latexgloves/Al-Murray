//
//  logoStatic.swift
//  Mappr
//
//  Created by Tom Knighton on 24/09/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import RevealingSplashView
import Firebase


class logoStatic: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    
    var userStorage : StorageReference!
    var userData : DatabaseReference!
    
    public struct userStats {
        static var aPoints = 1
        static var pPoints = 1
        static var pRank = "Civillian"
        static var aRank = "Civillian"
        static var uName = "User Profile"
        static var localUserImage = UIImage()
    }
    
    func loadData() {
        if let userID = Auth.auth().currentUser?.uid {
            userData.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                let aPoints = dictionary?["AmigoPoints"] as? Int ?? 1
                let pPoints = dictionary?["pPoints"] as? Int ?? 1
                let pRank = dictionary?["rank"] as? String ?? "Civillian"
                let aRank = dictionary?["amigoRank"] as? String ?? "Civillian"
                let uName = dictionary?["fullName"] as? String ?? "User Profile"

                userStats.aRank = aRank
                userStats.pRank = pRank
                userStats.aPoints = aPoints
                userStats.pPoints = pPoints
                userStats.uName = uName
               
                print("hi")
                
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userData = Database.database().reference()
        userStorage = Storage.storage().reference()
        loadData()
        let revealer = RevealingSplashView(iconImage: #imageLiteral(resourceName: "logostatic"), iconInitialSize: CGSize(width: 343, height: 184), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:0.0))

        self.view.addSubview(revealer)
        
        logo.isHidden = true
        revealer.startAnimation(){
            self.performSegue(withIdentifier: "toSignIn", sender: self)
        }
        
//        let fontFamilyNames = UIFont.familyNames
//        for familyName in fontFamilyNames {
//            print("------------------------------")
//            print("Font Family Name = [\(familyName)]")
//            let names = UIFont.fontNames(forFamilyName: familyName)
//            print("Font Names = [\(names)]")
//        }
    }

    
    

}
