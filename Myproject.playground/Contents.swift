//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var sum=0
for i in 2...100
{
    for j in 2.stride(to: i, by: 1)
  { if i%j==0
      {break}
    else
      {
        print(i)
        sum=sum+i
        break
      }
    }
}
print(sum)

let string1="hello"
let string2="word"
var  welcome = string1+"  "+string2  //通过运算符串联字符串
var string3="it's my"
string3+="  "+string2      //通过加法赋值

let  exclamationMark: Character = "!"    //用append方法加一个字符到字符串中
welcome.append(exclamationMark)

let multiplier = 3
let message = "\(multiplier)乘以2.5是\(Double(multiplier)*2.5)"   //字符串插值 multiplier作为\(multiplier)被插入到字符串变量当中

func getAHighScore()->(String ,Int )
{let theName="Patricia"
let theScore=345
return (theName, theScore)
}



        
