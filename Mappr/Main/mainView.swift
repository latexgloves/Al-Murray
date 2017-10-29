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
        
        SBDMain.initWithApplicationId("B6A18EB8-11B6-49A3-A462-9D7242C465C5")
        SBDMain.connect(withUserId: "tomknighton", completionHandler: { (user, error) in
            
        })

        
        
    }

    
    
    
    
   
    
    
}
