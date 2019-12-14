//
//  CGRect+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGRectConvenienceExtensionsTests: XCTestCase {
    
    let originX: CGFloat = 2
    let originY: CGFloat = 3
    let width: CGFloat = 4
    let height: CGFloat = 5
    let max: CGFloat = 10
    let min: CGFloat = 2
    
    func testInit() {
        let expectedResult = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: height))
        let result = CGRect(0, 0, width, height)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testInitDefaultOrigin() {
        let expectedResult = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: height))
        let result = CGRect(width, height)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCenter() {
        let expectedResult = CGPoint(4, 5.5)
        let result = CGRect(originX, originY, width, height).center

        XCTAssertEqual(result, expectedResult)
    }
}
