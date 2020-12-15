//
//  SwiftyShareManager+QQ.swift
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/12.
//

import Foundation

// 嵌套结构体
private struct AssociatedKeys {
    static var QQConnector = "QQConnectorKey"
}

extension SwiftyShareManager {

    var qqConnector: SShareQQConnector? {
        get {
            guard let container = objc_getAssociatedObject(self, &AssociatedKeys.QQConnector) as? SShareQQConnector else {
                return nil
            }
            return container
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.QQConnector, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    public func registerQQ(appid: String, enableUniveralLink: Bool, universalLink: String) {
        let qqConnector: SShareQQConnector
        if self.qqConnector != nil {
            qqConnector = self.qqConnector!
        } else {
            qqConnector = SShareQQConnector()
            self.qqConnector = qqConnector
        }
        qqConnector.regist(appid,
                           enableUniveralLink: enableUniveralLink,
                           universalLink: universalLink)
    }
    
    // 调用 SDK 登录
    public func loginWithQQ(success: @escaping (_ token: String) -> Void,
                            failure: @escaping () -> Void) {
        getPermissions(permissions: [QQPermission.getSimpleUserInfo], success: success, failure: failure)
    }
    
    // 设置应用需要用户授权的API列表
    public func getPermissions(permissions: [QQPermission],
                               success: @escaping (_ token: String) -> Void,
                               failure: @escaping () -> Void) {
        guard let qqConnector = self.qqConnector else {
            return
        }
        
        qqConnector.authorize(permissions.map { SShareQQConnector.getKeyFromPermission($0.rawValue) }, success: success, failure: failure)
    }
}
