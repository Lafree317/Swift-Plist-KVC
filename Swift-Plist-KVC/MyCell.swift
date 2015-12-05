//
//  MyCell.swift
//  Swift-Plist-KVC
//
//  Created by huchunyuan on 15/12/5.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

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
