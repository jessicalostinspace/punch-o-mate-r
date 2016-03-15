//
//  GameScene.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/14/16.
//  Copyright (c) 2016 Jessica Wilson. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    let manager = CMMotionManager()
    
    
    override func didMoveToView(view: SKView) {
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.2
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 20, CGFloat((data?.acceleration.y)!)*20)
        }
        
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
