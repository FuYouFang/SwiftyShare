//
//  QQPermission.swift
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/15.
//

import Foundation

// 需要用户授权的 API 类型
@objc public enum QQPermission: Int {
    case getUserInfo = 0
    case getSimpleUserInfo
    case addAlbum
    case addTopic
    case checkPageFans
    case getInfo
    case getOtherInfo
    case listAlbum
    case uploadPic
    case getVipInfo
    case getVipRichInfo
}

extension QQPermission {
    
}
