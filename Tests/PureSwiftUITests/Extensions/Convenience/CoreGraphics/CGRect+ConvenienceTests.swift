//
//  CGRect+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

private let originX: CGFloat = 2
private let originY: CGFloat = 3
private let width: CGFloat = 4
private let height: CGFloat = 5

private let defaultRect =  CGRect(origin: CGPoint(x: originX, y: originY), size: CGSize(width: width, height: height))

class CGRectConvenienceExtensionsTests: XCTestCase {
        
    func testInit() {
        let expectedResult = defaultRect
        let result = CGRect(originX, originY, width, height)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testInitDefaultOrigin() {
        let expectedResult = CGRect(origin: CGPoint(x: 0, y: 0), size: defaultRect.size)
        let result = CGRect(width, height)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCenter() {
        let expectedResult = CGPoint(4, 5.5)
        let result = defaultRect.center

        XCTAssertEqual(result, expectedResult)
    }
    
    func testClampedSize() {
        let expectedResult = CGSize(12, 15)
        let result = CGRect(originX, originY, 0, 20).clampedSize(from: 12, to: 15)

        XCTAssertEqual(result, expectedResult)
    }
    
    func testWidthScaled() {
        let expectedResult = width * 0.5
        let result = defaultRect.widthScaled(0.5)

        XCTAssertEqual(result, expectedResult)
    }
    
    func testHeightScaled() {
        let expectedResult = height * 0.5
        let result = defaultRect.heightScaled(0.5)

        XCTAssertEqual(result, expectedResult)
    }
}
