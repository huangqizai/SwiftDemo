//
//  CinemasViewController.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/4.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit

class CinemasViewController: BaseViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "片库"
        self.view.backgroundColor = UIColor.white
        
        self.initCollectionView()
    }
    
    func initCollectionView() -> Void {
        
        //约束
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        let wh = (self.view.frame.size.width - 50) / 3
        layout.itemSize = CGSize(width: wh, height: wh*1.6)//宽高
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15)//上左下右边距
        
        let collectionView = UICollectionView.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height-110)), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.register(CinemasCollectionViewCell.self, forCellWithReuseIdentifier:"cellid")
        
    }
    
    //MARK:代理
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
