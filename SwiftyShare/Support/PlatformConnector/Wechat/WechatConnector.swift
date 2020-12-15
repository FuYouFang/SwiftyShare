//
//  WechatConnector.swift
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/10.
//

import Foundation
//#if canImport(libWeChatSDK)
//import libWeChatSDK
//#endif

public class WechatConnector: WechatConnectorType {
    
    static func register(appid: String, universalLink: String) {
        if WXApi.registerApp(appid, universalLink: universalLink) {
            debugPrint("注册微信成功")
        } else {
            debugPrint("注册微信失败")
        }
    }
}
