//
//  TaskViewController.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/4.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit

class TaskViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource  {
    
    var dataSourceArr : NSMutableArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "任务"
        self.view.backgroundColor = UIColor.lightGray
        
        self.initTableView()
        dataSourceArr = self.getData()
        
        print("swift22");
        print("swift22");
        print("swift22");
    
    }
    
    func getData() -> NSMutableArray {
        let dataSource = NSMutableArray()
        
        for index in 1...20 {
            let dataStr = NSString.localizedStringWithFormat("任务%d", index)
            dataSource.add(dataStr)
        }
        return dataSource
    }
    
    func initTableView() -> Void {
        let tableView = UITableView.init()
        tableView.backgroundColor = UIColor.red
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.left.equalTo()(self.view)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSourceArr?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let content = dataSourceArr![indexPath.row]
        
        var cell = tableView.cellForRow(at: indexPath)
        if !(cell != nil) {
            cell = TaskTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = (content as! String)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("点击")
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
