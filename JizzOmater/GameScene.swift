//
//  GameScene.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/14/16.
//  Copyright (c) 2016 Jessica Wilson. All rights reserved.
//

import SpriteKit
import CoreMotion
import CoreData
import UIKit

class GameScene: SKScene {
    
    let manager = CMMotionManager()

    var myLabel = SKLabelNode()
    
    var sentScore = 0;
    
    var gameViewController: GameViewController!

    var defaults = NSUserDefaults.standardUserDefaults()
    
//    var viewController: UIViewController?
    
    var maxValue = 0;
    var maxValues = [Int]();
    
    var accelerometerX: UIAccelerationValue = 0
    var accelerometerY: UIAccelerationValue = 0
    
    override func didMoveToView(view: SKView) {
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 100, CGFloat((data?.acceleration.x)!)*100)
            self.updatePlayerAccelerationFromMotionManager()
        }
        
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.fontSize = 100
        myLabel.position = CGPointMake(500,500)
        myLabel.fontColor = SKColor.blackColor()
        myLabel.text = String("Score: \(maxValue)")
        self.addChild(myLabel)
        
    }
    
    
    func updatePlayerAccelerationFromMotionManager() {
        if let acceleration = manager.accelerometerData?.acceleration {
            
            
            let FilterFactor = 0.75
            
            accelerometerX = acceleration.x * FilterFactor + accelerometerX * (1 - FilterFactor)
            accelerometerY = acceleration.y * FilterFactor + accelerometerY * (1 - FilterFactor)

            
            if(Int(accelerometerX * 100.0) + Int(accelerometerY * 100.0) > self.maxValue) {
                self.maxValue = Int(accelerometerX * 100.0 + accelerometerY * 100.0)
                self.saveMaxValue(self.maxValue)
                myLabel.text = String("Score: \(self.maxValue)")
                
                defaults.setObject(maxValue, forKey : "High_Score")
            }
        }
        
        
    }
    

    
    func saveMaxValue(value: Int) {
        print("Max Value \(value)")
        self.maxValues.append(value)
//        myLabel.text = String("Score: \(maxValues)")
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
    }
    
    

    
}