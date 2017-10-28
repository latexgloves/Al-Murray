//
//  Calendar.swift
//  Mappr
//
//  Created by Tom Knighton on 27/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit

class Calendar: UIViewController {
    
    @IBOutlet weak var info : UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    @IBAction func infoPressed(_ sender: Any) {
        print("1")
        
    }
    
    @IBAction func infoBPressed(_ sender: Any) {
        let infoP = UIAlertController(title: "Info", message: "The upcoming events are colour coded, \n\n red = very important, mandatory to attend \n\n yellow = mild importance \n\n green = low importance, general messages.", preferredStyle: .alert)
        
        infoP.addAction(UIAlertAction(title: "Understood", style: .default, handler: nil))
        self.present(infoP, animated: true,completion: nil)
    }
    

}
