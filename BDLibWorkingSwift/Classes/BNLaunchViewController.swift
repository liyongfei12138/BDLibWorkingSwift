//
//  WBLaunchViewController.swift
//  WBLib
//
//  Created by Bingo on 2019/6/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BNLaunchViewController: UIViewController {

    
    let imageView = UIImageView()
    var launchImage = UIImage()
    let viewSize:CGSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.white

        let dict = Bundle.main.infoDictionary

        
        if let info = dict {
            
            if info["UILaunchImages"] != nil{
                let imagesArr:Array<Dictionary<String,Any>> = info["UILaunchImages"] as! Array
                
                for items:Dictionary<String,Any> in imagesArr
                {
                    
                    self.launchImage =  UIImage(named:  items["UILaunchImageName"] as! String )!
                    
                }
            }
            
            
          
        }
        
        if self.launchImage.size == CGSize(width: 0, height: 0){
            
            let story:UIStoryboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
            
            let launchVC:UIViewController = story.instantiateInitialViewController() ?? UIViewController()
            
            self.launchImage = self.getImageFromView(view: launchVC.view)
            
            
            
        }else{
            
        }
        
        

        self.imageView.frame = CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight)
        
        self.imageView.isUserInteractionEnabled = true
        self.imageView.image = self.launchImage
        self.view.addSubview(self.imageView)
        
        // Do any additional setup after loading the view.
    }
   
    //MARK: - uiview转uiimage
     func getImageFromView(view: UIView) -> UIImage {
        // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        view.layer.render(in: context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
   
}
