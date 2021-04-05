//
//  CGFloat+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGFloatConvenienceExtensionsTests: XCTestCase {
    
    func testRandom() {
        
        let value: CGFloat = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }
}

// MARK: ----- TO

extension CGFloatConvenienceExtensionsTests {
    
    func testToWithFactor() {
        let valueFrom: CGFloat = 5
        let valueTo: CGFloat = 10
        XCTAssertEqual(valueFrom.to(valueTo, 0), 5)
        XCTAssertEqual(valueFrom.to(valueTo, 0.5), 7.5)
        XCTAssertEqual(valueFrom.to(valueTo, 1), 10)
    }
}
