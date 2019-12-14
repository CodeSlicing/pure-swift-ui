//
//  Float+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class FloatConvenienceExtensionsTests: XCTestCase {
    
    func testRandom() {
        
        let value: Double = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }
}

