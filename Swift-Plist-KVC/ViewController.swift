//
//  ViewController.swift
//  Swift-Plist-KVC
//
//  Created by huchunyuan on 15/12/5.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var modelArr:NSMutableArray = []
    override func viewDidLoad() {
        // 封装方法
        layoutView()
    }
    func layoutView(){
        // 注册cell
        tableView.registerNib(UINib.init(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        // 取出Plist url
        let fileUrl = NSBundle.mainBundle().URLForResource("DataList", withExtension: "plist")
        // 到出数组
        let dataArr = NSArray(contentsOfURL: fileUrl!)
        // 快速遍历出数组中的字典
        for dic in dataArr!{
            // 创建对象
            let model = Model()
            // 将快速枚举值进行类型转换
            let dica:Dictionary<String,AnyObject> = dic as! Dictionary
            
            // 数据转模型
            model.setValuesForKeysWithDictionary(dica)

            // 添加入数组中
            modelArr.addObject(model)
        }
    }
    // 区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    // 行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArr.count;
    }
    // cell
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 重用
        let cell:MyCell =  tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! MyCell
        // 取消选中变黑
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        // 取出对象
        let model = modelArr[indexPath.row] as! Model
        // 赋值
        cell.nameLabel.text = model.name
        cell.ageLabel.text = model.age
        cell.detailLabel.text = model.content
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 121;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

