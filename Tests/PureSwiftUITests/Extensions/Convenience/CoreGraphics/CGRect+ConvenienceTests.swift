//
//  CGRect+Tests.swift
//  
//
//  Created by Adam Fordyce on 25/11/2019.
//

import XCTest
@testable import PureSwiftUI

class CGRectConvenienceExtensionsTests: XCTestCase {
    
    let x: CGFloat = 2
    let y: CGFloat = 4
    let width: CGFloat = 8
    let height: CGFloat = 10
    
    var midX: CGFloat {
        x + width * 0.5
    }
    
    var midY: CGFloat {
        y + height * 0.5
    }
    
    var maxX: CGFloat {
        x + width
    }
    
    var maxY: CGFloat {
        y + height
    }
    
    var halfWidth: CGFloat {
        width * 0.5
    }
    
    var halfHeight: CGFloat {
        height * 0.5
    }
    
    var size: CGSize {
        CGSize(width: width, height: height)
    }
    
    var rect: CGRect {
        CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
    }
}

// MARK: ----- INIT

extension CGRectConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(CGRect(x, y, width, height), rect)
        XCTAssertEqual(CGRect(x.asDouble, y.asFloat, width.asCGFloat, height.asInt), rect)
        XCTAssertEqual(CGRect(width, height), CGRect(0, 0, width, height))
        XCTAssertEqual(CGRect(width.asInt, height.asDouble), CGRect(0, 0, width, height))
    }
    
}

// MARK: ----- INIT WITH ANCHOR

extension CGRectConvenienceExtensionsTests {
    
    func testRegionWithSize() {
        XCTAssertEqual(CGRect(rect.bottomTrailing, .square(5), anchor: .bottomTrailing),
                       CGRect(rect.bottomTrailing.offset(CGPoint(-5, -5)), .square(5)))
    }
}

// MARK: ----- DIMENSIONS

extension CGRectConvenienceExtensionsTests {
    
    
    func testDimensions() {
        XCTAssertEqual(rect.center, CGPoint(midX, midY))
        XCTAssertEqual(rect.topLeading, CGPoint(x, y))
        XCTAssertEqual(rect.top, CGPoint(midX, y))
        XCTAssertEqual(rect.topTrailing, CGPoint(maxX, y))
        XCTAssertEqual(rect.leading, CGPoint(x, midY))
        XCTAssertEqual(rect.trailing, CGPoint(maxX, midY))
        XCTAssertEqual(rect.bottomLeading, CGPoint(x, maxY))
        XCTAssertEqual(rect.bottom, CGPoint(midX, maxY))
        XCTAssertEqual(rect.bottomTrailing, CGPoint(maxX, maxY))
        XCTAssertEqual(rect.extent, rect.bottomTrailing)
        XCTAssertEqual(rect.halfWidth, width * 0.5)
        XCTAssertEqual(rect.halfHeight, height * 0.5)
        XCTAssertEqual(rect.minDimension, width)
        XCTAssertEqual(rect.maxDimension, height)
    }
}

// MARK: ----- CLAMPED

extension CGRectConvenienceExtensionsTests {
    
    func testClampedSize() {
        let expectedResult = CGSize(maxX, maxY)
        let result = CGRect(x, y, 0, 20).clampedSize(from: maxX.asInt, to: maxY.asDouble)
        
        XCTAssertEqual(result, expectedResult)
    }
}

// MARK: ----- SCALED

extension CGRectConvenienceExtensionsTests {
    
    func testScaled() {
        XCTAssertEqual(rect.widthScaled(0.5), width * 0.5)
        XCTAssertEqual(rect.heightScaled(0.5), height * 0.5)
        XCTAssertEqual(rect.xScaled(0.5), rect.midX)
        XCTAssertEqual(rect.yScaled(0.5), rect.midY)
        XCTAssertEqual(rect.sizeScaled(0.5), CGSize(width * 0.5, height * 0.5))
        XCTAssertEqual(rect.sizeScaled(0.1, 0.5), CGSize(width * 0.1, height * 0.5))
    }
}

// MARK: ----- INSET

extension CGRectConvenienceExtensionsTests {
    
