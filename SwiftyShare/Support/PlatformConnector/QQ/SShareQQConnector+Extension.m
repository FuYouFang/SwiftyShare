//
//  SShareQQConnector+Extension.m
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/15.
//

#import "SShareQQConnector+Extension.h"
#import <TencentOpenAPI/TencentOAuth.h>

@implementation SShareQQConnector (Extension)

+ (NSString *)getKeyFromPermission:(NSInteger)permission {
    switch (permission) {
        case 0:
            return kOPEN_PERMISSION_GET_USER_INFO;
        case 1:
            return kOPEN_PERMISSION_GET_SIMPLE_USER_INFO;
        case 2:
            return kOPEN_PERMISSION_ADD_ALBUM;
        case 3:
            return kOPEN_PERMISSION_ADD_TOPIC;
        case 4:
            return kOPEN_PERMISSION_CHECK_PAGE_FANS;
        case 5:
            return kOPEN_PERMISSION_GET_INFO;
        case 6:
            return kOPEN_PERMISSION_GET_OTHER_INFO;
        case 7:
            return kOPEN_PERMISSION_LIST_ALBUM;
        case 8:
            return kOPEN_PERMISSION_UPLOAD_PIC;
        case 9:
            return kOPEN_PERMISSION_GET_VIP_INFO;
        case 10:
            return kOPEN_PERMISSION_GET_VIP_RICH_INFO;
    }
    return @"";
}

@end
