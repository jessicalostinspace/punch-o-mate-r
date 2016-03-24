//
//  MPCManager.swift
//  JizzOmater
//
//  Created by Jessica Wilson on 3/14/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

//import UIKit
//import MultipeerConnectivity
//
//protocol MPCManagerDelegate {
//    func foundPeer()
//    
//    func lostPeer()
//    
//    func invitationWasReceived(fromPeer: String)
//    
//    func connectedWithPeer(peerID: MCPeerID)
//}
//
//class MPCManager: NSObject, MCSessionDelegate, MCNearbyServiceBrowserDelegate, MCNearbyServiceAdvertiserDelegate {
//    
//    // MARK: Declaring Objects/Variables
//    var session: MCSession!
//    
//    var peer: MCPeerID!
//    
//    var browser: MCNearbyServiceBrowser!
//    
//    var advertiser: MCNearbyServiceAdvertiser!
//    
//    var foundPeers = [MCPeerID]()
//    
//    var invitationHandler: ((Bool, MCSession!)->Void)!
//    
//    var delegate: MPCManagerDelegate?
//    
//    // MARK: Initialize Variables
//    override init() {
//        super.init()
//        
//        //Get this from text field (nickname)
//        peer = MCPeerID(displayName: UIDevice.currentDevice().name)
//        
//        session = MCSession(peer: peer)
//        //this class must be a delegate of the session object
//        session.delegate = self
//        //first parameter accepts peer
//        //second parameter uniquely identifies the application among others so the MPC knows what to search for
//        browser = MCNearbyServiceBrowser(peer: peer, serviceType: "appcoda-mpc")
//        //this class must be a delegate of the browser object
//        browser.delegate = self
//        //discoveryInfo is a dictionary that can contain any kind of extra information you want to pass to the other peers upon discovery.
//        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: "appcoda-mpc")
//        advertiser.delegate = self
//        
//    }
//    
//    //function called when other browser discovered
//    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
//        foundPeers.append(peerID)
//        
//        delegate?.foundPeer()
//    }
//    
//    //function called when other browser loses connectivity
//    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
//        for (index, aPeer) in foundPeers.enumerate(){
//            if aPeer == peerID {
//                foundPeers.removeAtIndex(index)
//                break
//            }
//        }
//        
//        delegate?.lostPeer()
//    }
//    // function called if browser fails to connect
//    func browser(browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: NSError) {
//        print(error.localizedDescription)
//    }
//
//}
