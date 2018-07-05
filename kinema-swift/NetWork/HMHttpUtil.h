//
//  HMHttpUtil.h
//  api封装
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMFileData : NSObject

/**
 *  文件的二进制数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名称
 */
@property (nonatomic, copy) NSString *fileName;

/**
 *  文件的mimeType
 */
@property (nonatomic, copy) NSString *mimeType;

+ (instancetype)fileWithData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType;
- (instancetype)initWithData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType;

@end

@interface HMHttpUtil : NSObject

/**
 *  GET方式请求数据
 *
 *  @param url           请求URL
 *  @param parameters    请求参数
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 */
+ (void) GETWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
        bearerToken:(NSString *)bearerToken 
            success:(void (^)(NSDictionary *dataDictionary))success
            failure:(void (^)(id error))failure;

/**
 *  POST方式请求数据
 *
 *  @param url        请求URL
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void) POSTWithURL:(NSString *)url
          parameters:(NSDictionary *)parameters
         bearerToken:(NSString *)bearerToken 
            progress:(NSDictionary *)downloadProgress
             success:(void (^)(NSDictionary *dataDictionary))success
             failure:(void (^)(id error))failure;

/**
 *  POST方式请求数据
 *
 *  @param url        请求URL
 *  @param parameters 请求的基本参数
 *  @param files      请求的复杂参数，为FJFileData类型的数组，如果数组中的元素类型错误，则抛出异常
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void) POSTWithURL:(NSString *)url
          parameters:(NSDictionary *)parameters
               files:(NSArray *)files
             success:(void (^)(NSDictionary *dataDictionary))success
             failure:(void (^)(NSError *error))failure;


/**
 *  PUT方式请求数据
 *
 *  @param url        请求URL
 *  @param parameters 请求的基本参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)PUTWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
       bearerToken:(NSString *)bearerToken 
           success:(void (^)(NSDictionary *))success
           failure:(void (^)(id))failure;


/**
 POST方式请求数据，直接传递JSON

 @param url 请求URL
 @param parameters 请求的基本参数  JSON 格式
@param success 请求成功的回调
 @param failure 请求失败的回调
 */
+(void)POSTWithURL_string:(NSString *)url
               parameters:(NSString *)parameters
                 progress:(NSDictionary *)downloadProgress
                  success:(void (^)(NSDictionary *))success
                  failure:(void (^)(NSError *))failure;

/**
 *  POST方式请求数据 请求格式为json
 *
 *  @param url        请求URL
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void) POSTWithURL_json:(NSString *)url
          parameters:(NSDictionary *)parameters
            progress:(NSDictionary *)downloadProgress
             success:(void (^)(NSDictionary *dataDictionary))success
             failure:(void (^)(NSError *error))failure;
 

@end
