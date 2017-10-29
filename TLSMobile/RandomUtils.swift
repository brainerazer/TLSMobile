//
//  RandomUtils.swift
//  TLSMobile
//
//  Created by Bohdan Rybak on 29.10.17.
//  Copyright © 2017 Bohdan Rybak. All rights reserved.
//

import Foundation

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}

extension String {
    var fromHexToData: Data {
        let hexa = Array(characters)
        let uintarr : [UInt8] = stride(from: 0, to: characters.count, by: 2).flatMap { UInt8(String(hexa[$0..<$0.advanced(by: 2)]), radix: 16) }
        return uintarr.withUnsafeBufferPointer {Data(buffer: $0)}
    }
}

func generateRandomBytes() -> Data? {
    var keyData = Data(count: 32)
    let result = keyData.withUnsafeMutableBytes {
        (mutableBytes: UnsafeMutablePointer<UInt8>) -> Int32 in
        SecRandomCopyBytes(kSecRandomDefault, keyData.count, mutableBytes)
    }
    if result == errSecSuccess {
        return keyData
    } else {
        print("Problem generating random bytes")
        return nil
    }
}
