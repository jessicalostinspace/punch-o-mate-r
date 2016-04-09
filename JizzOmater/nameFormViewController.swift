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
    
    @IBAction func unwindToGame(segue: UIStoryboardSegue){}

    @IBOutlet weak var nicknameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickName = ""
        
    }
    
    @IBAction func playButtonPressed() {
        nickName = String(nicknameTextField.text!)
        segue()
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

