//
//  TLSMobileTests.swift
//  TLSMobileTests
//
//  Created by Bohdan Rybak on 21.10.17.
//  Copyright © 2017 Bohdan Rybak. All rights reserved.
//

import XCTest
@testable import TLSMobile

class TLSMobileTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHexEncodingAndDecodingWorkCorrect() {
        let bytes = TLSMobile.generateRandomBytes()!
        XCTAssertTrue(bytes.hexEncodedString().fromHexToData == bytes)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
