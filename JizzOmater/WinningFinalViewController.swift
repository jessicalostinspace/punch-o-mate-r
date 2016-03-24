//
//  WinningFinalViewController.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class WinningFinalViewController: UIViewController {

    
    @IBAction func playAgainButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("unwindToWinnerLogin", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
