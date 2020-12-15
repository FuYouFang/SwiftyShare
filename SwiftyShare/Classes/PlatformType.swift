//
//  PlatformType.swift
//  FBSnapshotTestCase
//
//  Created by fuyoufang on 2020/12/9.
//

import Foundation

/// 平台类型
public enum RegistPlatform {
    // QQ
    case QQ(appid: String, enableUniveralLink: Bool, universalLink: String)
    // 微信平台
    case Wechat(appid: String, universalLink: String)
    // 新浪微博
    case SinaWeibo
}

extension RegistPlatform {
    var connector: String {
        switch self {
        case .Wechat:
            return "WechatConnector"
        case .QQ:
            return "SShareQQConnector"
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
