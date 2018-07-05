//
//  ApiServer+DataProcessing.h
//  Kinema-IOS
//
//  Created by huangqizai on 2018/3/14.
//  Copyright © 2018年 FYCK. All rights reserved.
//

#import "ApiServer.h"

@interface ApiServer (DataProcessing)

/**
 处理接收到的数据
 
 @param responseObject responseObject description
 @param aSuccess <#aSuccess description#>
 @param aFailure <#aFailure description#>
 */
+ (void)dealResponse:(id)responseObject success:(void(^)(id responseObj))aSuccess failure:(void(^)(NSString *error))aFailure;

@end
