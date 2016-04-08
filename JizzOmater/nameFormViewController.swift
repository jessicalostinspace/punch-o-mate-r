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
    
    var nickName: String?
    
    @IBAction func unwindToGame(segue: UIStoryboardSegue){}
    @IBAction func  unwindToWinnerLogin(segue: UIStoryboardSegue){}
    @IBOutlet weak var nicknameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickName = ""
        
    }
    
    @IBAction func playButtonPressed(sender: UIButton) {
        nickName = nicknameTextField.text!
        
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let destinationNavigationController = segue.destinationViewController as! UINavigationController
//        let targetController = destinationNavigationController.topViewController
//    }
    
}

