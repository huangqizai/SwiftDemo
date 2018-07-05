//
//  LoginView.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/3.
//  Copyright © 2018年 FYCK. All rights reserved.
//


import UIKit

// 1.定义一个闭包类型
//格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
typealias loginBlock = (_ userNameText:String, _ passWordText:String) -> Void

class LoginView: BaseView {
    
    var logoImageView = UIImageView()
    var userNameTF = BaseTextField()
    var passWordTF = BaseTextField()
    var loginButton = UIButton()
    
    //2. 声明一个变量
    var loginValueBlock : loginBlock?
    
    
    func setLoginViews() -> Void {
        
        //logo图
        logoImageView = UIImageView.init(image: UIImage.init(named: "login"))
        logoImageView.contentMode = UIViewContentMode.scaleAspectFit
        addSubview(logoImageView)
        logoImageView.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.centerX.equalTo()(self)
            make?.height.equalTo()(100)
            make?.width.equalTo()(60)
            make?.top.equalTo()(self.mas_top)?.offset()(40)
        }
        
        //用户名
        userNameTF = BaseTextField()
        userNameTF.placeholder = "请输入用户名"
        addSubview(userNameTF)
        userNameTF.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(logoImageView.mas_bottom)?.offset()(40)
            make?.left.equalTo()(self.mas_left)?.offset()(40)
            make?.right.equalTo()(self.mas_right)?.offset()(-40)
            make?.height.equalTo()(40)
        }
        let userNameImage = UIImageView.init(image: UIImage.init(named: "mobilePhone"))
        userNameImage.contentMode = UIViewContentMode.scaleAspectFit
        userNameImage.size = CGSize(width: 30, height: 22)
        userNameTF.leftView = userNameImage;
        userNameTF.leftViewMode = UITextFieldViewMode.always
        
        //密码
        passWordTF = BaseTextField()
        passWordTF.placeholder = "请输入密码"
        addSubview(passWordTF)
        passWordTF.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(userNameTF.mas_bottom)?.offset()(20)
            make?.left.equalTo()(self.mas_left)?.offset()(40)
            make?.right.equalTo()(self.mas_right)?.offset()(-40)
            make?.height.equalTo()(40)
        }
        let passWordImage = UIImageView.init(image: UIImage.init(named: "password"))
        passWordImage.contentMode = UIViewContentMode.scaleAspectFit
        passWordImage.size = CGSize(width: 30, height: 22)
        passWordTF.leftView = passWordImage;
        passWordTF.leftViewMode = UITextFieldViewMode.always
        
        //登录
        loginButton = UIButton.init(type: UIButtonType.system)
        loginButton.backgroundColor = UIColor.init(hexString: "56abe4")
        loginButton.tintColor = UIColor.init(hexString: "ffffff")
        loginButton.setTitle("立即登录", for: UIControlState.normal)
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 4
        self.addSubview(loginButton)
        loginButton.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(passWordTF.mas_bottom)?.offset()(40)
            make?.centerX.equalTo()(passWordTF)
            make?.height.equalTo()(40)
            make?.width.equalTo()(passWordTF)
        }
        loginButton.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchDown)
        
        
    }
    
    @objc func loginAction() -> Void{
        print("登录")
        //4. 调用闭包,设置你想传递的参数,调用前先判定一下,是否已实现
        if loginValueBlock != nil {
            loginValueBlock!(userNameTF.text!,passWordTF.text!)
        }
    }
    
    //3. 定义一个方法,方法的参数为和swiftBlock类型一致的闭包,并赋值给callBack
    func loginValue(_ block: @escaping loginBlock) -> Void {
        loginValueBlock = block
    }

}
