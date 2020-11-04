//
//  CGSize+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGSizeConvenienceExtensionsTests: XCTestCase {

    let width: CGFloat = 4
    let height: CGFloat = 6

    let max: CGFloat = 10
    let min: CGFloat = 2

    var halfWidth: CGFloat {
        width * 0.5
    }
    
    var halfHeight: CGFloat {
        height * 0.5
    }
    
    var size: CGSize {
        CGSize(width: width, height: height)
    }
}

// MARK: ----- INIT

extension CGSizeConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(CGSize(width, height), size)
        XCTAssertEqual(CGSize(width.asInt, height.asInt), size)
        XCTAssertEqual(CGSize(width), CGSize(width, width))
        XCTAssertEqual(CGSize(width.asInt), CGSize(width, width))
    }
}

// MARK: ----- STATIC INITIALISERS

extension CGSizeConvenienceExtensionsTests {
    
    func testStaticInit() {
        XCTAssertEqual(CGSize.width(width), CGSize(width, 0))
        XCTAssertEqual(CGSize.height(height), CGSize(0, height))
        XCTAssertEqual(CGSize.size(width, height), CGSize(width, height))
        XCTAssertEqual(CGSize.size(width), CGSize(width, width))
        XCTAssertEqual(CGSize.square(width), CGSize(width, width))
    }
}

// MARK: ----- TYPE COERCION

extension CGSizeConvenienceExtensionsTests {

    func testAsType() {
        XCTAssertEqual(size.asCGRect, CGRect(0, 0, width, height))
        XCTAssertEqual(size.asCGPoint, CGPoint(width, height))
        XCTAssertEqual(size.asCGVector, CGVector(width, height))
        XCTAssertEqual(size.asUnitPoint, UnitPoint(width, height))
    }
}

// MARK: ----- DIMENSIONS

extension CGSizeConvenienceExtensionsTests {
    
    func testDimensions() {
        XCTAssertEqual(size.x, width)
        XCTAssertEqual(size.y, height)
        XCTAssertEqual(size.midX, halfWidth)
        XCTAssertEqual(size.midY, halfHeight)
        XCTAssertEqual(size.halfWidth, halfWidth)
        XCTAssertEqual(size.halfHeight, halfHeight)
    }
}

// MARK: ----- SCALED

extension CGSizeConvenienceExtensionsTests {

    func testScaled() {
        XCTAssertEqual(size.scaled(0.5), CGSize(halfWidth, halfHeight))
        XCTAssertEqual(size.scaled(0.2, 0.7), CGSize(width * 0.2, height * 0.7))
        XCTAssertEqual(size.widthScaled(0.5), halfWidth)
        XCTAssertEqual(size.heightScaled(0.5), halfHeight)
    }
}

// MARK: ----- CLAMPING

extension CGSizeConvenienceExtensionsTests {
    
    func testClamping() {
        XCTAssertEqual(size.clamped(from: 4.1, to: 5.9), CGSize(4.1, 5.9))
        XCTAssertEqual(size.clamped(from: 4.1, to: 8), CGSize(4.1, height))
        XCTAssertEqual(size.clamped(from: 2, to: 5.9), CGSize(width, 5.9))
        XCTAssertEqual(size.clamped(from: 2, to: 10), size)
    }
}

// MARK: ----- OPERATORS

extension CGSizeConvenienceExtensionsTests {
    
    func testMinus() {
        XCTAssertEqual(size - .square(1), CGSize(width - 1, height - 1))
        XCTAssertEqual(size - size, .zero)
    }
    
    func testPlus() {
        XCTAssertEqual(size + size, CGSize(width + width, height + height))
        XCTAssertEqual(size + .square(1), CGSize(width + 1, height + 1))
    }
}

// MARK: ----- STATIC CONSTRUCTORS

extension CGSizeConvenienceExtensionsTests {
    
    func testSquare() {
        XCTAssertEqual(CGSize.square(width), CGSize(width))
        XCTAssertEqual(CGSize.square(width.asInt), CGSize(width))
    }
}

// MARK: ----- MAP FROM ONE RECT TO ANOTHER

extension CGSizeConvenienceExtensionsTests {
    
    func testMapForSize() {
        let sourceRect = CGRect(40, 40, width, height)
        let destination = CGRect(0, 0, 15, 10)
        XCTAssertEqual(sourceRect.size.map(from: sourceRect, to: destination), destination.size)
        assertEqual(sourceRect.sizeScaled(0.4).map(from: sourceRect, to: destination), destination.sizeScaled(0.4))
    }
}

// MARK: ----- TO

extension CGSizeConvenienceExtensionsTests {
    
    func testToWithFactor() {
        let valueFrom = CGSize(5, 10)
        let valueTo = CGSize(10, 20)
        XCTAssertEqual(valueFrom.to(valueTo, 0), .size(5, 10))
        XCTAssertEqual(valueFrom.to(valueTo, 0.5), .size(7.5, 15))
        XCTAssertEqual(valueFrom.to(valueTo, 1), .size(10, 20))

    }
}
