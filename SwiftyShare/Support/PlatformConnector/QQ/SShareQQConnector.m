//
//  QQConnector.m
//  SShareQQConnector
//
//  Created by fuyoufang on 2020/12/10.
//

#import "SShareQQConnector.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface SShareQQConnector ()<TencentSessionDelegate>

@property (nonatomic, strong) TencentOAuth* auth;
@property (nonatomic, copy) SShareQQAuthorizeSuccess authorizeSuccess;
@property (nonatomic, copy) SShareQQAuthorizeFailure authorizeFailure;

@end

@implementation SShareQQConnector

- (void)regist:(NSString *)appId enableUniveralLink:(BOOL)enabled universalLink:(NSString *)universalLink {
    self.auth = [[TencentOAuth alloc] initWithAppId:appId enableUniveralLink:enabled universalLink:nil delegate:self];
}

- (void)authorize:(NSArray<NSString *> *)permissions
          success:(SShareQQAuthorizeSuccess)success
          failure:(SShareQQAuthorizeFailure)failure {
    self.authorizeSuccess = success;
    self.authorizeFailure = failure;

    self.auth.authShareType = AuthShareType_QQ;
    self.auth.authMode = kAuthModeClientSideToken;

    [self.auth authorize:permissions];
}

- (BOOL)handleOpenURL:(NSURL*)url {
    return [TencentOAuth HandleOpenURL:url];
}

#pragma mark - TencentSessionDelegate

/**
 * 获取用户个人信息回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/getUserInfoResponse.exp success
 *          错误返回示例: \snippet example/getUserInfoResponse.exp fail
 */
- (void)getUserInfoResponse:(APIResponse*) response {
    
}

/**
 * 社交API统一回调接口
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \param message 响应的消息，目前支持‘SendStory’,‘AppInvitation’，‘AppChallenge’，‘AppGiftRequest’
 */
- (void)responseDidReceived:(APIResponse*)response forMessage:(NSString *)message {
    
}


#pragma mark - TencentLoginDelegate(授权登录回调协议)

/**
 * \brief TencentLoginDelegate iOS Open SDK 1.3 API回调协议
 *
 * 第三方应用实现登录的回调协议
 */

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin {
    if (self.auth.accessToken && 0 != [self.auth.accessToken length]) {
        if (self.authorizeSuccess) {
            self.authorizeSuccess(self.auth.accessToken);
        }
    } else {
        if (self.authorizeFailure) {
            self.authorizeFailure();
        }
    }
    self.authorizeSuccess = nil;
    self.authorizeFailure = nil;
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled {
    
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork {
    
}

/**
 * unionID获得
 */
- (void)didGetUnionID {
    
}

/**
 * 强制网页登录，包括账号密码登录和二维码登录
 * return YES时，就算本地有手Q也会打开web界面
 */
- (BOOL)forceWebLogin {
    return NO;
}

#pragma mark - TencentWebViewDelegate(H5登录webview旋转方向回调)

/**
 * \brief TencentWebViewDelegate: H5登录webview旋转方向回调协议
 *
 * 第三方应用可以根据自己APP的旋转方向限制，通过此协议设置
 */
- (BOOL)tencentWebViewShouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

- (NSUInteger)tencentWebViewSupportedInterfaceOrientationsWithWebkit {
    return 0;
}

- (BOOL)tencentWebViewShouldAutorotateWithWebkit {
    return NO;
}

@end
