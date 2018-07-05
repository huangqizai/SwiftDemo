//
//  ApiServer.h
//  HmNsb
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiServer : NSObject


typedef void (^gestureHandler)(void);
typedef void (^completeBlock)(BOOL success,id obj);
typedef void (^getDataBlock)(BOOL success,id obj,NSString *mesage);
typedef void (^sensitivityBlock)(BOOL enable,BOOL manually,NSString *sensitivity);

#define kServerErrorMessage ([AppDelegate getInstance].isNetworkEnable)?@"服务器连接不佳":@"网络连接不佳"


/**
 手机号登录
 @param username 手机号
 @param password 密码
 */
+ (void)SERVER_mobilePhoneLoginWithUsername:(NSString *)username password:(NSString *)password success:(void(^)(id responseObj))aSuccess failure:(void(^)(NSError *error))aFailure;

@end

