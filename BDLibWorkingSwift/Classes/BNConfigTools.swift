//
//  WBConfigTools.swift
//  WBLib
//
//  Created by Bingo on 2019/6/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation
import UIKit

enum AppCode {
    case AppCodeByDefault /* 原生  */
    case AppCodeByWB      /* web  */
    case AppCodeBySF     /* sf  */
    
    var year: Int {
        switch self {
        case .AppCodeByDefault: return 2019
        case .AppCodeByWB: return 2020
        case .AppCodeBySF: return 2021
        }
    }
}


let kDeviceStatusHeight = UIApplication.shared.statusBarFrame.size.height
let kDeviceWidth = UIScreen.main.bounds.size.width
let kDeviceHeight = UIScreen.main.bounds.size.height
let kDeviceNavHeight = UIApplication.shared.statusBarFrame.size.height + 44


