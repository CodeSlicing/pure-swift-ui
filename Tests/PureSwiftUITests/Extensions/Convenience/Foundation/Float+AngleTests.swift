//
//  Float+AngleTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class FloatAngleExtensionsTests: XCTestCase {
    
    let degreesValue: Double = 45
    let radiansValue: Double = 2
    let inverseValue: Double = 1
    
    func testFloatAsDegrees() {
        let expectedResult = Angle.degrees(degreesValue)
        let result = Float(degreesValue).degrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testFloatAsRadians() {
        let expectedResult = Angle.radians(radiansValue)
        let result = Float(radiansValue).radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testFloatDegreesAsRadians() {
        let expectedResult = Angle.radians(Angle.degrees(degreesValue).radians)
        let result = Float(degreesValue).degreesAsRadians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testFloatRadiansAsDegrees() {
        let expectedResult = Angle.degrees(Angle.radians(radiansValue).degrees)
        let result = Float(radiansValue).radiansAsDegrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testFloatACos() {
        let expectedResult = acos(inverseValue)
        let result = Float(inverseValue).acos.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testFloatASin() {
        let expectedResult = asin(inverseValue)
        let result = Float(inverseValue).asin.radians
        assertEqual(result, expectedResult)
    }
    
    func testFloatATan() {
        let expectedResult = atan(inverseValue)
        let result = Float(inverseValue).atan.radians
        assertEqual(result, expectedResult)
    }
}
