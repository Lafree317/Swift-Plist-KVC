//
//  Model.swift
//  Swift-Plist-KVC
//
//  Created by huchunyuan on 15/12/5.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

import UIKit
class Model: NSObject {
    // 如果数据中有值但是这里没有的话走这个方法把值弃掉
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        return ;
    }
    // 姓名
    var name:String = ""
    // 年龄
    var age:String = ""
    // 详情
    var content:String = ""
}

