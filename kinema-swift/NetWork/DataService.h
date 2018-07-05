//
//  DataService.h
//  api封装
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//  请求网络

#import <Foundation/Foundation.h>

#import "HMHttpUtil.h"
#import "AFNetworking.h"

//成功回调
typedef void(^CompletionLoadHandle)(id result);
//失败回调
typedef void(^faileLoadHandle) (id result2);

//图片上传回调
typedef void (^success)(id response);
typedef void (^failed)(id failedMsg);

@interface DataService : NSObject

////网络请求 key-value格式
//+ (void)requestWithURL:(NSString *)urlstring
//                params:(NSMutableDictionary *)params
//            httpMethod:(NSString *)httpMethod
//                 block:(CompletionLoadHandle)block
//                block2:(faileLoadHandle)block2;
+ (void)requestWithURL:(NSString *)urlstring
                params:(NSMutableDictionary *)params
           bearerToken:(NSString *)bearerToken
            httpMethod:(NSString *)httpMethod
                 block:(CompletionLoadHandle)block
                block2:(faileLoadHandle)block2;

+ (void)POST:(NSString *)urlstring
      params:(NSMutableDictionary *)params
     success:(CompletionLoadHandle)block
     failure:(CompletionLoadHandle)block2;

+ (void)GET:(NSString *)urlstring
     params:(NSMutableDictionary *)params
    success:(CompletionLoadHandle)block
    failure:(CompletionLoadHandle)block2;

+ (void)jsonPOST:(NSString *)urlstring
      params:(id)params
     success:(CompletionLoadHandle)success
     failure:(CompletionLoadHandle)failure;

+ (void)cacheGET:(NSString *)urlstring
          params:(NSMutableDictionary *)params
           cache:(CompletionLoadHandle)cache
         success:(CompletionLoadHandle)success
         failure:(CompletionLoadHandle)failure;
/**
 图片上传
 urlString 上传网址 image上传图片 name 图片名称
 */
+(void)upDataImageWithURL:(NSString *)urlString
                   params:(NSDictionary *)params
                    image:(UIImage *)image
                     name:(NSString *)name
                  success:(success)SCB
                   failed:(failed)FCB;

/**
 *  多张图片上传
 *
 *  @param params           上传参数字典
 *  @param imageArray       上传图片数组
 *  @param name             文件名
 *  @param fileNameArray    图片名称数组
 *  @param SCB              成功回调
 *  @param FCB              失败回调
 */
+(void)postImageArrayWithParams:(NSDictionary *)params
                    andImageURL:(NSString *)imageURL
                     imageArray:(NSArray *)imageArray
                           name:(NSString *)name
                  fileNameArray:(NSArray *)fileNameArray
                        success:(success)SCB
                         failed:(failed)FCB;


/**
 网络请求 请求源转换为string  json格式
 */
+ (void)requestWithURL_string:(NSString *)urlstring
                       params:(NSString *)params
                   httpMethod:(NSString *)httpMethod
                        block:(CompletionLoadHandle)block
                       block2:(faileLoadHandle)block2;


//网络请求 json格式
+ (void)requestWithURL_json:(NSString *)urlstring
                params:(NSMutableDictionary *)params
            httpMethod:(NSString *)httpMethod
                 block:(CompletionLoadHandle)block
                block2:(faileLoadHandle)block2;


@end
