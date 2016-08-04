//
//  ViewController.swift
//  PrimeNumberResolver
//
//  Created by Amy on 16/8/1.
//  Copyright © 2016年 Amy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{ //不需要点击就能出现素数的判断，新加的功能

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate=self  //不需要点击出结果添加的语句
    }
    
    //单击空白部分出结果
//    func  textFieldDidEndEditing(textField: UITextField) { //textfield委托
//        let text = textField.text
//        let result = self.calculatePrimeNumberWithText(text!)
//        
//        if result == true {
//            self.label.text = "shi"
//        }else {
//            self.label.text = "fou"
//        }
//    }
    
    
    // 不需要单击就可以直接出结果
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text!+string
        
        let result = self.calculatePrimeNumberWithText(text)
        if result {
                self.label.text = "shi"
        }else {
                self.label.text = "fou"
            }
        return true
    }
    

    @IBAction func calculate(sender: UIButton) {
       let text=self.textField.text
        let number = Int(text!)!
        var  flag = false
        
        for i in 2...number-1{
          if number%i==0
          {
            flag=true
                break
            }else{
                flag=false
            }
            
        }
        if flag{
        self.label.text="fou"}
        else {
        self.label.text="shi"}
    }
//1-100之间质数之和 button－sum的功能
//    @IBAction func sum(sender: AnyObject) {
//        var sum=0
//        for i in 2...100
//        {
//            for j in 2.stride(to: i, by: 1)
//            { if i%j==0
//            {break}
//            else
//            {
//                //print(i)
//                sum=sum+i
//                break
//                }
//            }
//        }
//        print(sum)
//        self.label2.text = String(sum)
//    
//        
//        // print(sum)
//        
//    }
    private func calculatePrimeNumberWithText(text:String)->Bool {
        
        let text = text
        if text == "" {
            return false
        }
        
        let number = Int(text)!
        
        if number < 3 {
            return true
        }
        var  flag = false
        
        for i in 2...number - 1{
            if number % i == 0
            {
                flag=true
                break
            }else{
                flag=false
            }
            
        }
        if flag{
            return false
        }
        else {
            return true
        }
    }
    //不需要点击就可出结果
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//      self.view.endEditing(true)
//   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

