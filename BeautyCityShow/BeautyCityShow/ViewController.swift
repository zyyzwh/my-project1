//
//  ViewController.swift
//  BeautyCityShow
//
//  Created by Amy on 16/8/6.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit
import AVFoundation              //import音乐的包

class CityCell:UITableViewCell{
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
 

}

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate, PassDataDelegate{
    
    let citys = ["Love","Paris","Deguo","Fushan","Las"]
    
    //播放音乐前需要声明变量
    var player: AVAudioPlayer!
    
    //声明第二个界面
    var globlesecondvc:SecondVC!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       //播放音乐的
        let musicURL = NSBundle.mainBundle().URLForResource("mysong", withExtension: ".mp3")
        
        self.player = try!AVAudioPlayer(contentsOfURL: musicURL!)
        self.player.play()
        
    }
    
    
    //tableView的数据元
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.citys.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let citycell = tableView.dequeueReusableCellWithIdentifier("citycell",forIndexPath:indexPath) as! CityCell
        
        citycell.cityName.text = self.citys[indexPath.row]
        
        let image = UIImage(named: self.citys[indexPath.row]+".jpg")
        citycell.cityImage.image = image
        return citycell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
//    //用代码的形式去跳转到下一个界面，设置背景颜色蓝色，button颜色白色
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let vc = UIViewController()
//        
//        //设置背景颜色
//        vc.view.backgroundColor = UIColor.brownColor()
//        
//        let screen1=UIScreen.mainScreen().bounds.width
//        let screen2=UIScreen.mainScreen().bounds.height
//        
//        //设置button长宽高，颜色
//        let button = UIButton(frame: CGRect(x: screen1/2-50,y:screen2-50,width: 100,height: 20))
//        button.backgroundColor = UIColor.whiteColor()
//        
//        vc.view.addSubview(button)
////        
////        //显示下一界面
////        self.presentViewController(vc, animated: true, completion: nil)
//        
//        //另一种展示方式，会跳转至下一页面，显示“城市展图”，是在嵌套在navigationController之后
//        self.navigationController?.pushViewController(vc, animated: true)
//        
//        //退出回上一界面
//        button.addTarget(self, action: #selector(ViewController.Tap), forControlEvents: .TouchUpInside)
//    }
//    
    
    
    
    //如何通过identifier很快部建viewcontroller,主要是用presentViewController方法进行下一个界面的呈现
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let secondVC = storyboard.instantiateViewControllerWithIdentifier("SecondVC") as! SecondVC
        //生成ViewController  secondVC就是一个ViewController
        
        self.globlesecondvc = secondVC
        
        secondVC.delegate = self
        
        self.presentViewController(secondVC,animated: true,completion:nil)
        
    }
//    
//      func Tap(){
//       // self.dismissViewControllerAnimated(true, completion: nil)                      //退出回上一界面
//       
//       //在设置“城市展图”后，自己设置的button没有用了，所以添加此代码，重新调用button的作用
//        self.navigationController?.popViewControllerAnimated(true)
//      }
    
    
    
    func usePassData(data:String ) {
        print(data)
    }

}

