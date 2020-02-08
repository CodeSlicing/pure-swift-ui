//
//  String+ConvenienceTests.swift
//
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class StringConvenienceExtensionsTests: XCTestCase {
    
}


// MARK: ----- NOT EMPTY

extension StringConvenienceExtensionsTests {
    func testIsNotEmpty() {
        XCTAssertTrue("hello".isNotEmpty)
    }
}
