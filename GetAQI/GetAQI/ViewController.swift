//
//  ViewController.swift
//  GetAQI
//
//  Created by Amy on 16/8/8.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var cityName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getWebData(sender: AnyObject) {
        
        
       
       // let urlstring = "http://aqicn.org/city/beijing/us-embassy/cn/"          //复制 北京美国大使馆网站
        
         let urlstring = "http://aqicn.org/city/"+self.cityName.text!
        
      
        
         let url = NSURL(string: urlstring)
        
         let request = NSURLRequest(URL: url!)                                //获取网址
        
        //NSOperationQueue.mainQueue()往主队列放,函数功能是异步传输功能
        NSURLConnection.sendAsynchronousRequest( request, queue: NSOperationQueue.mainQueue()) { (respons, data, _) in                                   //“_”代表空
           // print(data)                              //print(data) 打出的是数字，所以在Info里进行配置
            
             if data==nil {
                self.result.text = "网络为空"
                
            
               return
             }
            
            
            
             let str = NSString(data: data!,encoding: NSUTF8StringEncoding)
            
            // print(str)
            
             let strArray1 = str?.componentsSeparatedByString("<div class='aqivalue' ")     //找到一句话的头
            
            if strArray1?.count<=1 {
                self.result.text = "城市错误"
                
                
                return
            }
            
             let str2 = strArray1![1]
            
            // print(str2)
             let strArray2=str2.componentsSeparatedByString("</div>")                       //找到一句话的尾
            
             let str3 = strArray2[0]
            
            // print(str3)
             let strArray3 = str3.componentsSeparatedByString(">")                          //找出 “8”
            
             let str4 = strArray3[1]
            
            self.result.text = str4
            //print(str4)
        
            
     }
}
    
    @IBAction func unwindsegue(segue: UIStoryboardSegue){
//       let searchViewController = segue.sourceViewController as! searchViewController  //获取“＋”页面的 “提交” 后的信息
//        let newmemo=addViewCongtroller.newmemo
//       self.memoList.append(newmemo)        self.everycell.reloadData()
    }

}

