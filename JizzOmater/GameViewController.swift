//
//  GameViewController.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/14/16.
//  Copyright (c) 2016 Jessica Wilson. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var maxValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewController: UIViewController?

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            
//            scene.viewController = self

            
            skView.presentScene(scene)
            
            let seconds = 4.0
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                
                // here code perfomed with delay
                print("4")
                print(self.maxValue)
                if self.maxValue <= 200{ //loser segue
                self.performSegueWithIdentifier("gameSceneToFinalSegue", sender: viewController)
                }
                else{ //winner segue
                self.performSegueWithIdentifier("gameSceneToWinnerSegue", sender: viewController)
                }
                
            })
            
            
            
        }
    }
    

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    
    

    
}
