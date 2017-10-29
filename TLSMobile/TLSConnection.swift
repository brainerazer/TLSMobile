//
//  TLSConnection.swift
//  TLSMobile
//
//  Created by Bohdan Rybak on 29.10.17.
//  Copyright © 2017 Bohdan Rybak. All rights reserved.
//

import UIKit

class TLSConnection: NSObject {
    var inputStream: InputStream!
    var outputStream: OutputStream!
    
    let maxReadLength = 4096
    
    func setupTCPConn(_ hostname : String, _ port : UInt32) {
        var readStream : Unmanaged<CFReadStream>?
        var writeStream : Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, hostname as CFString, port,
                                           &readStream, &writeStream)
        
        self.inputStream = readStream!.takeRetainedValue()
        self.outputStream = writeStream!.takeRetainedValue()
        
        self.inputStream.schedule(in: .current, forMode: .commonModes)
        self.outputStream.schedule(in: .current, forMode: .commonModes)
        
        self.inputStream.open()
        self.outputStream.open()
    }
    
    func sendClientHello(_ randomBytes: Data) {
        
    }
}
