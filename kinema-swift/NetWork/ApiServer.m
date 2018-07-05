 //
//  ApiServer.m
//  HmNsb
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//

#import "ApiServer.h"
#import "DataService.h"
#import "Config.h"
#import "HMHttpUtil.h"

@implementation ApiServer


/**
 手机号登录
 */
+ (void)SERVER_mobilePhoneLoginWithUsername:(NSString *)username password:(NSString *)password success:(void(^)(id responseObj))aSuccess failure:(void(^)(NSError *error))aFailure{
    
    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
    [parms setValue:username  forKey:@"username"];
    [parms setValue:password  forKey:@"password"];
    [DataService requestWithURL:[NSString stringWithFormat:@"%@%@",BASEURL,mobilePhoneLogin] params:parms bearerToken:nil httpMethod:@"POST" block:^(id result) {
        if (aSuccess)
        {
            aSuccess(result);
        }
    } block2:^(id result2) {
        if (aFailure)
        {
            aFailure(result2);
        }
    }];
}


@end
