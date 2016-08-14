//
//  addViewController.swift
//  memo
//
//  Created by Amy on 16/8/6.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit
import RealmSwift

class addViewController: UIViewController {
    var newmemo:memolist!               //声明一个变量，把memolist内容给newmemo

    @IBOutlet weak var memotitle: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBAction func submit(sender: AnyObject) {
//        //1.get date and create objet
//        let memotitle=self.memotitle.text!
//        let memodate=self.date.date
//       let mynewmemo=memolist(content:memotitle,date:memodate)
//        
//        //2.保存为全局变量
//        self.newmemo=mynewmemo
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation   将本代码注释取消，使得在“text”输入的数字得以接收，单击提交后可以跳转回之前页面

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //1.get date and create objet
         let memotitle=self.memotitle.text!
         let memodate=self.date.date               //存储UTC事件
        
        // let mynewmemo=memolist(content:memotitle,date:memodate)
        
        
       //重新初始化 创建对象 并赋值
        let mynewmemo = memolist()
        mynewmemo.content = memotitle
        mynewmemo.time = memodate
        
      //对输入内容进行保存，本地永久存储
        let realm = try! Realm()
        try! realm.write {
            realm.add(mynewmemo)
        }
        
        
        //2.保存为全局变量
        self.newmemo=mynewmemo
    }
    

}
