//
//  CGSize+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

private let width: CGFloat = 4
private let height: CGFloat = 5
private let max: CGFloat = 10
private let min: CGFloat = 2
private let defaultSize = CGSize(width, height)

class CGSizeConvenienceExtensionsTests: XCTestCase {

    func testInit() {
        let result = CGSize(width, height)
        XCTAssertEqual(result, defaultSize)
    }
    
    func testX() {
        let result = CGSize(width, height).x
        XCTAssertEqual(result, width)
    }
    
    func testMidX() {
        let expectedResult = width / 2
        let result = defaultSize.midX
        XCTAssertEqual(result, expectedResult)
    }

    func testY() {
        let result = CGSize(width, height).y
        XCTAssertEqual(result, height)
    }
    
    func testMidY() {
        let expectedResult = height / 2
        let result = defaultSize.midY
        XCTAssertEqual(result, expectedResult)
    }

    func testAsCGPoint() {
        let expectedResult = CGPoint(width, height)
        let result = defaultSize.asCGPoint
        
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
    
    func testWidthScaled() {
        let expectedResult = width * 0.5
        let result = defaultSize.widthScaled(0.5)

        XCTAssertEqual(result, expectedResult)
    }
    
    func testHeightScaled() {
        let expectedResult = height * 0.5
        let result = defaultSize.heightScaled(0.5)

        XCTAssertEqual(result, expectedResult)
    }
}
