//
//  PlatformType.swift
//  FBSnapshotTestCase
//
//  Created by fuyoufang on 2020/12/9.
//

import Foundation

/// 平台类型
public enum RegistPlatform {
    // 新浪微博
    case SinaWeibo
    // 微信平台
    case Wechat(appid: String, universalLink: String)
    // QQ
    case QQ
}


extension RegistPlatform {
    var connector: String {
        switch self {
        case .Wechat:
            return "WechatConnector"
        default:
            return ""
        }
    }
}


/// 分享平台类型
public enum SharePlatform {
    // 新浪微博
    case SinaWeibo
    // QQ空间
    case QZone
    // 微信平台
    case Wechat
    // QQ平台
    case QQ
    
}
