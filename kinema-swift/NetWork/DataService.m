//
//  DataService.m
//  api封装
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//

#import "DataService.h"
//#import "AppDelegate.h"
#import "PGNetAPIClient.h"
#import "PGNetworkHelper.h"

@implementation DataService

+ (void)requestWithURL:(NSString *)urlstring
                params:(NSMutableDictionary *)params
                bearerToken:(NSString *)bearerToken
            httpMethod:(NSString *)httpMethod
                 block:(CompletionLoadHandle)block
                block2:(faileLoadHandle)block2{
    
    CompletionLoadHandle successful1 = [block copy];
    faileLoadHandle failure1 = [block2 copy];
    
     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    if ([httpMethod isEqualToString:@"POST"]) {
        [HMHttpUtil POSTWithURL:urlstring parameters:params bearerToken:bearerToken progress:nil success:^(NSDictionary *dataDictionary) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            if (successful1) {
                successful1(dataDictionary);
            }
            
        } failure:^(id error) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (failure1) {
                failure1(error);
            }
        }];
        
    } else if([httpMethod isEqualToString:@"GET"]){
        [HMHttpUtil GETWithURL:urlstring parameters:params bearerToken:bearerToken success:^(NSDictionary *dataDictionary) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            BOOL r = [[dataDictionary objectForKey:@"success"] boolValue];
            
            if (r) {

            } else {
                NSString *errorMessage = [dataDictionary objectForKey:@"errorMessage"];
                NSLog(@"url=%@,errorMessage=%@",urlstring,errorMessage);
            }
            if (successful1) {
                successful1(dataDictionary);
            }
        } failure:^(id error) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (failure1) {
                failure1(error);
            }
        }];
    }else if([httpMethod isEqualToString:@"PUT"]){
        [HMHttpUtil PUTWithURL:urlstring parameters:params bearerToken:bearerToken success:^(NSDictionary *dataDictionary) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            BOOL r = [[dataDictionary objectForKey:@"success"] boolValue];
            
            if (r) {
                
            } else {
                NSString *errorMessage = [dataDictionary objectForKey:@"errorMessage"];
                NSLog(@"url=%@,errorMssage=%@",urlstring,errorMessage);
            }
            if (successful1) {
                successful1(dataDictionary);
            }
        } failure:^(id error) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (failure1) {
                failure1(error);
            }
        }];
    }
}

+ (void)POST:(NSString *)urlstring
      params:(NSMutableDictionary *)params
     success:(CompletionLoadHandle)block
     failure:(CompletionLoadHandle)block2
{
    [self requestWithURL:urlstring params:params bearerToken:nil httpMethod:@"POST" block:block block2:block2];
}

+ (void)GET:(NSString *)urlstring
      params:(NSMutableDictionary *)params
     success:(CompletionLoadHandle)block
     failure:(CompletionLoadHandle)block2
{
    [self requestWithURL:urlstring params:params bearerToken:nil httpMethod:@"GET" block:block block2:block2];
}

