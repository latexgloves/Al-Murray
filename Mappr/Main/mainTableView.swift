//
//  mainTableView.swift
//  Mappr
//
//  Created by Tom Knighton on 03/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class mainTableView: UITableViewController {
    
    @IBOutlet weak var amigoPoints: UILabel!
    @IBOutlet weak var positiveDisplay: UILabel!
    @IBOutlet weak var amigoRankDisplay: UILabel!
    @IBOutlet weak var pRankDisplay: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    var userStorage : StorageReference!
    var userData : DatabaseReference!
    
    func loadData() {
        if let userID = Auth.auth().currentUser?.uid {
            userData.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                let aPoints = dictionary?["AmigoPoints"] as? Int ?? 1
                let pPoints = dictionary?["pPoints"] as? Int ?? 1
                let pRank = dictionary?["rank"] as? String ?? "Civillian"
                let aRank = dictionary?["amigoRank"] as? String ?? "Civillian"
                let uName = dictionary?["fullName"] as? String ?? "User Profile"
                
                let refToImage = dictionary?["urToImage"] as? String ?? ""
                
                self.profileImage.sd_setImage(with: URL(string: refToImage), completed: { (image, err, cachetype, url) in
                    logoStatic.userStats.localUserImage = self.profileImage.image!
                })
                
                
                logoStatic.userStats.aPoints = aPoints
                logoStatic.userStats.pPoints = pPoints
                logoStatic.userStats.pRank = pRank
                logoStatic.userStats.aRank = aRank
                logoStatic.userStats.uName = uName

                print("hi")
                
            })
        }
        
        
        
        amigoPoints.text = String(logoStatic.userStats.aPoints)
        positiveDisplay.text = String(logoStatic.userStats.pPoints)
        amigoRankDisplay.text = logoStatic.userStats.aRank
        pRankDisplay.text = logoStatic.userStats.pRank
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userStorage = Storage.storage().reference()
        userData = Database.database().reference()
        
        profileImage.layer.cornerRadius = 60
        profileImage.layer.masksToBounds = true
        

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
