//
//  FloatingPoint+Tests.swift
//
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class FloatingPointConvenienceExtensionsTests: XCTestCase {
    
    func testIsPositive() {

        XCTAssertTrue(1.0.isPositive)
        XCTAssertFalse((-1.0).isPositive)
    }
    
    func testIsNegative() {

        XCTAssertFalse(1.0.isNegative)
        XCTAssertTrue((-1.0).isNegative)
    }
    
    func testClampPositive() {
        XCTAssertEqual(0.0, (-1.0).clampedPositive)
        XCTAssertEqual(1.0, 1.0.clampedPositive)
    }
    
    func testClampNegative() {
        XCTAssertEqual(0.0, 1.0.clampedNegative)
        XCTAssertEqual(-1.0, (-1.0).clampedNegative)
    }
}
