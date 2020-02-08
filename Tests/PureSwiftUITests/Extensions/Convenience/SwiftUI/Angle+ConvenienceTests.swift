//
//  Angle+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class AngleConvenienceExtensionsTests: XCTestCase {
    
    func testOperatorMultiply() {
        XCTAssertEqual(4.degrees, 2.degrees * 2)
    }

    func testOperatorDivide() {
        XCTAssertEqual(2.degrees, 4.degrees / 2)
    }
    
    func testCos() {
        XCTAssertEqual(2.degrees.cos, cos(Angle(degrees: 2.0).radians))
    }
    
    func testSin() {
        XCTAssertEqual(2.degrees.sin, sin(Angle(degrees: 2.0).radians))
    }
    
    func testTan() {
        XCTAssertEqual(2.degrees.tan, tan(Angle(degrees: 2.0).radians))
    }
}

// MARK: ----- STATIC CONSTANTS

extension AngleConvenienceExtensionsTests {

    func testStaticConstants() {
        XCTAssertEqual(Angle.topLeading, 315.degrees)
        XCTAssertEqual(Angle.top, 0.degrees)
        XCTAssertEqual(Angle.topTrailing, 45.degrees)
        XCTAssertEqual(Angle.trailing, 90.degrees)
        XCTAssertEqual(Angle.bottomTrailing, 135.degrees)
        XCTAssertEqual(Angle.bottom, 180.degrees)
        XCTAssertEqual(Angle.bottomLeading, 225.degrees)
        XCTAssertEqual(Angle.leading, 270.degrees)
    }
}

// MARK: ----- CYCLE

extension AngleConvenienceExtensionsTests {

    func testCycle() {
        XCTAssertEqual(Angle.cycle(0.25), 90.degrees)
        XCTAssertEqual(Angle.cycle(0.5), 180.degrees)
        XCTAssertEqual(Angle.cycle(0.75), 270.degrees)
    }
}
