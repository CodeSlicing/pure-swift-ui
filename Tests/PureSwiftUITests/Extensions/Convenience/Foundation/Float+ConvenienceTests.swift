//
//  Float+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class FloatConvenienceExtensionsTests: XCTestCase {
    
    func testRepresentableAs() {
        XCTAssertEqual(Int(1).asFloat, Float(1))
        XCTAssertEqual(CGFloat(1).asFloat, Float(1))
        XCTAssertEqual(Double(1).asFloat, Float(1))
        XCTAssertEqual(Float(1).asFloat, Float(1))
    }
    
    func testRandom() {
        
        let value: Float = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }
}

// MARK: ----- PROPERTIES

extension FloatConvenienceExtensionsTests {
    
    func testAbs() {
        XCTAssertEqual((-10).asFloat.abs, 10)
        XCTAssertEqual(0.asFloat.abs, 0)
        XCTAssertEqual(10.asFloat.abs, 10)
    }
}
