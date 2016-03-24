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
    
    @IBAction func unwindToGame(segue: UIStoryboardSegue){}
    @IBAction func  unwindToWinnerLogin(segue: UIStoryboardSegue){}
    
    var userName = ""
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBAction func playButtonPressed(sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}

