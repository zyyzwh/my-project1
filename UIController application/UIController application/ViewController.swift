//
//  ViewController.swift
//  UIController application
//
//  Created by Amy on 16/8/9.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

     //当图片过大时，可以左右滑动图片，
        let myimage = UIImage(named:"Fushan.jpg")
        
        
        let imageView = UIImageView(frame:CGRect(x: 0, y: 0, width: (myimage?.size.width)!, height: (myimage?.size.width)!))
        
        imageView.image = myimage
        
        self.scrollview.contentSize = (myimage?.size)!
        
        self.scrollview.addSubview(imageView)
        
        self.scrollview.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

