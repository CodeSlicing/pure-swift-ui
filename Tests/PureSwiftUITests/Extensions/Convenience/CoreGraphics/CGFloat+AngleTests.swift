//
//  CGFloat+AngleTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGFloatAngleExtensionsTests: XCTestCase {
    
    let degreesValue: Double = 45
    let radiansValue: Double = 2
    let inverseValue: Double = 1
    
    func testCGFloatAsDegrees() {
        let expectedResult = Angle.degrees(degreesValue)
        let result = CGFloat(degreesValue).degrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCGFloatAsRadians() {
        let expectedResult = Angle.radians(radiansValue)
        let result = CGFloat(radiansValue).radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCGFloatDegreesAsRadians() {
        let expectedResult = Angle.radians(Angle.degrees(degreesValue).radians)
        let result = CGFloat(degreesValue).degreesAsRadians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCGFloatRadiansAsDegrees() {
        let expectedResult = Angle.degrees(Angle.radians(radiansValue).degrees)
        let result = CGFloat(radiansValue).radiansAsDegrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCGFloatACos() {
        let expectedResult = acos(inverseValue)
        let result = CGFloat(inverseValue).acos.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCGFloatASin() {
        let expectedResult = asin(inverseValue)
        let result = CGFloat(inverseValue).asin.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCGFloatATan() {
        let expectedResult = atan(inverseValue)
        let result = CGFloat(inverseValue).atan.radians
        XCTAssertEqual(result, expectedResult)
    }
}
