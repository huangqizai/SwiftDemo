//
//  UserManager.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/4.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    

    //单利
    static let sharedManager = UserManager()
    
    private override init() {}
    
    override func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }

    func reset() -> String {
        return "87789990"
    }

    //手机登陆
    func phoneLogin(userNameText:String, passWordText:String, complete:@escaping completeBlock) -> Void {
        ApiServer.server_mobilePhoneLogin(withUsername: userNameText, password: passWordText, success: { (responseObj) in
            complete(true, responseObj)
        }) { (error) in
            complete(false, error)
        }

    }
}
