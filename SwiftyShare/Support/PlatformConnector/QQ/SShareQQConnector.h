//
//  QQConnector.h
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/10.
//

#import <UIKit/UIKit.h>

/*
 本来想用 Swift 创建 QQConnector 的。
 但是一直导入不了腾讯的框架，最后发现需要对 TencentOpenAPI.framework 进行处理。处理过程为：
 1. 在 TencentOpenAPI.framework 中新建文件夹 Modules
 2. 将 TencentOpenAPI.framework 中的 Headers 文件夹中的 module.modulemap 文件放到第一步中新建的文件夹 Modules 中
 
 无论 Objective-C 还是用 Swift 中使用腾讯框架，都需要进行这样的处理
 
 然后如果在 Swift 文件中导入腾讯的框架时
 import TencentOpenApi
 而不是
 import TencentOpenAPI
 
 导入的时候，会提示
 Could not build Objective-C module 'TencentOpenApi'
 
 所以改用 Objective-C 创建 QQConnector 类
 */


NS_ASSUME_NONNULL_BEGIN

typedef void (^SShareQQAuthorizeSuccess)(NSString * token);
typedef void (^SShareQQAuthorizeFailure)(void);


@interface SShareQQConnector : NSObject

- (void)regist:(NSString *)appId enableUniveralLink:(BOOL)enabled universalLink:(NSString *)universalLink;

- (void)authorize:(NSArray<NSString *> *)permissions
success:(SShareQQAuthorizeSuccess)success
failure:(SShareQQAuthorizeFailure)failure;

- (BOOL)handleOpenURL:(NSURL *)url;


@end

NS_ASSUME_NONNULL_END
