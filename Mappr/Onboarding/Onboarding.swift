//
//  Onboarding.swift
//  Mappr
//
//  Created by Tom Knighton on 23/09/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import paper_onboarding

class Onboarding: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate{
    
    @IBOutlet var onboardingView: PaperOnboarding!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.delegate = self
        onboardingView.dataSource = self
     
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1) //106 166 211
        let backgroundColorTwo = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1) // 168 200 78
        let backgroundColorThree = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1) //217/255 72/255 89/255
        
        let titleFont = UIFont(name: "Helvetica-Bold", size: 24)!
        let descirptionFont = UIFont(name: "Helvetica", size: 18)!
        
        return [("OBLOC", "On Location", "Somewhere special? Make sure all your friends know! As well as uploading memories, upload pictures of your location for all your friends to see, whether it be Rainy London, Sunny Ibiza or just your back yard!", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descirptionFont),
                
                ("OBCHAT", "Make Friends", "Discover people near you! See a list of all users around you, see their profile and locations, and even chat with them!", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descirptionFont),
                
                ("OBFLAME", "Make Frenemies", "Not only can you chat with people near you, you can compete against them too! Discover local leaderboards and try to top them!", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descirptionFont)][index]
        
        
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
    }
    
    

}