    func testInset() {
        let topInset: CGFloat = 1
        let leadingInset: CGFloat = 2
        let bottomInset: CGFloat = 3
        let trailingInset: CGFloat = 4
        
        XCTAssertEqual(rect.inset(topInset, leadingInset, bottomInset, trailingInset),
                       CGRect(x + leadingInset, y + topInset, width - trailingInset - leadingInset, height - bottomInset - topInset))
        XCTAssertEqual(rect.inset(topInset.asInt, leadingInset.asCGFloat, bottomInset.asDouble, trailingInset.asFloat),
                       CGRect(x + leadingInset, y + topInset, width - trailingInset - leadingInset, height - bottomInset - topInset))
        XCTAssertEqual(rect.inset([.top, .trailing], leadingInset),
                       CGRect(x, y + leadingInset, width - leadingInset, height - leadingInset))
        XCTAssertEqual(rect.inset([.top, .trailing], leadingInset.asInt),
                       CGRect(x, y + leadingInset, width - leadingInset, height - leadingInset))
        
        XCTAssertEqual(rect.insetTop(topInset), rect.inset(.top, topInset))
        XCTAssertEqual(rect.insetTop(topInset.asInt), rect.inset(.top, topInset))
        
        XCTAssertEqual(rect.insetLeading(leadingInset), rect.inset(.leading, leadingInset))
        XCTAssertEqual(rect.insetLeading(leadingInset.asInt), rect.inset(.leading, leadingInset))
        
        XCTAssertEqual(rect.insetBottom(bottomInset), rect.inset(.bottom, bottomInset))
        XCTAssertEqual(rect.insetBottom(bottomInset.asInt), rect.inset(.bottom, bottomInset))
        
        XCTAssertEqual(rect.insetTrailing(trailingInset), rect.inset(.trailing, trailingInset))
        XCTAssertEqual(rect.insetTrailing(trailingInset.asInt), rect.inset(.trailing, trailingInset))
        
        XCTAssertEqual(rect.hInset(leadingInset), rect.inset([.leading, .trailing], leadingInset))
        XCTAssertEqual(rect.hInset(leadingInset.asInt), rect.inset([.leading, .trailing], leadingInset))
        XCTAssertEqual(rect.vInset(topInset), rect.inset([.top, .bottom], topInset))
        XCTAssertEqual(rect.vInset(topInset.asInt), rect.inset([.top, .bottom], topInset))
        
        XCTAssertEqual(rect.inset(topInset), rect.inset(.all, topInset))
        XCTAssertEqual(rect.inset(topInset.asInt), rect.inset(.all, topInset))
    }
}

// MARK: ----- SCALE

extension CGRectConvenienceExtensionsTests {
    
    func testRegionWithScale() {
        XCTAssertEqual(rect.scaled(CGSize(0.5, 0.5), at: rect.bottomTrailing, anchor: .bottomTrailing),
                       CGRect(rect.bottomTrailing.offset(rect.sizeScaled(-0.5)), CGSize(4, 5)))
        XCTAssertEqual(rect.scaled(0.5, at: rect.bottomTrailing, anchor: .bottomTrailing),
                       CGRect(rect.bottomTrailing.offset(rect.sizeScaled(-0.5)), CGSize(4, 5)))
        XCTAssertEqual(rect.xScaled(0.5, at: rect.bottomTrailing, anchor: .bottomTrailing),
                       CGRect(rect.top, CGSize(4, 10)))
        XCTAssertEqual(rect.yScaled(0.5, at: rect.bottomTrailing, anchor: .bottomTrailing),
                       CGRect(rect.leading, CGSize(8, 5)))
    }
}

// MARK: ----- OFFSET

extension CGRectConvenienceExtensionsTests {
    
    func testOffsetAnchor() {
        XCTAssertEqual(rect.offset(anchor: .bottomTrailing), CGRect(x - width, y - height, width, height))
        XCTAssertEqual(rect.offset(anchor: .init(5, 5)), CGRect(x - 5, y - 5, width, height))
        
        XCTAssertEqual(rect.offset(x, y), CGRect(CGPoint(x + x, y + y), size))
        XCTAssertEqual(rect.offset(x.asInt, y), CGRect(CGPoint(x + x, y + y), size))
        XCTAssertEqual(rect.offset(CGPoint(x, y)), CGRect(CGPoint(x + x, y + y), size))
        XCTAssertEqual(rect.offset(CGSize(x, y)), CGRect(CGPoint(x + x, y + y), size))
        XCTAssertEqual(rect.offset(CGVector(x, y)), CGRect(CGPoint(x + x, y + y), size))

        XCTAssertEqual(rect.xOffset(x), CGRect(CGPoint(x + x, y), size))
        XCTAssertEqual(rect.yOffset(y), CGRect(CGPoint(x, y + y), size))
    }
}

