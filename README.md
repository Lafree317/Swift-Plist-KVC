# Swift-Plist-KVC
iOS Swift plist文件加载数据 自定义cell
#前言
最近被swift深深的迷住了,但是不知道写点什么好,就从基础的开始写吧.
本篇博客主要内容是 从Plist中加载数据,自定义cell,KVC等
#上代码
####创建一个DataList.plist内容如下
![这里写图片描述](http://img.blog.csdn.net/20151205181506616)

####再创建一个Model类Model.swift
```
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
```
####在StoryBoard中创建tableView并关联属性和代理数据源等
![这里写图片描述](http://img.blog.csdn.net/20151205181519174)

####然后创建MyCell.swift 并创建Xib:
![这里写图片描述](http://img.blog.csdn.net/20151205181531518)
```
import UIKit

class MyCell: UITableViewCell {
    // 姓名
    @IBOutlet weak var nameLabel: UILabel!
    // 年龄
    @IBOutlet weak var ageLabel: UILabel!
    // 详情
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
```
####然后在ViewController.swift中写入以下代码
```
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
```
###效果图:
![这里写图片描述](http://img.blog.csdn.net/20151205181601126)
###github:https://github.com/Lafree317/Swift-Plist-KVC
---
本人还是一只小菜鸡,不过是一只热心肠的菜鸡,如果有需要帮助或者代码中有更好的建议的话可以发邮件到lafree317@163.com中,我们一起进步XD
