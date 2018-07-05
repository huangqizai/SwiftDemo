//
//  HMHttpUtil.m
//  api封装
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//

#import "HMHttpUtil.h"
#import "AFNetworking.h"

#define NetworkRequestTimeoutInterval 15


@implementation HMFileData
+ (instancetype)fileWithData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType{
    return [[self alloc] initWithData:data name:name fileName:fileName mimeType:mimeType];
}

- (instancetype)initWithData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType{
    if(self = [super init]){
        self.data = data;
        self.name = name;
        self.fileName = fileName;
        self.mimeType = mimeType;
    }
    return self;
}

- (NSString *)fileName{
    if(_fileName == nil){
        _fileName = @"";
    }
    return _fileName;
}

@end

@implementation HMHttpUtil

+ (void)setLanguageFor:(AFHTTPSessionManager *)manager
{
//    [manager.requestSerializer setAccessibilityLanguage:[AppDelegate getInstance].language];
//    if ([AppDelegate getInstance].isEnglish) {
//        [manager.requestSerializer setAccessibilityLanguage:@"en-US"];
//    } else {
//        [manager.requestSerializer setAccessibilityLanguage:@"zh-CN"];
//    }
}

+ (void)GETWithURL:(NSString *)url parameters:(NSDictionary *)parameters bearerToken:(NSString *)bearerToken  success:(void (^)(NSDictionary *))success failure:(void (^)(id))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = NetworkRequestTimeoutInterval;
    if (bearerToken) {
        [manager.requestSerializer setValue:bearerToken forHTTPHeaderField:@"Authorization"];
    }
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];
    
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            
            //转状态码
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task;
            
            //状态码放入要传的字典中
            NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            [mDict setObject:[NSString stringWithFormat:@"%ld",(long)httpResponse.statusCode] forKey:@"statusCode"];
            NSDictionary * dicResponseObject = mDict;
            
            success(dicResponseObject);
        }
    } failure:^(id task, id error) {
        
        //转状态码
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task;
        
        //状态码放入要传的字典中
        NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:error];
        [mDict setObject:[NSString stringWithFormat:@"%ld",(long)httpResponse.statusCode] forKey:@"statusCode"];
        NSDictionary * dicError = mDict;
        
        if(failure){
            failure(dicError);
        }
    }];
}
 
+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)parameters bearerToken:(NSString *)bearerToken progress:(NSDictionary *)downloadProgress success:(void (^)(NSDictionary *))success failure:(void (^)(id))failure{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = NetworkRequestTimeoutInterval;
    if (bearerToken) {
        [manager.requestSerializer setValue:bearerToken forHTTPHeaderField:@"Authorization"];
    }
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        if (success) {
            //转状态码
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task;
            //状态码放入要传的字典中
            NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            [mDict setObject:[NSString stringWithFormat:@"%ld",(long)httpResponse.statusCode] forKey:@"statusCode"];
            NSDictionary * dicResponseObject = mDict;
            
            success(dicResponseObject);
        }
    } failure:^(id task, id error) {
        
        //转状态码
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task;
        //状态码放入要传的字典中
        NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:error];
        [mDict setObject:[NSString stringWithFormat:@"%ld",(long)httpResponse.statusCode] forKey:@"statusCode"];
        NSDictionary * dicError = mDict;
        
        if (failure) {
            failure(dicError);
        }
    }];

}

+ (void)PUTWithURL:(NSString *)url parameters:(NSDictionary *)parameters bearerToken:(NSString *)bearerToken  success:(void (^)(NSDictionary *))success failure:(void (^)(id))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = NetworkRequestTimeoutInterval;
    if (bearerToken) {
        [manager.requestSerializer setValue:bearerToken forHTTPHeaderField:@"Authorization"];
    }
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];
    
    
    [manager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            //转状态码
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task;
            //状态码放入要传的字典中
            NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            [mDict setObject:[NSString stringWithFormat:@"%ld",(long)httpResponse.statusCode] forKey:@"statusCode"];
            NSDictionary * dicResponseObject = mDict;

            success(dicResponseObject);
        }
    } failure:^(id task, id error) {
        //转状态码
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task;
        //状态码放入要传的字典中
        NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:error];
        [mDict setObject:[NSString stringWithFormat:@"%ld",(long)httpResponse.statusCode] forKey:@"statusCode"];
        NSDictionary * dicError = mDict;

        if (failure) {
            failure(dicError);
        }
    }];
    
}

- (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;
{
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
 
+ (void)POSTWithURL:(NSString *)url parameters:(NSDictionary *)parameters files:(NSArray *)files success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure{
    for(int i = 0; i < files.count; i ++){
        if(![files[i] isKindOfClass:[HMFileData class]]){
//            [NSException raise:@"The elements in the files array is not a FJFileData" format:nil];
            NSLog(@"The elements in the files array is not a FJFileData");
         }
    }
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = NetworkRequestTimeoutInterval;
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];

    [self setLanguageFor:manager];

    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [files enumerateObjectsUsingBlock:^(HMFileData *file, NSUInteger idx, BOOL * _Nonnull stop) {
            [formData appendPartWithFileData:file.data name:file.name fileName:file.fileName mimeType:file.mimeType];
        }];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure){
            failure(error);
        }
    }];
}

+(void)POSTWithURL_string:(NSString *)url parameters:(NSString *)parameters progress:(NSDictionary *)downloadProgress success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = NetworkRequestTimeoutInterval;
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];

    [self setLanguageFor:manager];


     //取出保存的cookie
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //对取出的cookie进行反归档处理
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"cookie"]];
    
    if (cookies) {
        //NSLog(@"有cookie");
        //设置cookie
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (id cookie in cookies) {
            [cookieStorage setCookie:(NSHTTPCookie *)cookie];
        }
    }else{
        NSLog(@"无cookie");
    }
 
     NSLog(@"%@",parameters);
    
    NSMutableDictionary *parm = [NSMutableDictionary dictionary];
    [parm setValue:@7  forKey:@"hour"];
    [parm setValue:@48  forKey:@"minute"];
    [parm setValue:@1  forKey:@"repeatOptions"];
    [parm setValue:@5  forKey:@"sceneId"];
    [parm setValue:@3  forKey:@"timeType"];
    [parm setValue:@2  forKey:@"triggerType"];

    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];

     [manager POST:url parameters:parm progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void) POSTWithURL_json:(NSString *)url
               parameters:(NSDictionary *)parameters
                 progress:(NSDictionary *)downloadProgress
                  success:(void (^)(NSDictionary *dataDictionary))success
                  failure:(void (^)(NSError *error))failure{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = NetworkRequestTimeoutInterval;
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    [self setLanguageFor:manager];

     //取出保存的cookie
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //对取出的cookie进行反归档处理
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"cookie"]];
    
    if (cookies) {
        //NSLog(@"有cookie");
        //设置cookie
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (id cookie in cookies) {
            [cookieStorage setCookie:(NSHTTPCookie *)cookie];
        }
    }else{
        NSLog(@"无cookie");
    }
     
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}

@end
