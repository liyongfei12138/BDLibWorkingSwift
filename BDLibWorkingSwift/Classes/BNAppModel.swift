//
//  BNAppModel.swift
//  BDLib
//
//  Created by Bingo on 2019/6/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BNAppModel: NSObject {

    typealias SuccessBlock = (_ data:Dictionary<String,Any>)->()

    
    
    func getSTData(url:String,dataBlock:@escaping SuccessBlock)  {
        
        let url = URL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            
            if let data = data {
                
                
                let info:Dictionary<String,Any> = self.dataToDictionary(data: data) ?? Dictionary<String,Any>()
   
                let code:Int = info["code"] as? Int ?? 0
                
                
                
                if code == 200{
                   
                    dataBlock(info)
                    
                }else{
                    dataBlock(Dictionary<String,Any>())
                    
                }
                
                
            }else {
                
             dataBlock(Dictionary<String,Any>())
            }
        }
        dataTask.resume()
    }
        




    func dataToDictionary(data:Data) ->Dictionary<String, Any>?{
        
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let dic = json as! Dictionary<String, Any>
            return dic
        }catch{
         
            return Dictionary<String, Any>()
        }

    }
    

}
