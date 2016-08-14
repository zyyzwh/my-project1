//
//  ViewController.swift
//  PinterestLayout   瀑布流布局
//
//  Created by Amy on 16/8/10.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit
class MyCell:UICollectionViewCell{
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodName: UILabel!

}//记得绑定 identifier里设置

class ViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var cv: UICollectionView!      //给collectionView加一个outlet
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      //  cv.registerClass(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        
        cv.backgroundColor = UIColor.whiteColor()         //因为背景默认颜色黑色，将它设置成白色
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9        //相当于返回9个 cell，9个小格
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath)as! MyCell
        
        cell.backgroundColor = UIColor.whiteColor()                //cell的颜色设置
        
        
        cell.foodName.text = "川菜"
        
        let image = UIImage(named:  "Chuancai.jpg")
     
        
        cell.foodImage.image = image
        
        return cell

    }
}


