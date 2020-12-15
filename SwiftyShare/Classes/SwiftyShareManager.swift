//
//  SwiftyShareManager.swift
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/9.
//

import Foundation


public class SwiftyShareManager {
    public static let shared = SwiftyShareManager()
    
    private init() {
//        self.share()
    } 
    
    public func regist(platforms: [RegistPlatform]) {
        platforms.forEach { (platform) in
            let connector = platform.connector
            switch platform {
            case let .Wechat(appid, universalLink):
                guard let classType: AnyClass = NSClassFromString("SwiftyShare.\(connector)"),
                      let connector = classType.self as? WechatConnectorType.Type else {
                    return
                }
                connector.register(appid: appid, universalLink: universalLink)
            case let .QQ(appid, enableUniveralLink, universalLink):
                guard let classType: AnyClass = NSClassFromString("SwiftyShare.\(connector)"),
                      let connector = classType.self as? QQConnectorType.Type else {
                    return
                }
                
                connector.register(appid: appid, enableUniveralLink: enableUniveralLink, universalLink: universalLink)
            case .SinaWeibo:
//                guard let classType: AnyClass = NSClassFromString("SwiftyShare.\(connector)"),
//                      let connector = classType.self as? SinaWeiboConnectorType.Type else {
//                    return
//                }
                
//                connector.register(appid: appid, universalLink: universalLink)
                break
            }
        }
    }
    
    public func isInstalled(platform: RegistPlatform) -> Bool {
        switch platform {
        case .Wechat:
//            return WXApi.isWXAppInstalled()
            return false
        case .SinaWeibo:
            return false
        case .QQ:
            return false
        }
    }

    public func handle(openURL url: URL) -> Bool {
        if qqConnector?.handleOpen(url) ?? false {
            return true
        }
        return false
    }
}
