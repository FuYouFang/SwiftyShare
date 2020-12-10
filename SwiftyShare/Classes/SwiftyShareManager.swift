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
                      let connector = classType.self as? Connector.Type else {
                    return
                }
                
                connector.register(appid: appid, universalLink: universalLink)
            case .QQ:
                break
            case .SinaWeibo:
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

}