+ (void)jsonPOST:(NSString *)urlstring
          params:(id)params
         success:(CompletionLoadHandle)success
         failure:(CompletionLoadHandle)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15.;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/json",@"text/plain",@"application/pojo",nil]];
    
    [manager POST:urlstring parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
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

+ (void)cacheGET:(NSString *)urlstring
          params:(NSMutableDictionary *)params
           cache:(CompletionLoadHandle)cache
         success:(CompletionLoadHandle)success
         failure:(CompletionLoadHandle)failure
{
    //设置SSL
//    [PGNetAPIClient policyWithPinningMode:AFSSLPinningModeNone];
    //设置缓存路径
    //GET请求 只需要将cache设置为true就可以自动缓存
    [PGNetworkHelper GET:urlstring parameters:params cache:true responseCache:^(id responseCache) {
        if (cache) {
            cache(responseCache);
        }
    } success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)upDataImageWithURL:(NSString *)urlString params:(NSDictionary *)params image:(UIImage *)image name:(NSString *)name success:(success)SCB failed:(failed)FCB{
    success SCB1=[SCB copy];
    failed  FCB1=[FCB copy];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if(image)
        {
            NSData *imageData = UIImagePNGRepresentation(image);
            [formData appendPartWithFileData:imageData name:@"MultipartFile" fileName:name mimeType:@"image/jpg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (SCB1) {
            SCB1((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (FCB1) {
            FCB1(error);
        }
    }];
    
}

+ (void)postImageArrayWithParams:(NSDictionary *)params andImageURL:(NSString *)imageURL imageArray:(NSArray *)imageArray name:(NSString *)name fileNameArray:(NSArray *)fileNameArray success:(success)SCB failed:(failed)FCB{

    success SCB1 =[SCB copy];
    success FCB1 =[FCB copy];
    NSInteger total = [imageArray count];
    NSMutableArray *dataArray =[[NSMutableArray alloc] init];
    for (NSInteger i=0; i<total; i++) {
        HMFileData *data =[HMFileData fileWithData:UIImagePNGRepresentation(imageArray[i]) name:name fileName:fileNameArray[i] mimeType:@"image/png"];
        [dataArray addObject:data];
    }
    NSString *url = [NSString stringWithFormat:@"%@",imageURL];
    
    [HMHttpUtil POSTWithURL:url parameters:params bearerToken:nil progress:nil success:^(NSDictionary *dataDictionary) {
        if (SCB1) {
            SCB1((NSDictionary *)dataDictionary);
        }
    } failure:^(NSError *error) {
        if (FCB1) {
            FCB1(error);
        }
    }];
    
}

+ (void)requestWithURL_string:(NSString *)urlstring
                params:(NSString *)params
            httpMethod:(NSString *)httpMethod
                 block:(CompletionLoadHandle)block
                block2:(faileLoadHandle)block2;{
    
    CompletionLoadHandle successful1 =[block copy];
    faileLoadHandle failure1 =[block2 copy];
    
         NSLog(@"url = %@",urlstring);
//        NSLog(@"params = %@",params);
        
        [HMHttpUtil POSTWithURL_string:urlstring parameters:params progress:nil success:^(NSDictionary *dataDictionary) {
            //                NSLog(@"url = %@",urlstring);
            //                NSLog(@"resonseObj = %@",dataDictionary);
            BOOL r = [[dataDictionary objectForKey:@"success"] boolValue];
            if (r) {
                //                    NSString *data = [dataDictionary objectForKey:@"data"];
                //                    NSLog(@"data = %@",data);
                
            }else{
                NSString *errorMessage = [dataDictionary objectForKey:@"errorMessage"];
                NSLog(@"errorMessage = %@",errorMessage);
            }
            if (successful1) {
                successful1(dataDictionary);
            }
        } failure:^(NSError *error) {
            if (failure1) {
                failure1([error localizedDescription]);
            }
        }];
        
}


+ (void)requestWithURL_json:(NSString *)urlstring
                     params:(NSMutableDictionary *)params
                 httpMethod:(NSString *)httpMethod
                      block:(CompletionLoadHandle)block
                     block2:(faileLoadHandle)block2{

    CompletionLoadHandle successful1 =[block copy];
    faileLoadHandle failure1 =[block2 copy];
    
    [HMHttpUtil POSTWithURL_json:urlstring parameters:params progress:nil success:^(NSDictionary *dataDictionary) {
        
        BOOL r = [[dataDictionary objectForKey:@"success"] boolValue];
        if (r) {
            //                    NSString *data = [dataDictionary objectForKey:@"data"];
            //                    NSLog(@"data = %@",data);
        }else{
            NSString *errorMessage = [dataDictionary objectForKey:@"errorMessage"];
            NSLog(@"errorMessage = %@",errorMessage);
        }
        if (successful1) {
            successful1(dataDictionary);
        }
    } failure:^(NSError *error) {
        if (failure1) {
            failure1([error localizedDescription]);
        }
    }];
}




@end
