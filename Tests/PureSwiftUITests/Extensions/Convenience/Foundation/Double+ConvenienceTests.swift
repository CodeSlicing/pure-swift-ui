//
//  Double+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class DoubleConvenienceExtensionsTests: XCTestCase {
    
    func testRandom() {
        
        let value: Double = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }
}

// MARK: ----- PROPERTIES

extension DoubleConvenienceExtensionsTests {
    
    func testAbs() {
        XCTAssertEqual((-10).asDouble.abs, 10)
        XCTAssertEqual(0.asDouble.abs, 0)
        XCTAssertEqual(10.asDouble.abs, 10)
    }
}
