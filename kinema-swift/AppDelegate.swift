//
//  AppDelegate.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/6/11.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit
import RTRootNavigationController
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let loginVC = LoginViewController()
        let nav = RTRootNavigationController.init(rootViewController: loginVC)
        self.window?.rootViewController = nav
        
        self.IQKeyBoard()
        
        return true
    }
    
    func IQKeyBoard() -> Void {
        let keyBoardManager = IQKeyboardManager.shared()
        keyBoardManager.isEnabled = true // 控制整个功能是否启用
        keyBoardManager.shouldResignOnTouchOutside = true // 控制点击背景是否收起键盘
        keyBoardManager.shouldToolbarUsesTextFieldTintColor = true // 控制键盘上的工具条文字颜色是否用户自定义
        keyBoardManager.isEnableAutoToolbar = true // 控制是否显示键盘工具条
        keyBoardManager.shouldShowToolbarPlaceholder = true // 是否显示站位文字
        keyBoardManager.placeholderFont = UIFont.boldSystemFont(ofSize: 17) // 设置占位文字字体
        keyBoardManager.keyboardDistanceFromTextField = 10.0 // 输入框距离键盘的距离
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

