//
//  WBMyViewController.swift
//  WBLibDemo
//
//  Created by Bingo on 2019/6/19.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BNMyViewController: UIViewController ,UIWebViewDelegate{


    var urlString = String()
    var progressView = BNProgressView(frame: CGRect(x: 0, y: kDeviceStatusHeight, width: kDeviceWidth, height: 4))
    
    let myView = UIWebView(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight ))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.from(color: UIColor.clear), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.setsh
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

       self.myView.backgroundColor = UIColor.white
        self.myView.delegate = self
       self.view.addSubview(self.myView)
        
        let url = URL(string: self.urlString)
        let request = URLRequest.init(url: url!, cachePolicy: URLRequest.CachePolicy(rawValue: 1)!, timeoutInterval: 30)
        
        self.myView.loadRequest(request)
        
        self.myView.addSubview(self.progressView)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
      
        
     
       self.progressView.beginLoad()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
 
         self.progressView.finishLoad()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.progressView.hideView()
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        
         self.progressView.hideView()
      
        return true
    }
}
