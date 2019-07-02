//
//  BNProgressView.swift
//  BDLib
//
//  Created by Bingo on 2019/7/2.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BNProgressView: UIView {

    var loadView : UIView!
    
    
     override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
      self.configUi()
        
        
    }
    
    func configUi()  {
        self.loadView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: frame.size.height))
        self.loadView.backgroundColor = UIColor(red: 28/255.0, green: 167/255.0, blue: 252/255.0, alpha: 0.5)
        self.loadView.clipsToBounds = true
        self.loadView.layer.cornerRadius = frame.size.height / 2
        self.addSubview(self.loadView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func beginLoad()  {
        self.isHidden = false
        
//        let basic:CABasicAnimation=CABasicAnimation.init()
//
//        basic.keyPath = "frame.width"
//
//        basic.fromValue = 0;
//        basic.toValue =  self.frame.size.width * 0.3;
//        basic.duration = 0.3
        

        
        UIView.animate(withDuration: 0.6) {
            self.loadView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width * 0.3, height: self.frame.size.height)
        }
        UIView.animate(withDuration: 4) {
            self.loadView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width * 0.75, height: self.frame.size.height)
        }
        UIView.animate(withDuration: 5) {
            self.loadView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width * 0.9, height: self.frame.size.height)
        }
    }
    
    @objc func finishLoad()  {
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.loadView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width , height: self.frame.size.height)
        }) { (comp) in
            if comp{
                self.hideView()
            }
        }
    }
    @objc func hideView()
    {
        self.isHidden = true
        
        self.loadView.frame = CGRect(x: 0, y: 0, width: 0 , height: self.frame.size.height) 
    }
}
