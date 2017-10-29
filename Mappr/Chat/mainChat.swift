//
//  mainChat.swift
//  Mappr
//
//  Created by Tom Knighton on 29/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit

class mainChat: UIViewController {
    @IBOutlet weak var usernameNav: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameNav.title = UserDefaults.standard.value(forKey: "chatUserName") as? String
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
