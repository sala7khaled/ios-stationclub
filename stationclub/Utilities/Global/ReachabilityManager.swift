//
//  ReachabilityManager.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation
import SystemConfiguration

protocol ReachabilityManagerListener {
    func notifyChange(with flags: SCNetworkReachabilityFlags)
}

class ReachabilityManager {
    
    private let reachability = SCNetworkReachabilityCreateWithName(nil, hostName)
    private let queue = DispatchQueue.main
    private var currentReachabilityFlags: SCNetworkReachabilityFlags?
    
    private static let hostName = "www.google.com"
    private var isListening = false
    private var listener: ReachabilityManagerListener?
    
    // MARK: Starts listening
    
    func start(listener: ReachabilityManagerListener? = nil) {
        guard !isListening else { return }
        guard let reachability = reachability else { return }
        
        self.listener = listener
        
        var context = SCNetworkReachabilityContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
        context.info = UnsafeMutableRawPointer(Unmanaged<ReachabilityManager>.passUnretained(self).toOpaque())
        
        let callbackClosure: SCNetworkReachabilityCallBack? = {
            (reachability:SCNetworkReachability, flags: SCNetworkReachabilityFlags, info: UnsafeMutableRawPointer?) in
            guard let info = info else { return }
            
            let handler = Unmanaged<ReachabilityManager>.fromOpaque(info).takeUnretainedValue()
            
            DispatchQueue.main.async {
                handler.checkReachability(flags: flags)
            }
        }
        
        if !SCNetworkReachabilitySetCallback(reachability, callbackClosure, &context) {
            Console.log("ReachabilityManager", "Not able to set the callback")
        }
        
        if !SCNetworkReachabilitySetDispatchQueue(reachability, queue) {
            Console.log("ReachabilityManager", "Not able to set the queue")
        }
        
        queue.async {
            self.currentReachabilityFlags = nil
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability, &flags)
            self.checkReachability(flags: flags)
        }
        
        isListening = true
    }
    
    // MARK: Called inside `callbackClosure`
    
    private func checkReachability(flags: SCNetworkReachabilityFlags) {
        if currentReachabilityFlags != flags {
            // 🚨 Network state is changed 🚨
            currentReachabilityFlags = flags
            listener?.notifyChange(with: flags)
        }
    }
    
    // MARK: Stops listening
    
    func stop() {
        guard isListening,
            let reachability = reachability
            else { return }
        
        SCNetworkReachabilitySetCallback(reachability, nil, nil)
        SCNetworkReachabilitySetDispatchQueue(reachability, nil)
        isListening = false
    }
    
    static func isOnline() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}

