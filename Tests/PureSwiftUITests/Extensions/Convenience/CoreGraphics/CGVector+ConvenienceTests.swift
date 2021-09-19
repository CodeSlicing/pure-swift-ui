//
//  CGVector+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class CGVectorConvenienceExtensionsTests: XCTestCase {

    let dx: CGFloat = 4
    let dy: CGFloat = 6

    let max: CGFloat = 10
    let min: CGFloat = 2

    var halfWidth: CGFloat {
        dx * 0.5
    }
    
    var halfHeight: CGFloat {
        dy * 0.5
    }
    
    var vector: CGVector {
        CGVector(dx: dx, dy: dy)
    }
}

// MARK: ----- INIT

extension CGVectorConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(CGVector(dx, dy), vector)
    }
}

// MARK: ----- STATIC INITIALISERS

extension CGVectorConvenienceExtensionsTests {
    
    func testStaticInitialisers() {
        XCTAssertEqual(.dx(dx), CGVector(dx, 0))
        XCTAssertEqual(.dy(dy), CGVector(0, dy))
        XCTAssertEqual(.vector(dx, dy), vector)
        XCTAssertEqual(.vector(dx), CGVector(dx, dx))
    }
}

// MARK: ----- TYPE COERCION

extension CGVectorConvenienceExtensionsTests {

    func testAsType() {
        XCTAssertEqual(vector.asCGRect, CGRect(0, 0, dx, dy))
        XCTAssertEqual(vector.asCGPoint, CGPoint(dx, dy))
        XCTAssertEqual(vector.asCGSize, CGSize(dx, dy))
        XCTAssertEqual(vector.asUnitPoint, UnitPoint(dx, dy))
    }
}

// MARK: ----- DIMENSIONS

extension CGVectorConvenienceExtensionsTests {
    
    func testDimensions() {
        XCTAssertEqual(vector.width, dx)
        XCTAssertEqual(vector.height, dy)
        XCTAssertEqual(vector.midX, halfWidth)
        XCTAssertEqual(vector.midY, halfHeight)
        XCTAssertEqual(vector.halfWidth, halfWidth)
        XCTAssertEqual(vector.halfHeight, halfHeight)
        XCTAssertEqual(vector.maxDimension, dy)
        XCTAssertEqual(vector.minDimension, dx)
    }
}

// MARK: ----- SCALED

extension CGVectorConvenienceExtensionsTests {

    func testScaled() {
        XCTAssertEqual(vector.scaled(0.5), CGSize(halfWidth, halfHeight))
        XCTAssertEqual(vector.widthScaled(0.5), halfWidth)
        XCTAssertEqual(vector.heightScaled(0.5), halfHeight)
    }
}

// MARK: ----- CLAMPING

extension CGVectorConvenienceExtensionsTests {
    
    @available(*, deprecated)
    func testClampingDeprecated() {
        XCTAssertEqual(vector.clamped(from: 4.1, to: 5.9), CGVector(4.1, 5.9))
        XCTAssertEqual(vector.clamped(from: 4.1, to: 8), CGVector(4.1, dy))
        XCTAssertEqual(vector.clamped(from: 2, to: 5.9), CGVector(dx, 5.9))
        XCTAssertEqual(vector.clamped(from: 2, to: 10), vector)
    }
    
    func testClamping() {
        XCTAssertEqual(vector.clamped(min: 4.1, max: 5.9), CGVector(4.1, 5.9))
        XCTAssertEqual(vector.clamped(min: 4.1, max: 8), CGVector(4.1, dy))
        XCTAssertEqual(vector.clamped(min: 2, max: 5.9), CGVector(dx, 5.9))
        XCTAssertEqual(vector.clamped(min: 2, max: 10), vector)
    }
}

// MARK: ----- OPERATORS

extension CGVectorConvenienceExtensionsTests {
    
    func testMinus() {
        XCTAssertEqual(vector - CGVector(1, 1), CGVector(dx - 1, dy - 1))
        XCTAssertEqual(vector - vector, .zero)
    }
    
    func testPlus() {
        XCTAssertEqual(vector + vector, CGVector(dx + dx, dy + dy))
        XCTAssertEqual(vector + CGVector(1, 1), CGVector(dx + 1, dy + 1))
    }
}
