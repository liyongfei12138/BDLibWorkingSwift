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
    
    let myView = UIWebView(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight ))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.from(color: UIColor.clear), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.setsh
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        
//        myView.delegate = self
       self.myView.backgroundColor = UIColor.white
       self.view.addSubview(self.myView)
        
        let url = URL(string: self.urlString)
        let request = URLRequest.init(url: url!, cachePolicy: URLRequest.CachePolicy(rawValue: 1)!, timeoutInterval: 30)
        
        self.myView.loadRequest(request)
    }
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        self.view.makeToastActivity(.center)
//    }
//
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        self.view.hideToastActivity()
//    }
//    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
//        self.view.hideToastActivity()
//        var style = ToastStyle()
//        style.messageFont = UIFont(name: "Zapfino", size: 14.0)!
////        style.messageColor =
//        style.messageColor = UIColor.black
//        style.messageAlignment = .center
//        style.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 0.3)
//
//        self.view.makeToast("请求地址错误，请重试", duration: 3.0, position: .bottom, style: style)
//    }
}
