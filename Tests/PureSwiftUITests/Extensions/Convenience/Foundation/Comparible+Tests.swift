//
//  Comparible+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class ComparibleConvenienceExtensionsTests: XCTestCase {

    func testFrom() {
        XCTAssertEqual(2, 2.clamped(min: 0))
        XCTAssertEqual(4, 3.clamped(min: 4))
        XCTAssertEqual(2, 2.clamped(min: 0))
        XCTAssertEqual(2, 2.clamped(min: -3))
    }
    
    func testTo() {
        XCTAssertEqual(1, 2.clamped(max: 1))
        XCTAssertEqual(3, 3.clamped(max: 10))
        XCTAssertEqual(2, 2.clamped(max: 3))
        XCTAssertEqual(-3, 2.clamped(max: -3))
    }
    
    @available(*, deprecated)
    func testClampedDeprecated() {
        XCTAssertEqual(1, 2.clamped(from: 0, to: 1))
        XCTAssertEqual(4, 3.clamped(from: 4, to: 10))
        XCTAssertEqual(2, 2.clamped(from: 0, to: 3))
        XCTAssertEqual(2, 2.clamped(from: -3, to: 3))
    }
    
    func testClamped() {
        XCTAssertEqual(1, 2.clamped(min: 0, max: 1))
        XCTAssertEqual(4, 3.clamped(min: 4, max: 10))
        XCTAssertEqual(2, 2.clamped(min: 0, max: 3))
        XCTAssertEqual(2, 2.clamped(min: -3, max: 3))
    }
}

