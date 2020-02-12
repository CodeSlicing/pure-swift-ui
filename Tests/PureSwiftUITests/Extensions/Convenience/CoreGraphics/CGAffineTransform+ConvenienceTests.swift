//
//  CGAffineTransform+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class CGAffineTransformConvenienceExtensionsTests: XCTestCase {

    let x: CGFloat = 2
    let y: CGFloat = 4
    let angle = 15.degrees
}

// MARK: ----- STATIC CONSTRUCTORS

extension CGAffineTransformConvenienceExtensionsTests {
    
    func testRotation() {
        XCTAssertEqual(CGAffineTransform.rotation(angle), CGAffineTransform(rotationAngle: angle.radians.asCGFloat))
    }
    
    func testTranslation() {
        XCTAssertEqual(CGAffineTransform.translation(x, y), CGAffineTransform(translationX: x, y: y))
        XCTAssertEqual(CGAffineTransform.xTranslation(x), CGAffineTransform(translationX: x, y: 0))
        XCTAssertEqual(CGAffineTransform.yTranslation(y), CGAffineTransform(translationX: 0, y: y))
    }

    func testScale() {
        XCTAssertEqual(CGAffineTransform.scale(2, 0.5), CGAffineTransform(scaleX: 2, y: 0.5))
        XCTAssertEqual(CGAffineTransform.xScale(2), CGAffineTransform(scaleX: 2, y: 1))
        XCTAssertEqual(CGAffineTransform.yScale(0.5), CGAffineTransform(scaleX: 1, y: 0.5))
    }
}
