//
//  ViewController.swift
//  SwiftyShare
//
//  Created by fuyoufang on 12/09/2020.
//  Copyright (c) 2020 fuyoufang. All rights reserved.
//

import UIKit
import SwiftyShare


let QQAppid = "1111292720"
//let QQSecreat = "CCikK9AtEcLkwo16"
let QQEnableUniveralLink = false
let QQUniversalLink = ""
//echo 'ibase=10;obase=16;1111292720' |bc
class LoginViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        // 注册 QQ
        SwiftyShareManager.shared
            .registerQQ(appid: QQAppid,
                        enableUniveralLink: QQEnableUniveralLink,
                        universalLink: QQUniversalLink)
        
    }
    
    func loginWithQQ() {
        
        SwiftyShareManager.shared
            .loginWithQQ(success: { [weak self] (token) in
                debugPrint(token)
            }, failure: { [weak self] in
                debugPrint("失败")
            })
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            loginWithQQ()
        default:
            break
        }
    }
}

