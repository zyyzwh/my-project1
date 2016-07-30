//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

var a:Int
a=5

print(a)
 let b=6
a=5
//b=6
if a>6
{

    print("a>6")
}else
{
    print("a<=6")
}
var sum:Int=0
for var i=0;i<10;i=i+1
    {sum+=i}
print(sum)
var n:Int
var arr=[1,2,3]
print(arr[1])

arr.append (4)


var brr=[31,16,28,5,15,21,2]
var  temp=0
for var i=0;i<brr.count-1;i=i+1
{
    for var j=0;j<brr.count-1-i;j=j+1
    {
    if(brr[j]>brr[j+1])
    {
    temp=brr[j]
    brr[j]=brr[j+1]
    brr[j+1]=temp
    }
    }
}
print(brr)
for var i=0;i<brr.count; i=i+1
{print(brr[i],",",terminator:"")}
