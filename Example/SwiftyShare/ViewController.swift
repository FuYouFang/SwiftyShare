//
//  ViewController.swift
//  SwiftyShare
//
//  Created by fuyoufang on 12/09/2020.
//  Copyright (c) 2020 fuyoufang. All rights reserved.
//

import UIKit
import SwiftyShare

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // QQ 1111292720 CCikK9AtEcLkwo16
        
        SwiftyShareManager.shared.regist(platforms: [.Wechat(appid: "", universalLink: "")])
        
//        SwiftyShareManager.shared.share()
        
        debugPrint(NSNotification.Name.UITextViewTextDidBeginEditing)
        
        
        if SwiftyShareManager.shared.isInstalled(platform: .Wechat(appid: "", universalLink: "")) {
            
        } else {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

