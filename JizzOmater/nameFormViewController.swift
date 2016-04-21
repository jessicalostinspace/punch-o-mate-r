//
//  nameFormViewController.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/14/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit
import MultipeerConnectivity


class nameFormViewController: UIViewController{
    
    var nickName = ""

    @IBOutlet weak var nicknameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickName = ""
        
    }
    
    @IBAction func playButtonPressed() {
        //if nickName is not empty, segue to connections scene
        if !(nicknameTextField.text!.isEmpty) {
            nickName = String(nicknameTextField.text!)
            segue()
        }
        else{ //else present modal that prompts user to enter name
            let alert = UIAlertController(title: "Jizz Time Error", message: "Please enter a nickname!", preferredStyle: UIAlertControllerStyle.Alert)
            
            let acceptAction: UIAlertAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
                
            }
            
            alert.addAction(acceptAction)

            NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        

            let navController = segue.destinationViewController as! UINavigationController
            let controller = navController.topViewController as! ConnectionsTableViewController
            
            controller.nickName = nickName
  
        
    }
    
    func segue(){
        self.performSegueWithIdentifier("connectionsTableViewSegue", sender: nil)
    }
    
}

