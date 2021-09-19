//
//  Int+Tests.swift
//
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class IntConvenienceExtensionsTests: XCTestCase {
    
}

// MARK: ----- PROPERTIES

extension IntConvenienceExtensionsTests {
    
    func testIsPositive() {

        XCTAssertTrue(1.isPositive)
        XCTAssertFalse((-1).isPositive)
    }
    
    func testIsNegative() {

        XCTAssertFalse(1.isNegative)
        XCTAssertTrue((-1).isNegative)
    }
    
    func testClampPositive() {
        XCTAssertEqual(0, (-1).clampedPositive)
        XCTAssertEqual(1, 1.clampedPositive)
    }
    
    func testClampNegative() {
        XCTAssertEqual(0, 1.clampedNegative)
        XCTAssertEqual(-1, (-1).clampedNegative)
    }
    
    @available(*, deprecated)
    func testClampedTo() {
        XCTAssertEqual(1, 3.clamped(to: 1))
        XCTAssertEqual(-1, (-1).clamped(to: 1))
        XCTAssertEqual(-1, (-1).clamped(to: 1, spanZero: true))
    }
    
    func testIsEven() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(1.isEven)
    }
    
    func testIsOdd() {
        XCTAssertFalse(2.isOdd)
        XCTAssertTrue(1.isOdd)
    }
    
    func testRepresentableAs() {
        XCTAssertEqual(Int(1).asInt, Int(1))
        XCTAssertEqual(CGFloat(1).asInt, Int(1))
        XCTAssertEqual(Double(1).asInt, Int(1))
        XCTAssertEqual(Float(1).asInt, Int(1))
        XCTAssertEqual(Double(1.4).asInt, Int(1))
        XCTAssertEqual(Float(1.7).asInt, Int(1))
        XCTAssertEqual(Float(-1.7).asInt, Int(-1))
    }
    
    // MARK: ----- PROPERTIES

    func testAbs() {
        XCTAssertEqual((-10).abs, 10)
        XCTAssertEqual(0.abs, 0)
        XCTAssertEqual(10.abs, 10)
    }

    func testRandom() {
        
        let value = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }

}

// MARK: ----- TYPE COERCION

extension IntConvenienceExtensionsTests {
    
    func testAsString() {
        XCTAssertEqual(1.asString, "1")
        XCTAssertEqual((-1).asString, "-1")
    }
}

