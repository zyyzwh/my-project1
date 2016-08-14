//
//  GameScene.swift
//  StarWars
//
//  Created by Amy on 16/8/11.
//  Copyright (c) 2016年 Amy. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //node节点的意思 labelnode 文本节点
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // http://iosfonts.com 可以添加不同的字体,Zapfino为字体名称
        let myLabel = SKLabelNode(fontNamed:"Zapfino")
        
       //myLabel.text = "Hello, World!"
        myLabel.text = "my first game!"
        
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    //界面被点击调用的方法
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)                       //locationInNode 获取节点位置
            
          //  let sprite = SKSpriteNode(imageNamed:"Spaceship")
            let sprite = SKSpriteNode(imageNamed:"Xican")                   //加载图片

            
            sprite.xScale = 0.5                                             //图片长宽的缩小比例
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:0.1)    //旋转几周 PI，旋转时间
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
