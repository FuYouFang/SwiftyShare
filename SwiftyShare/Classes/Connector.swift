//
//  Connector.swift
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/10.
//

import Foundation

// 微信平台
protocol WechatConnectorType {
    static func register(appid: String, universalLink: String)
}

// QQ
protocol QQConnectorType {
    static func register(appid: String, enableUniveralLink: Bool, universalLink: String)
}

// 新浪微博
protocol SinaWeiboConnectorType {
    static func register(appid: String, enableUniveralLink: Bool, universalLink: String)
}
