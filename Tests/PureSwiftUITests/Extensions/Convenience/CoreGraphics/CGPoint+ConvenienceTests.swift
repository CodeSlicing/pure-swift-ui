//
//  CGPoint+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGPointConvenienceExtensionsTests: XCTestCase {
    
    let x: CGFloat = 4
    let y: CGFloat = 5
    let max: CGFloat = 10
    let min: CGFloat = 2
    
    func testAsCGSize() {
        let expectedResult = CGSize(width: x, height: y)
        let result = CGPoint(x: x, y: y).asCGSize
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testInit() {
        let expectedResult = CGPoint(x: x, y: y)
        let result = CGPoint(x, y)
        
        XCTAssertEqual(result, expectedResult)
    }
  
    func testClampedMin() {
    
        let expectedResult = CGPoint(min, min)
        let result = CGPoint(min - 1, min - 1).clamped(from: min, to: max)
        
        XCTAssertEqual(result, expectedResult)
    }

    func testClampedMax() {
    
        let expectedResult = CGPoint(max, max)
        let result = CGPoint(max + 1, max + 1).clamped(from: min, to: max)
        
        XCTAssertEqual(result, expectedResult)
    }

    func testClampedMid() {
    
        let mid = (max - min) / 2 + min
        let expectedResult = CGPoint(mid, mid)
        let result = CGPoint(mid, mid).clamped(from: min, to: max)
        
        XCTAssertEqual(result, expectedResult)
    }
}
