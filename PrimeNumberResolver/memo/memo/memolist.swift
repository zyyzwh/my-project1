//
//  memolist.swift
//  memo
//
//  Created by Amy on 16/8/3.
//  Copyright © 2016年 Amy. All rights reserved.
//

import Foundation
class memolist{
    var content: String = " "                                   //或者 var content: String!
    var description: String=" "
    
    var priority: Int = 0
    var time: NSDate=NSDate()
    init (content: String,date:NSDate=NSDate() ){              //初始化函数
        self.time=date                                        //8.6 新加代码，对时间初始化
        self.content=content
    }
}
