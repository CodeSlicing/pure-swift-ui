//
//  String+ConvenienceTests.swift
//
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest

class StringConvenienceExtensionsTests: XCTestCase {
    
}


// MARK: ----- NOT EMPTY

extension StringConvenienceExtensionsTests {
    func testIsNotEmpty() {
        XCTAssertTrue("hello".isNotEmpty)
        XCTAssertFalse("".isNotEmpty)
    }
}
