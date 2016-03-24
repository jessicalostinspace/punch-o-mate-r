//
//  UsersConnectedTableViewController.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/14/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

//import UIKit
//
//class UsersConnectedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MPCManagerDelegate {
//    
//    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//    
//    var isAdvertising: Bool!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        appDelegate.mpcManager.delegate = self
//        appDelegate.mpcManager.browser.startBrowsingForPeers()
//        
//        appDelegate.mpcManager.advertiser.startAdvertisingPeer()
//        
//        isAdvertising = true
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: IBAction method implementation
//    
//    @IBAction func startStopAdvertising(sender: AnyObject) {
//        
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return appDelegate.mpcManager.foundPeers.count
//    }
//
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier("idCellPeer") as UITableViewCell
//        
//        cell.textLabel?.text = appDelegate.mpcManager.foundPeers[indexPath.row].displayName
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 60.0
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let selectedPeer = appDelegate.mpcManager.foundPeers[indexPath.row] as MCPeerID
//        
//        appDelegate.mpcManager.browser.invitePeer(selectedPeer, toSession: appDelegate.mpcManager.session, withContext: nil, timeout: 20)
//    }
//
//    func foundPeer() {
//        tblPeers.reloadData()
//    }
//    
//    
//    func lostPeer() {
//        tblPeers.reloadData()
//    }
//    
//    @IBAction func startStopAdvertising(sender: AnyObject) {
//        let actionSheet = UIAlertController(title: "", message: "Change Visibility", preferredStyle: UIAlertControllerStyle.ActionSheet)
//        
//        var actionTitle: String
//        if isAdvertising == true {
//            actionTitle = "Make me invisible to others"
//        }
//        else{
//            actionTitle = "Make me visible to others"
//        }
//        
//        let visibilityAction: UIAlertAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default) { (alertAction) -> Void in
//            if self.isAdvertising == true {
//                self.appDelegate.mpcManager.advertiser.stopAdvertisingPeer()
//            }
//            else{
//                self.appDelegate.mpcManager.advertiser.startAdvertisingPeer()
//            }
//            
//            self.isAdvertising = !self.isAdvertising
//        }
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
//            
//        }
//        
//        actionSheet.addAction(visibilityAction)
//        actionSheet.addAction(cancelAction)
//        
//        self.presentViewController(actionSheet, animated: true, completion: nil)
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
