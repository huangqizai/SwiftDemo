//
//  Public.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/5.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit

class Public: NSObject {
    
    class func getImgView(_ ImgName: NSString)->UIImage{

        var image:UIImage = UIImage(named: ImgName as String)!
        
        image = image.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        
        return image;
    }
    

}
