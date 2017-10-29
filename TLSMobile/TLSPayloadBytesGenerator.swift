//
//  TLSPayloadBytesGenerator.swift
//  TLSMobile
//
//  Created by Bohdan Rybak on 29.10.17.
//  Copyright © 2017 Bohdan Rybak. All rights reserved.
//

import Foundation

class TLSPayloadBytesGenerator: NSObject {
    static func getClientHelloBytes(_ clientRandom : Data) -> Data {
        assert(clientRandom.count == 32) // Protocol requirement
        
        return Data()
    }
}
