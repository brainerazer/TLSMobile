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
        
        let begin : String = "1603010139010001350303"
        let end : String = "000098cc14cc13cc15c030c02cc028c024c014c00a00a3009f006b006a00390038ff8500c400c3008800870081c032c02ec02ac026c00fc005009d003d003500c00084c02fc02bc027c023c013c00900a2009e006700400033003200be00bd00450044c031c02dc029c025c00ec004009c003c002f00ba0041c011c007c00cc00200050004c012c00800160013c00dc003000a00150012000900ff01000074000b000403000102000a003a0038000e000d0019001c000b000c001b00180009000a001a00160017000800060007001400150004000500120013000100020003000f0010001100230000000d00260024060106020603efef050105020503040104020403eeeeeded030103020303020102020203"
        
        let payload : String = begin + clientRandom.hexEncodedString() + end
        
        return payload.fromHexToData
    }
}
