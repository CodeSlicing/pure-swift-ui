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
    
    var testPoint: CGPoint {
        CGPoint(x, y)
    }
}

// MARK: ----- INIT

extension CGPointConvenienceExtensionsTests {
    
      func testInit() {
          XCTAssertEqual(CGPoint(x.asCGFloat, y.asCGFloat), testPoint)
          XCTAssertEqual(CGPoint(x.asDouble, y.asDouble), testPoint)
      }
}

// MARK: ----- TYPE COERCION

extension CGPointConvenienceExtensionsTests {
    
    func testAsType() {
        XCTAssertEqual(testPoint.asCGSize, CGSize(x, y))
        XCTAssertEqual(testPoint.asCGRect, CGRect(0 ,0, x, y))
        XCTAssertEqual(testPoint.asCGVector, CGVector(x, y))
        XCTAssertEqual(testPoint.asCGPoint, CGPoint(x, y))
    }
}

// MARK: ----- PROPERTIES

extension CGPointConvenienceExtensionsTests {

    func testDimensionProperties() {
        XCTAssertEqual(testPoint.width, x)
        XCTAssertEqual(testPoint.height, y)
        XCTAssertEqual(testPoint.midX, x * 0.5)
        XCTAssertEqual(testPoint.midY, y * 0.5)
        XCTAssertEqual(testPoint.halfWidth, x * 0.5)
        XCTAssertEqual(testPoint.halfHeight, y * 0.5)
    }
}

// MARK: ----- SCALING

extension CGPointConvenienceExtensionsTests {

    func testScaledProperties() {
        XCTAssertEqual(testPoint.scaled(0.5), CGPoint(x * 0.5, y * 0.5))
        XCTAssertEqual(testPoint.xScaled(0.5), x * 0.5)
        XCTAssertEqual(testPoint.yScaled(0.5), y * 0.5)
    }
}

// MARK: ----- CLAMPED PROPERTIES

extension CGPointConvenienceExtensionsTests {
    
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
