//
//  MathOperatorsTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class MathOperatorsTests: XCTestCase {
    
    func testPowForUINumericType() {
        let expectedResult: Double = 16
        let result = Int(4) ** CGFloat(2)
         XCTAssertEqual(result, expectedResult)
    }

    func testPowForDouble() {
        let expectedResult: Double = 256
        let result = Double(4) ** Double(4)
         XCTAssertEqual(result, expectedResult)
    }
    
    func testPlusForUINumericType() {
        let expectedResult: Double = 4
        let result = Int(2) + Double(2)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testMinusForUINumericType() {
        let expectedResult: Double = 0
        let result = Int(2) - Double(2)
        XCTAssertEqual(result, expectedResult)
    }

    func testMultiplyForUINumericType() {
        let expectedResult: Double = 4
        let result: Double = Int(2) * Double(2)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testDivideForUINumericType() {
        let expectedResult: Double = 2
        let result: Double = Int(4) / Double(2)
        XCTAssertEqual(result, expectedResult)
    }
}
