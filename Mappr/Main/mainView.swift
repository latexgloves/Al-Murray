//
//  mainView.swift
//  Mappr
//
//  Created by Tom Knighton on 28/09/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import Firebase
import SendBirdSDK

class mainView: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var userName: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userName.title = logoStatic.userStats.uName
        
        SBDMain.connect(withUserId: "tomknighton", completionHandler: { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
      
            print("hi")
            UserDefaults.standard.set(SBDMain.getCurrentUser()?.nickname, forKey: "chatUserName")
            UserDefaults.standard.set(SBDMain.getCurrentUser()?.userId, forKey: "chatUserID")
        })

        
        
    }

    
    
    
    
   
    
    
}
