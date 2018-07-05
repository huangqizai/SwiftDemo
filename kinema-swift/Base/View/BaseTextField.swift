//
//  BaseTextField.swift
//  kinema-swift
//
//  Created by huangqizai on 2018/7/3.
//  Copyright © 2018年 FYCK. All rights reserved.
//

import UIKit
import MJExtension

class BaseTextField: UITextField {


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.init(hexString: "999999")?.cgColor
        self.layer.borderWidth = 0.5
        
    }
    
    //  重写占位符的x值
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var placeholderRect = super.placeholderRect(forBounds: bounds)
        placeholderRect.origin.x += 1
        return placeholderRect
    }
    
    //  重写文字输入时的X值
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var editingRect = super.editingRect(forBounds: bounds)
        editingRect.origin.x += 0
        return editingRect
    }
    
    //  重写文字显示时的X值
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.editingRect(forBounds: bounds)
        textRect.origin.x += 0
        return textRect
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
