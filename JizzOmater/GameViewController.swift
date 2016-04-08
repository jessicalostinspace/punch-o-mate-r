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
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var maxValue = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            
            scene.gameViewController = self
            
            skView.presentScene(scene)
            
            let seconds = 5.0
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                
                // here code perfomed with delay
                self.segue()
//              self.performSegueWithIdentifier("gameSceneToFinalSegue", sender: nil)
                
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "gameSceneToFinalSegue"{
            let navController = segue.destinationViewController as! UINavigationController
            let controller = navController.topViewController as! FinalViewController
            
            var highScore = defaults.objectForKey("High_Score")
            
            controller.maxValue = highScore as! Int
            print("----\(highScore!)------")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    func segue(){
        self.performSegueWithIdentifier("gameSceneToFinalSegue", sender: self)
    }
    
    

    
}
