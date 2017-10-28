//
//  mainCalendarView.swift
//  Mappr
//
//  Created by Tom Knighton on 24/10/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class mainCalendarView: UITableViewController {
   
    

    var ref : DatabaseReference!
    let cellID = "cellID"
    var refHandle : UInt!
    
    var eventList = [event]()
    
    
    
    @IBOutlet var tableview: UITableView!
    
    
    
    fileprivate let colors = [UIColor(red: 45.0/255.0, green: 62.0/255.0, blue: 79.0/255.0, alpha: 1.0),
                              UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0),
                              UIColor(red: 141.0/255.0, green: 72.0/255.0, blue: 171.0/255.0, alpha: 1.0),
                              UIColor(red: 241.0/255.0, green: 155.0/255.0, blue: 44.0/255.0, alpha: 1.0),
                              UIColor(red: 234.0/255.0, green: 78.0/255.0, blue: 131.0/255.0, alpha: 1.0),
                              UIColor(red: 80.0/255.0, green: 170.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl?.addTarget(self, action: #selector(self.loadEvents), for: .valueChanged)
        print("before ref")
        loadEvents()
        
   
        
       
        
        
    }
    
    func refresh(sender:AnyObject)
    {
        loadEvents()
        self.refreshControl?.endRefreshing()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if eventList.count == 0 {
            let noEventsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            noEventsLabel.text = "No Events currently, refresh to load current events. Please be aware Al Murray may not have set any events in the near future."
            noEventsLabel.textColor = UIColor.gray
            noEventsLabel.numberOfLines = 99
            noEventsLabel.textAlignment = NSTextAlignment.center
            noEventsLabel.font = UIFont(name: "Asgalt-Regular", size: 25)

            self.tableview.backgroundView = noEventsLabel
            self.tableview.separatorStyle = .none
            
            
            
        }
        
        
        return eventList.count
        
        
    }
    override func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath)->CGFloat
    {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("table view")
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        cell.title.text = eventList[indexPath.row].title
        cell.info.text = eventList[indexPath.row].date
        
        if eventList[indexPath.row].colour == 1 {
            cell.backgroundColor = UIColor(red:0.91, green:0.30, blue:0.24, alpha:1.0)
        }
        
        if eventList[indexPath.row].colour == 2 {
            cell.backgroundColor = UIColor(red:0.95, green:0.77, blue:0.06, alpha:1.0)
        }
        
        if eventList[indexPath.row].colour == 3 {
            cell.backgroundColor = UIColor(red:0.18, green:0.80, blue:0.44, alpha:1.0)
            

        }
        return cell
    }
    
    
    
    @objc func loadEvents() {
        let ref = Database.database().reference()
        self.eventList.removeAll()
        ref.child("events").queryOrderedByKey().observeSingleEvent(of: .value) { (snapshot) in
            let dictionary = snapshot.value as! [String:AnyObject]
            
            for (_, value) in dictionary {
                let eventToShow = event()
                let eventT = value["title"] as? String ?? "Title"
                let eventDe = value["info"] as? String ?? "Info about event"
                let eventDa = value["date"] as? String ?? "Date"
                let eventI = value["importance"] as? Int ?? 3
                
                eventToShow.title = eventT + " - " + eventDa
                eventToShow.date = eventDe
                eventToShow.colour = eventI
                self.eventList.append(eventToShow)
            }
            //self.tableview.reloadData()
        }
        ref.removeAllObservers()
        refreshControl?.endRefreshing()
    }
  
}

    


