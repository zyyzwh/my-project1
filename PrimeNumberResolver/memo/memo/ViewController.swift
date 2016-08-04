//
//  ViewController.swift
//  memo
//
//  Created by Amy on 16/8/2.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
                                                //datasource数据源，delegate委托，告诉viewcontroller让它显示出来
    //let contents=["买菜","带孩子"]
    
    var memoList=[memolist]()                 //创建一个数组
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let memo1=memolist(content: "你去哪")
        let memo2=memolist(content: "我去哪")
        let memo3=memolist(content: "他去哪")
        
        self.memoList.append(memo1)
        self.memoList.append(memo2)
        self.memoList.append(memo3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 5
        //return self.contents.count
        return self.memoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        
        let cell=tableView.dequeueReusableCellWithIdentifier("memocell",forIndexPath: indexPath) //给每个cell加一个自己的专属路径 其他的cell不会显示同样内容
        //cell.textLabel?.text = "elili"
        //cell.textLabel!.text=self.contents[indexPath.row] //调用contents数组里的内容 ，用return self.contents.count 来从第一个开始遍历，然后依次输出
       let memory=self.memoList[indexPath.row]
        cell.textLabel!.text=memory.content
        cell.detailTextLabel!.text=memory.time.description
        return cell
        
    }
    
    
}

