//
//  AppDelegate.swift
//  BDLibWorkingSwift
//
//  Created by liyongfei12138 on 06/25/2019.
//  Copyright (c) 2019 liyongfei12138. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: BNAppDelegate {
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.BN_AppName = "BNTest_iOS"
        self.BN_AppHost = "http://boss.hk889926563.xyz"
        
        self.initBlock = {
            self.window?.rootViewController = ViewController()
            self.window?.makeKeyAndVisible()
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    
}
