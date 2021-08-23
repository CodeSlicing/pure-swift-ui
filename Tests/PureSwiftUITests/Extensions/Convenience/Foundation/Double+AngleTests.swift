//
//  Double+AngleTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class DoubleAngleExtensionsTests: XCTestCase {
    
    let degreesValue: Double = 45
    let radiansValue: Double = 2
    let inverseValue: Double = 1
    
    func testDoubleAsDegrees() {
        let expectedResult = Angle.degrees(degreesValue)
        let result = Double(degreesValue).degrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDoubleAsRadians() {
        let expectedResult = Angle.radians(radiansValue)
        let result = Double(radiansValue).radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDoubleAsCycles() {
        XCTAssertEqual(Double(0).cycles, Angle.degrees(0))
        XCTAssertEqual(Double(0.5).cycles, Angle.degrees(180))
        XCTAssertEqual(Double(1.0).cycles, Angle.degrees(360))
        XCTAssertEqual(Double(-0.75).cycles, Angle.degrees(-270))
    }
    
    func testDoubleDegreesAsRadians() {
        let expectedResult = Angle.radians(Angle.degrees(degreesValue).radians)
        let result = Double(degreesValue).degreesAsRadians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDoubleRadiansAsDegrees() {
        let expectedResult = Angle.degrees(Angle.radians(radiansValue).degrees)
        let result = Double(radiansValue).radiansAsDegrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDoubleACos() {
        let expectedResult = acos(inverseValue)
        let result = Double(inverseValue).acos.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDoubleASin() {
        let expectedResult = asin(inverseValue)
        let result = Double(inverseValue).asin.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDoubleATan() {
        let expectedResult = atan(inverseValue)
        let result = Double(inverseValue).atan.radians
        XCTAssertEqual(result, expectedResult)
    }
}
