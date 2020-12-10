//
//  QQConnector.m
//  SShareQQConnector
//
//  Created by fuyoufang on 2020/12/10.
//

#import "SShareQQConnector.h"
#import <TencentOpenAPI/TencentOAuth.h>

@implementation SShareQQConnector


- (void)regist {
    [[TencentOAuth alloc] initWithAppId:@"" andDelegate:@""];
}

@end
