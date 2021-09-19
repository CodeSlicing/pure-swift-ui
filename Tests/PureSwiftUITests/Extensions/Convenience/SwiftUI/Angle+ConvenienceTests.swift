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

    @available(*, deprecated)
    func testCycle() {
        XCTAssertEqual(Angle.cycle(0.25), 90.degrees)
        XCTAssertEqual(Angle.cycle(0.5), 180.degrees)
        XCTAssertEqual(Angle.cycle(0.75), 270.degrees)
        XCTAssertEqual(Angle.cycle(-0.75), -270.degrees)
    }
    
    func testCycles() {
        XCTAssertEqual(Angle.cycles(0.25), 90.degrees)
        XCTAssertEqual(Angle.cycles(0.5), 180.degrees)
        XCTAssertEqual(Angle.cycles(0.75), 270.degrees)
        XCTAssertEqual(Angle.cycles(-0.75), -270.degrees)
    }
    
    func testCyclesProperty() {
        XCTAssertEqual(Angle.cycles(0.25).cycles, 0.25)
        XCTAssertEqual(Angle.cycles(0.5).cycles, 0.5)
        XCTAssertEqual(Angle.cycles(0.75).cycles, 0.75)
        XCTAssertEqual(Angle.cycles(-0.75).cycles, -0.75)
    }
}

// MARK: ----- AS UNIT POINT

extension AngleConvenienceExtensionsTests {
    
    func testAsUnitPointForNamedAngles() {
        XCTAssertEqual(Angle.topLeading.asUnitPoint, .topLeading)
        XCTAssertEqual(Angle.top.asUnitPoint, .top)
        XCTAssertEqual(Angle.topTrailing.asUnitPoint, .topTrailing)
        XCTAssertEqual(Angle.trailing.asUnitPoint, .trailing)
        XCTAssertEqual(Angle.bottomTrailing.asUnitPoint, .bottomTrailing)
        XCTAssertEqual(Angle.bottom.asUnitPoint, .bottom)
        XCTAssertEqual(Angle.bottomLeading.asUnitPoint, .bottomLeading)
        XCTAssertEqual(Angle.leading.asUnitPoint, .leading)
    }

    func testAsUnitPoint() {
        assertEqual((Angle.topLeading + 360.degrees).asUnitPoint, .topLeading)
        assertEqual((Angle.top + 360.degrees).asUnitPoint, .top)
        assertEqual((Angle.topTrailing + 360.degrees).asUnitPoint, .topTrailing)
        assertEqual((Angle.trailing + 360.degrees).asUnitPoint, .trailing)
        assertEqual((Angle.bottomTrailing + 360.degrees).asUnitPoint, .bottomTrailing)
        assertEqual((Angle.bottom + 360.degrees).asUnitPoint, .bottom)
        assertEqual((Angle.bottomLeading + 360.degrees).asUnitPoint, .bottomLeading)
        assertEqual((Angle.leading + 360.degrees).asUnitPoint, .leading)
    }
}

// MARK: ----- TO

extension AngleConvenienceExtensionsTests {
    
    func testToAngleInDegreesWithFactor() {
        let angeFrom = 5.degrees
        let angleTo = 10.degrees
        XCTAssertEqual(angeFrom.to(angleTo, 0), 5.degrees)
        XCTAssertEqual(angeFrom.to(angleTo, 0.5), 7.5.degrees)
        XCTAssertEqual(angeFrom.to(angleTo, 1), 10.degrees)
    }
    
    func testToAngleInRadiansWithFactor() {
        let angeFrom = 5.radians
        let angleTo = 10.radians
        XCTAssertEqual(angeFrom.to(angleTo, 0), 5.radians)
        XCTAssertEqual(angeFrom.to(angleTo, 0.5), 7.5.radians)
        XCTAssertEqual(angeFrom.to(angleTo, 1), 10.radians)
    }
}
