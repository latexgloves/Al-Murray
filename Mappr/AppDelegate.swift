//
//  AppDelegate.swift
//  Mappr
//
//  Created by Tom Knighton on 23/09/2017.
//  Copyright © 2017 AroundMe. All rights reserved.
//

import UIKit
import Firebase
import SendBirdSDK
//import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        IQKeyboardManager.sharedManager().disabledTouchResignedClasses = [mainView.self, mainScrollView.self, infoView.self, loginView.self]
//        IQKeyboardManager.sharedManager().disabledDistanceHandlingClasses = [mainView.self, mainScrollView.self, infoView.self, loginView.self]
//        IQKeyboardManager.sharedManager().enable = false
        
        SBDMain.initWithApplicationId("B6A18EB8-11B6-49A3-A462-9D7242C465C5")
        SBDOptions.setUseMemberAsMessageSender(true)
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

