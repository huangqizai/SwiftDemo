//
//  LoginViewController.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/3.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit


class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "登录"
        
        self.setViews()
    }
    
    func setViews() -> Void {
        let loginView = LoginView()
        loginView.setLoginViews()
        self.view.addSubview(loginView)
        loginView.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
        }
        
        loginView.loginValue { (userNameText, passWordText) in
            UserManager.sharedManager.phoneLogin(userNameText: userNameText, passWordText: passWordText, complete: { (success, obj) in
                print(success,obj as Any)
                
            })
            
            self.loadMainViews()
        }
    }
    
    func loadMainViews() -> Void {
        let rootVC = UIApplication.shared.delegate as! AppDelegate
        rootVC.window?.rootViewController = BaseTabBarController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
