//
//  FinalViewController.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var maxValue: Int!
    var nickName: String?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var finalImage: UIImageView!
    
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("unwindToGame", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score: \(maxValue)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    

}
