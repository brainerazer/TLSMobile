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
    
    func setupTCPConn(_ hostname : String, _ port : Int) {
        var readStream : Unmanaged<CFReadStream>
        var writeStream : Unmanaged<CFWriteStream>
    }
}
