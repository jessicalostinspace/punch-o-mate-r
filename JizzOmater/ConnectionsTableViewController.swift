//
//  ConnectionsTableViewController.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 4/5/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit
import MultipeerConnectivity


class ConnectionsTableViewController: UIViewController, UITableViewDataSource, MCSessionDelegate, MCNearbyServiceBrowserDelegate, MCNearbyServiceAdvertiserDelegate{
    
    @IBAction func unwindToGame(segue: UIStoryboardSegue){}

    var nickName: String?
    
    @IBOutlet var connectionsTableView: UITableView!
    
    var isAdvertising: Bool!
    var peer: MCPeerID!
    var session: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var browser: MCNearbyServiceBrowser!
    var foundPeers = [MCPeerID]()
    var advertiser: MCNearbyServiceAdvertiser!
    var invitationHandler: (Bool, MCSession)->Void = { status, session in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in table controller")
        print(nickName!)
        
//        showConnectionPrompt()

        //peer name is name from input field
        peer = MCPeerID(displayName: nickName!)
        
        //start session
        session = MCSession(peer: peer, securityIdentity: nil, encryptionPreference: .Required)
        session.delegate = self
        
        //set device as browser with unique connection "spermatazoa"
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: "spermatazoa")
        browser.delegate = self
        
        browser.startBrowsingForPeers()
        
        //discoveryInfo, is a dictionary that can contain any kind of extra information you want to pass to the other peers upon discovery
        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: "spermatazoa")
        advertiser.delegate = self
        
        advertiser.startAdvertisingPeer()
        
        //start advertising
        isAdvertising = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playSoloButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("connectionsTableViewSegue", sender: self)
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return foundPeers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConnectionsCell")!
        
        cell.textLabel?.text = self.foundPeers[indexPath.row].displayName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedPeer = foundPeers[indexPath.row] as MCPeerID
        
        //withContext: This parameter can be used if you want to send some extra data to the invited peer. It requires a NSData object.
        browser.invitePeer(selectedPeer, toSession: session, withContext: nil, timeout: 20)
    }
    
    // MARK: Advertiser delegate methods
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: NSData?, invitationHandler: (Bool, MCSession) -> Void){
        
        self.invitationHandler = invitationHandler
        invitationWasReceived(peer.displayName)
        
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: NSError) {
        print(error.localizedDescription)
    }
    
    //Change advertising settings
    @IBAction func startStopAdvertising(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "", message: "Change Visibility", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var actionTitle: String
        if isAdvertising == true {
            actionTitle = "Make me invisible to others"
        }
        else{
            actionTitle = "Make me visible to others"
        }
        
        //correct action Title allows peer to stop or start advertising
        let visibilityAction: UIAlertAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            if self.isAdvertising == true {
                self.advertiser.stopAdvertisingPeer()
            }
            else{
                self.advertiser.startAdvertisingPeer()
            }
            
            self.isAdvertising = !self.isAdvertising
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        actionSheet.addAction(visibilityAction)
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }

    
    
    //MARK: Session Delegate Methods
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        
    }
    
//    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
//        switch state {
//        case MCSessionState.Connected:
//            print("Connected: \(peerID.displayName)")
//            self.performSegueWithIdentifier("connectionsTableViewSegue", sender: self)
//            
//        case MCSessionState.Connecting:
//            print("Connecting: \(peerID.displayName)")
//            
//        case MCSessionState.NotConnected:
//            print("Not Connected: \(peerID.displayName)")
//        }
//    }
    
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        switch state{
        case MCSessionState.Connected:
            print("Connected to session: \(session)")
            connectedWithPeer(peerID)
            
        case MCSessionState.Connecting:
            print("Connecting to session: \(session)")
            
        default:
            print("Did not connect to session: \(session)")
        }
    }
    
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        //        if let image = UIImage(data: data) {
        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            //                self.images.insert(image, atIndex: 0)
            self.connectionsTableView.reloadData()
            //            }
        }
    }
    
    //MARK: Browser Delegate Methods
    
    // Found a nearby advertising peer.
    func browser(browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?){
        foundPeers.append(peerID)

        print(foundPeers)
        
        connectionsTableView.reloadData()
    }
    
    // A nearby peer has stopped advertising.
    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        for (index, aPeer) in foundPeers.enumerate(){
            if aPeer == peerID {
                foundPeers.removeAtIndex(index)
                break
            }
        }
        
        connectionsTableView.reloadData()
    }
    //function prints error if not able to browse for peers
    func browser(browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: NSError) {
        print(error.localizedDescription)
    }
    
    // The methods -startBrowsingForPeers and -stopBrowsingForPeers are used to
    // start and stop looking for nearby advertising peers.
    func startBrowsingForPeers(){
        
    }
    
    func stopBrowsingForPeers(){
        
    }
    

    // MARK: Invitation Handler
    func invitationWasReceived(fromPeer: String) {
        let alert = UIAlertController(title: "", message: "\(fromPeer) wants to jizz on you!", preferredStyle: UIAlertControllerStyle.Alert)
        
        let acceptAction: UIAlertAction = UIAlertAction(title: "Bring it on", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.invitationHandler(true, self.session)
        }
        
        let declineAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            self.invitationHandler(false, self.session)
        }
        
        alert.addAction(acceptAction)
        alert.addAction(declineAction)
        
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // connectionsToGameSegue
        
        //        let destinationNavigationController = segue.destinationViewController as! UINavigationController
        //        let targetController = destinationNavigationController.topViewController
        //    }
    }
    
    //When connected, segue to next view controller
    func connectedWithPeer(peerID: MCPeerID) {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.performSegueWithIdentifier("connectionsTableViewSegue", sender: self)
        }
    }
    
    
}