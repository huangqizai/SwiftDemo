//
//  ApiServer+DataProcessing.m
//  Kinema-IOS
//
//  Created by huangqizai on 2018/3/14.
//  Copyright © 2018年 FYCK. All rights reserved.
//

#import "ApiServer+DataProcessing.h"
#import "DataService.h"

@implementation ApiServer (DataProcessing)

+ (void)dealResponse:(id)responseObject success:(void (^)(id))aSuccess failure:(void (^)(NSString *))aFailure
{
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        
        if (200 <= [[responseObject objectForKey:@"statusCode"] intValue] && 300 >= [[responseObject objectForKey:@"statusCode"] intValue]) {
            aSuccess(responseObject);
        }else{
            aFailure([responseObject objectForKey:@"errorMessage"]);
        }
//        if ([[responseObject objectForKey:@"ok"] boolValue]) {
//            aSuccess(responseObject);
//
//        } else {
//            if ([((NSDictionary *)responseObject).allKeys containsObject:@"errorMessage"]) {
//                aFailure([responseObject objectForKey:@"errorMessage"]);
//
//            } else if ([((NSDictionary *)responseObject).allKeys containsObject:@"data"]) {
//                aFailure([responseObject objectForKey:@"data"]);
//            }
//        }
    } else {
        aFailure(@"网络不佳");
    }
}

@end
