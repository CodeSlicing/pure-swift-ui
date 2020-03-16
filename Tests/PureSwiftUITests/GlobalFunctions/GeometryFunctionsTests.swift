//
//  GeometryFunctionsTests.swift
//  
//
//  Created by Adam Fordyce on 16/02/2020.
//

import XCTest
@testable import PureSwiftUI

class GeometryFunctionsTests: XCTestCase {
    
    
}

// MARK: ----- OFFSETS FOR ANGLES

extension GeometryFunctionsTests {
    
    func testCalcXOffsetTest() {
        assertEqual(calcXOffset(radius: 10, angle: 0.degrees), 0)
        assertEqual(calcXOffset(radius: 10, angle: 90.degrees), 10)
        assertEqual(calcXOffset(radius: 10, angle: 180.degrees), 0)
        assertEqual(calcXOffset(radius: 10, angle: 270.degrees), -10)
    }
    
    func testCalcYOffsetTest() {
        assertEqual(calcYOffset(radius: 10, angle: 0.degrees), -10)
        assertEqual(calcYOffset(radius: 10, angle: 90.degrees), 0)
        assertEqual(calcYOffset(radius: 10, angle: 180.degrees), 10)
        assertEqual(calcYOffset(radius: 10, angle: 270.degrees), 0)
    }
    
    func testCalcOffsetTest() {
        assertEqual(calcOffset(radius: 10, angle: 0.degrees), .point(0, -10))
        assertEqual(calcOffset(radius: 10, angle: 90.degrees), .point(10, -0))
        assertEqual(calcOffset(radius: 10, angle: 180.degrees), .point(0, 10))
        assertEqual(calcOffset(radius: 10, angle: 270.degrees), .point(-10, 0))
    }
}

// MARK: ----- OFFSETS FOR ANGLES - DEPRECATED

extension GeometryFunctionsTests {
    
    func testXFromAngleTest() {
        assertEqual(xFromAngle(0.degrees, forRadius: 10), 0)
        assertEqual(xFromAngle(90.degrees, forRadius: 10), 10)
        assertEqual(xFromAngle(180.degrees, forRadius: 10), 0)
        assertEqual(xFromAngle(270.degrees, forRadius: 10), -10)
    }
    
    func testYFromAngleTest() {
        assertEqual(yFromAngle(0.degrees, forRadius: 10), -10)
        assertEqual(yFromAngle(90.degrees, forRadius: 10), 0)
        assertEqual(yFromAngle(180.degrees, forRadius: 10), 10)
        assertEqual(yFromAngle(270.degrees, forRadius: 10), 0)
    }
    
    func testOffstFromAngleTest() {
        assertEqual(offsetFromAngle(0.degrees, forRadius: 10), .point(0, -10))
        assertEqual(offsetFromAngle(90.degrees, forRadius: 10), .point(10, -0))
        assertEqual(offsetFromAngle(180.degrees, forRadius: 10), .point(0, 10))
        assertEqual(offsetFromAngle(270.degrees, forRadius: 10), .point(-10, 0))
    }
}
