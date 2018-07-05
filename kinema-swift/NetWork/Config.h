//
//  Config.h
//  HmNsb
//
//  Created by zhoutianyu on 16/8/29.
//  Copyright © 2016年 zhoutianyu. All rights reserved.
//

#ifndef Config_h
#define Config_hn


#endif /* Config_h */

#ifdef __OBJC__

#define BASEURL     @"https://baidu.com"//测服

//NO正式，YES可选择
#define DEMOMODE    YES
//#define BASEURL     [UserManager defaultServerURL]

typedef void (^gestureHandler)(void);
typedef void (^completeBlock)(BOOL success,id obj);
typedef void (^getDataBlock)(BOOL success,id obj,NSString *mesage);
typedef void (^sensitivityBlock)(BOOL enable,BOOL manually,NSString *sensitivity);


//#define kUrl(str) [NSString stringWithFormat:@"%@%@",BASEURL,str]
//#define kServerErrorMessage ([AppDelegate getInstance].isNetworkEnable)?@"服务器连接不佳":@"网络连接不佳"

/** 登录注册 */
#define mobilePhoneLogin @"a/1/login/yuanx"                       //  手机号登录










#endif
