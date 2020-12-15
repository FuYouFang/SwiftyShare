//
//  SShareQQConnector+Extension.h
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/15.
//

#import "SShareQQConnector.h"

NS_ASSUME_NONNULL_BEGIN

@interface SShareQQConnector (Extension)

+ (NSString *)getKeyFromPermission:(NSInteger)permission;

@end

NS_ASSUME_NONNULL_END
