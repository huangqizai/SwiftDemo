//
//  BaseViewController.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/3.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //隐藏
        //self.navigationController?.isNavigationBarHidden = true
        //不透明
        self.navigationController?.navigationBar.isTranslucent = false
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
