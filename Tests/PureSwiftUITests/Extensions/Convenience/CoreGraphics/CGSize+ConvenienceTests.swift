//
//  CGSize+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGSizeConvenienceExtensionsTests: XCTestCase {
    
    let originX: CGFloat = 2
    let originY: CGFloat = 3
    let width: CGFloat = 4
    let height: CGFloat = 5
    let max: CGFloat = 10
    let min: CGFloat = 2
    
    func testInit() {
        let expectedResult = CGSize(width: width, height: height)
        let result = CGSize(width, height)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testX() {
        let expectedResult = width
        let result = CGSize(width, height).x
        XCTAssertEqual(result, expectedResult)
    }
    
    func testMidX() {
        let expectedResult = width / 2
        let result = CGSize(width, height).midX
        XCTAssertEqual(result, expectedResult)
    }

    func testY() {
        let expectedResult = height
        let result = CGSize(width, height).y
        XCTAssertEqual(result, expectedResult)
    }
    
    func testMidY() {
        let expectedResult = height / 2
        let result = CGSize(width, height).midY
        XCTAssertEqual(result, expectedResult)
    }

    func testAsCGPoint() {
        let expectedResult = CGPoint(width, height)
        let result = CGSize(width, height).asCGPoint
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testClampedMin() {

        let expectedResult = CGSize(min, min)
        let result = CGSize(min - 1, min - 1).clamped(from: min, to: max)

        XCTAssertEqual(result, expectedResult)
    }
    
    func testClampedMax() {

        let expectedResult = CGSize(max, max)
        let result = CGSize(max + 1, max + 1).clamped(from: min, to: max)

        XCTAssertEqual(result, expectedResult)
    }

    func testClampedMid() {

        let mid = (max - min) / 2 + min
        let expectedResult = CGSize(mid, mid)
        let result = CGSize(mid, mid).clamped(from: min, to: max)

        XCTAssertEqual(result, expectedResult)
    }
}
