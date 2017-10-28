//
//  moreTableView.swift
//  Mappr
//
//  Created by Tom Knighton on 08/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit

class moreTableView: UITableViewController{
    

    @IBOutlet weak var amigoCell: UITableViewCell!
    @IBOutlet weak var loanCell: UITableViewCell!
    @IBOutlet weak var positveCell: UITableViewCell!
    @IBOutlet weak var manualCell: UITableViewCell!
    @IBOutlet weak var privateCell: UITableViewCell!
    
   
   
   
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        amigoCell.layer.cornerRadius = amigoCell.frame.height / 2
        loanCell.layer.cornerRadius = amigoCell.frame.height / 2
        positveCell.layer.cornerRadius = amigoCell.frame.height / 2
        manualCell.layer.cornerRadius = amigoCell.frame.height / 2
        privateCell.layer.cornerRadius = amigoCell.frame.height / 2
        
        amigoCell.layer.masksToBounds = true
        loanCell.layer.masksToBounds = true
        positveCell.layer.masksToBounds = true
        manualCell.layer.masksToBounds = true
        privateCell.layer.masksToBounds = true

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data sou`srce

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
        
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [0,0] {
            let amigoPA = UIAlertController(title: "Agreement", message: "Please be aware your amigo-ness may be under investigation if you submit more than one amigo points request per 30 days, exceeding this limit may reset your amigo points to 1. This limit does not include Amigo Loans, however you may not request amigo points if you are currently taking out an Amigo Loan. Your request for amigo points will be manually reviewed and if deemed worthy you should recieve your points within 30 working days.", preferredStyle: .alert)
            amigoPA.addAction(UIAlertAction(title: "Proceed", style: .default, handler: nil))
            amigoPA.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(amigoPA, animated: true, completion: nil)
            
            
            
        }
        
        if indexPath == [1,0] {
            let amigoPA = UIAlertController(title: "Agreement", message: "Please be aware you amigo-ness may be under investigation if you submit more than one amigo loan per 30 days, exceeding this limit may temporarily suspend your amigoness. If your loan is accepted, you must wait 60 days before requesting another loan. Amigo loans must be payed back with the current interest rate within 365 days. Your request for an amigo loan will be manually reviewed and if deemed worthy you should recieve your loan within 30 working days.", preferredStyle: .alert)
            amigoPA.addAction(UIAlertAction(title: "Proceed", style: .default, handler: nil))
            amigoPA.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(amigoPA, animated: true, completion: nil)
        }
        
        if indexPath == [2,0] {
            let amigoPA = UIAlertController(title: "Agreement", message: "Please be aware your positivity may be under investigation if you submit more than one positivityness request per 30 days, exceeding this limit may reset your positvity points to 1. If you have recieved an amigo loan recently your application for positvity will be denied.\n \n REQUESTING POSITVITY POINTS IS ONLY AVALIABLE TO THOSE WHO ARE POP 2 OR LOWER \n \n Your request for positivity points will be manually reviewed and if deemed worthy you should recieve your points within 30 working days.", preferredStyle: .alert)
            amigoPA.addAction(UIAlertAction(title: "Proceed", style: .default, handler: nil))
            amigoPA.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(amigoPA, animated: true, completion: nil)
        }
        
        if indexPath == [3,0] {
            let amigoPA = UIAlertController(title: "Agreement", message: "If you click 'proceed', your account will be placed under temporary special measures and a SPOPIT and a Sénor Amigo will manually review your account and points. Requesting this more than once every 90 days may possibly result in a complete reset of Amigoness and Positivty, as per Al Murray.", preferredStyle: .alert)
            amigoPA.addAction(UIAlertAction(title: "Proceed", style: .default, handler: nil))
            amigoPA.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(amigoPA, animated: true, completion: nil)
        }
        
        if indexPath == [4,0] {
            let amigoPA = UIAlertController(title: "Agreement", message: "If you have any information on wanted individuals, negative individuals, or want to report a lack of amigoiness, click 'proceed'. Alternatively, if you would like to commend someone, this is also the place to do it.", preferredStyle: .alert)
            amigoPA.addAction(UIAlertAction(title: "Proceed", style: .default, handler: nil))
            amigoPA.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(amigoPA, animated: true, completion: nil)
        }
       
    }
    

}
