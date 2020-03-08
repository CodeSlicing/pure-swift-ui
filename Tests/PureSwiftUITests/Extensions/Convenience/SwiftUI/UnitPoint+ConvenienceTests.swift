//
//  UnitPoint+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class UnitPointConvenienceExtensionsTests: XCTestCase {

    let x: CGFloat = 0.5
    let y: CGFloat = 0.7
}

// MARK: ----- INIT

extension UnitPointConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(UnitPoint(x, y), UnitPoint(x: x, y: y))
     }
}

// MARK: ----- COERCION

extension UnitPointConvenienceExtensionsTests {
    
    func testAsCGPoint() {
        XCTAssertEqual(UnitPoint(0.3, 0.5).asCGPoint, CGPoint(0.3, 0.5))
    }
}

// MARK: ----- AS ANGLE

extension UnitPointConvenienceExtensionsTests {
    
    func testAsAngleForNamedUnitPoints() {
        XCTAssertEqual(UnitPoint.topLeading.asAngle, .topLeading)
        XCTAssertEqual(UnitPoint.top.asAngle, .top)
        XCTAssertEqual(UnitPoint.topTrailing.asAngle, .topTrailing)
        XCTAssertEqual(UnitPoint.trailing.asAngle, .trailing)
        XCTAssertEqual(UnitPoint.bottomTrailing.asAngle, .bottomTrailing)
        XCTAssertEqual(UnitPoint.bottom.asAngle, .bottom)
        XCTAssertEqual(UnitPoint.bottomLeading.asAngle, .bottomLeading)
        XCTAssertEqual(UnitPoint.leading.asAngle, .leading)
    }

    func testAsAngle() {
        assertEqual(UnitPoint(0.1, 0.1).asAngle.asUnitPoint, Angle.topLeading.asUnitPoint)
        assertEqual(UnitPoint(0.5, 0.1).asAngle.degrees, Angle.top.degrees)
        assertEqual(UnitPoint(0.9, 0.1).asAngle.degrees, Angle.topTrailing.degrees)
        assertEqual(UnitPoint(0.9, 0.5).asAngle.degrees, Angle.trailing.degrees)
        assertEqual(UnitPoint(0.9, 0.9).asAngle.degrees, Angle.bottomTrailing.degrees)
        assertEqual(UnitPoint(0.5, 0.9).asAngle.degrees, Angle.bottom.degrees)
        assertEqual(UnitPoint(0.1, 0.9).asAngle.degrees, Angle.bottomLeading.degrees)
        assertEqual(UnitPoint(0, 0.5).asAngle.degrees, Angle.leading.degrees)
    }
}

// MARK: ----- INVERTED

extension UnitPointConvenienceExtensionsTests {
    
    func testInvertedForNamedUnitPoints() {
        XCTAssertEqual(UnitPoint.topLeading.inverted(), .bottomTrailing)
        XCTAssertEqual(UnitPoint.top.inverted(), .bottom)
        XCTAssertEqual(UnitPoint.topTrailing.inverted(), .bottomLeading)
        XCTAssertEqual(UnitPoint.trailing.inverted(), .leading)
        XCTAssertEqual(UnitPoint.bottomTrailing.inverted(), .topLeading)
        XCTAssertEqual(UnitPoint.bottom.inverted(), .top)
        XCTAssertEqual(UnitPoint.bottomLeading.inverted(), .topTrailing)
        XCTAssertEqual(UnitPoint.leading.inverted(), .trailing)
    }
    
    func testInverted() {
        assertEqual(UnitPoint(0.1, 0.1).inverted(), UnitPoint(0.9, 0.9))
        assertEqual(UnitPoint(0.5, 0.1).inverted(), UnitPoint(0.5, 0.9))
        assertEqual(UnitPoint(0.9, 0.1).inverted(), UnitPoint(0.1, 0.9))
        assertEqual(UnitPoint(0.9, 0.5).inverted(), UnitPoint(0.1, 0.5))
        assertEqual(UnitPoint(0.9, 0.9).inverted(), UnitPoint(0.1, 0.1))
        assertEqual(UnitPoint(0.5, 0.9).inverted(), UnitPoint(0.5, 0.1))
        assertEqual(UnitPoint(0.1, 0.9).inverted(), UnitPoint(0.9, 0.1))
        assertEqual(UnitPoint(0, 0.5).inverted(), UnitPoint(1, 0.5))
    }
}
