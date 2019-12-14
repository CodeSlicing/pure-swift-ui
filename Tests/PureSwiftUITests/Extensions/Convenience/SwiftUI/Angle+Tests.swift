//
//  Angle+Tests.swift
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
