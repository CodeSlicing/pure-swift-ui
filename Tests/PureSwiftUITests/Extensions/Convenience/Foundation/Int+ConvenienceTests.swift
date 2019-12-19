//
//  Int+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class IntConvenienceExtensionsTests: XCTestCase {
    
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
    
    func testClampedTo() {
        XCTAssertEqual(1, 3.clamped(to: 1))
        XCTAssertEqual(0, (-1).clamped(to: 1))
        XCTAssertEqual(-1, (-1).clamped(to: 1, spanZero: true))
    }
    
    func testIsEven() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(1.isEven)
    }
    
    func testRandom() {
        
        let value: Double = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }

}

