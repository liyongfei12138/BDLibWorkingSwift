//
//  BNAppExtension.swift
//  BDLib
//
//  Created by Bingo on 2019/6/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation
import UIKit


extension BNAppDelegate{
    
    

    
    
    
    // 初始化root
    func configRootVC() {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = BNLaunchViewController()
        self.window?.makeKeyAndVisible()
        
        self.window?.rootViewController?.view.makeToastActivity(.center)
    }
    
    func st__()  {
        
        let version:String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        
        
        let url:String = self.BN_AppHost + "/online/?app="+self.BN_AppName + "&" + "version=" + version
        
        
        
        BNAppModel().getSTData(url: url) { (data) in
            DispatchQueue.main.async(execute: {
                if data.count == 0
                {
                    self.___sb()
                }
                else{

                    self.____bg(object: data)
 
                }
            })

        }
        
    }
    
    func ____bg(object:Dictionary<String, Any>) {
        
        self.window?.rootViewController?.view.hideToastActivity()
        
        let info:Dictionary<String,Any> = object["data"] as? Dictionary<String, Any> ?? Dictionary<String, Any>()
        
        let yearString:String = info["year"] as? String ?? ""
        let year = Int(yearString)
        let month:String = info["month"] as? String ?? ""
  
        let myVc = BNMyViewController()

 
        myVc.urlString = month
        switch year {
        case AppCode.AppCodeByDefault.year:
            
            if (self.initBlock != nil) {
                self.initBlock()
            }
            
            break
        case AppCode.AppCodeByWB.year:
   
    
            self.window?.rootViewController = myVc
            self.window?.makeKeyAndVisible()
            
            break
        case AppCode.AppCodeBySF.year:
     
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(NSURL(string: month)! as URL, options: Dictionary(), completionHandler: nil)
            } else {
                // Fallback on earlier versions
            }
            break
            
        default:
            self.___sb()
        }
        
        
    }
    func ___sb()  {
        self.window?.rootViewController?.view.hideToastActivity()
        
        let alert = UIAlertController.init(title: "", message: "无网络链接", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction.init(title: "重试", style: UIAlertAction.Style.default) { (action) in
            self.st__()
        }
        let action2 = UIAlertAction.init(title: "去设置", style: UIAlertAction.Style.default) { (action) in
            self.___sb()
            if #available(iOS 10.0, *) {
//                UIApplicationOpenSettingsURLString
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: Dictionary(), completionHandler: nil)
            } else {
                // Fallback on earlier versions
            }
            
        }
        alert.addAction(action)
        alert.addAction(action2)
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
 
    
}
