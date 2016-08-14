//
//  ViewController.swift
//  memo
//
//  Created by Amy on 16/8/2.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit
import RealmSwift
 

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
                                                //datasource数据源，delegate委托，告诉viewcontroller让它显示出来
    //let contents=["买菜","带孩子"]
    
    var memoList=[memolist]()                 //创建一个数组
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//为了本地化，所以把之前写的注释掉，使用Realm库中的东西
//        let memo1=memolist(content: "你去哪")
//        memo1.description="IKON是YG Entertainment于2015年9月15日推出的男子演唱组合，由B.I（金韩彬）、金振焕、BOBBY（金知元）、宋                   尹亨、具晙会、金东爀、郑粲右7名成员组成。2014年9月11日，出演YG Entertainment出道生存节目《MIX & MATCH》[1]  。2015年11月2日，发布首张正规专辑《WELCOME BACK》[2]  。2016年1月13日，计划于日本出道[3]  ，同年1月获得第30届韩国金唱片音源新人赏奖[4]  。"
//        
//        let memo2=memolist(content: "我去哪")
//        memo2.description="2013年8月，成员金振焕、宋允亨、金知元、金韩彬、具俊会、金东赫作为Team B参加YG Entertainment出道生存节目《WIN:WHO IS NEXT》与Team A竞争[9]  ，但最后Team A获得胜利[10]  。"
//        
//        let memo3=memolist(content: "他去哪")
//        memo3.description="2014年9月，在《WIN:WHO IS NEXT》组成的Team B与梁洪硕、郑粲右、郑镇馨参加YG Entertainment出道生存节目《MIX & MATCH》，最后Team B和郑粲右胜出比赛，并成为iKON成员[11]  "
//        
//        self.memoList.append(memo1)
//        self.memoList.append(memo2)
//        self.memoList.append(memo3)
        
//        self.everycell.estimatedRowHeight=80
//        self.everycell.rowHeight=UITableViewAutomaticDimension         //对每一个下一页的cell的宽高
        
        
        
        let realm = try!Realm()
        let memos = realm.objects(memolist)
        
        self.memoList = Array(memos)
        
        
       
        
        
    }

    @IBOutlet weak var everycell: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }  // 使你的我的他的都能分别跳转不同内容，在第一个界面的tableView拖拽过来的 outlet

    
    
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
        
        cell.detailTextLabel!.text=memory.time.descriptionWithLocale(NSLocale.currentLocale())
        // 获取当地时间，所以不在addViewController中对 “let memodate=self.date.date”进行修改，获取的值类型是String，所以在描述“description”页面进行转换，存的是UTC时间，但显示的是当前地区时间
        //   NSLocale.currentLocale() 是表示时区的
        
        return cell
        
    }
    
    
    //8.4 新加代码 页面跳转至 下一个页面，显示memoList[0]里边的具体内容   进行界面跳转就用segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="showdetail"{
        let destination=segue.destinationViewController as! memoDetailTableViewController
      // destination.memo=self.memoList[0]       //每一个你我他都显示同样内容
         destination.memo=self.memoList[self.everycell.indexPathForSelectedRow!.row]       //每一个跳转页面都有自己单独的内容  与 @IBOutlet weak var everycell: UITableView!相关联
        }
    }
    
    
    
    //跳转至“＋”链接的页面后 对退出进行设置 在“＋”页面中的“Exid”后触发的函数
    @IBAction func unwindsegue(segue: UIStoryboardSegue){
        let addViewCongtroller = segue.sourceViewController as! addViewController  //获取“＋”页面的 “提交” 后的信息
        let newmemo=addViewCongtroller.newmemo
        self.memoList.append(newmemo)
        self.everycell.reloadData()
    }
    
    
    //8.6设置后，点击右滑，会出现“delete”删除功能，canEditRowAtIndexPath，canEditRowAtIndexPath相配合
    //两个函数同时作用，出现“delete”，但功能还不能实现，将 IF｛｝函数写入，具体，才能执行删除功能，将每个cell中的内容删除
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {                                //EditingStyle右滑后有几个参数
        
        if editingStyle == .Delete{
            
        //删除数据库中自己写入的内容，从永久性写入库到永久性删除库
            let realm = try! Realm()
            try! realm.write {
            realm.delete(self.memoList[indexPath.row])
                
            }
            
        //在虚拟器上删除，但因为存进去的数据就不是永久性存储
            self.memoList.removeAtIndex(indexPath.row)                             //将指针传给系统，告诉具体删除哪个
            self.everycell.reloadData()                                            //重新加

        }
        
    }
    
}

