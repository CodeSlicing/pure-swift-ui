//
//  Int+AngleTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class IntAngleExtensionsTests: XCTestCase {
    
    let degreesValue: Double = 45
    let radiansValue: Double = 2
    let inverseValue: Double = 1
    
    func testIntAsDegree() {
        let expectedResult = Angle.degrees(degreesValue)
        let result = Int(degreesValue).degree
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntAsDegrees() {
        let expectedResult = Angle.degrees(degreesValue)
        let result = Int(degreesValue).degrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntAsRadian() {
        let expectedResult = Angle.radians(radiansValue)
        let result = Int(radiansValue).radian
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntAsRadians() {
        let expectedResult = Angle.radians(radiansValue)
        let result = Int(radiansValue).radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntDegreesAsRadians() {
        let expectedResult = Angle.radians(Angle.degrees(degreesValue).radians)
        let result = Int(degreesValue).degreesAsRadians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntRadiansAsDegrees() {
        let expectedResult = Angle.degrees(Angle.radians(radiansValue).degrees)
        let result = Int(radiansValue).radiansAsDegrees
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntACos() {
        let expectedResult = acos(inverseValue)
        let result = Int(inverseValue).acos.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntASin() {
        let expectedResult = asin(inverseValue)
        let result = Int(inverseValue).asin.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    func testIntATan() {
        let expectedResult = atan(inverseValue)
        let result = Int(inverseValue).atan.radians
        XCTAssertEqual(result, expectedResult)
    }
}
