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
        XCTAssertEqual(CGPoint(x), CGPoint(x: x, y: x))
        XCTAssertEqual(CGPoint(x.asInt), CGPoint(x: x, y: x))
        XCTAssertEqual(CGPoint(x, y), testPoint)
        XCTAssertEqual(CGPoint(x.asInt, y), testPoint)
      }
}

// MARK: ----- STATIC INITIALISERS

extension CGPointConvenienceExtensionsTests {
    
    func testStaticInit() {
        XCTAssertEqual(CGPoint.x(x), CGPoint(x, 0))
        XCTAssertEqual(CGPoint.y(y), CGPoint(0, y))
        XCTAssertEqual(CGPoint.point(x, y), CGPoint(x, y))
        XCTAssertEqual(CGPoint.point(x), CGPoint(x, x))
    }
}

// MARK: ----- TYPE COERCION

extension CGPointConvenienceExtensionsTests {
    
    func testAsType() {
        XCTAssertEqual(testPoint.asCGSize, CGSize(x, y))
        XCTAssertEqual(testPoint.asCGRect, CGRect(0 ,0, x, y))
        XCTAssertEqual(testPoint.asCGVector, CGVector(x, y))
        XCTAssertEqual(testPoint.asCGPoint, CGPoint(x, y))
        XCTAssertEqual(testPoint.asUnitPoint, UnitPoint(x, y))
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
        XCTAssertEqual(testPoint.maxDimension, y)
        XCTAssertEqual(testPoint.minDimension, x)

    }
}

// MARK: ----- SCALING

extension CGPointConvenienceExtensionsTests {

    func testScaledProperties() {
        XCTAssertEqual(testPoint.scaled(0.5), CGPoint(x * 0.5, y * 0.5))
        XCTAssertEqual(testPoint.scaled(0.1, 0.7), CGPoint(x * 0.1, y * 0.7))
        XCTAssertEqual(testPoint.scaled(.init(0, 0.5)), CGPoint(0, y * 0.5))
        XCTAssertEqual(testPoint.xScaled(0.5), x * 0.5)
        XCTAssertEqual(testPoint.yScaled(0.5), y * 0.5)
    }
}

// MARK: ----- OPERATOR OVERLOADS

extension CGPointConvenienceExtensionsTests {
    
    func testOperatorMultiply() {
        XCTAssertEqual(testPoint + testPoint, CGPoint(x * 2, y * 2))
    }

    func testOperatorDivide() {
        XCTAssertEqual(testPoint - testPoint, .zero)
    }
}

// MARK: ----- OFFSET

extension CGPointConvenienceExtensionsTests {
    
    func testOffset() {
        let offset = CGPoint(10, 20)
        let expectedOffset = CGPoint(testPoint.x + offset.x, testPoint.y + offset.y)
        XCTAssertEqual(testPoint.offset(offset.x, offset.y), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset.x.asInt, offset.y), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset.asCGVector), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset.asCGSize), expectedOffset)
        XCTAssertEqual(testPoint.xOffset(offset.x), CGPoint(expectedOffset.x, testPoint.y))
        XCTAssertEqual(testPoint.yOffset(offset.y), CGPoint(testPoint.x, expectedOffset.y))
    }
    
    func testOffsetRadiusAngle() {
        assertEqual(testPoint.offset(radius: 10, angle: .trailing), CGPoint(testPoint.x + 10, testPoint.y))
        assertEqual(testPoint.offset(radius: 10, angle: .bottom), CGPoint(testPoint.x, testPoint.y + 10))
        assertEqual(testPoint.offset(radius: 10, angle: .leading), CGPoint(testPoint.x - 10, testPoint.y))
        assertEqual(testPoint.offset(radius: 10, angle: .top), CGPoint(testPoint.x, testPoint.y - 10))
    }
}

// MARK: ----- OFFSET WITH FACTOR

extension CGPointConvenienceExtensionsTests {
    
    func testOffsetScaled() {
        let offset = CGPoint(10, 20)
        let expectedOffset = CGPoint(testPoint.x + offset.x, testPoint.y + offset.y)
        let expectedHalfOffset = CGPoint(testPoint.x + offset.x * 0.5, testPoint.y + offset.y * 0.5)
        XCTAssertEqual(testPoint.offset(offset.x, offset.y, factor: 0), testPoint)
        XCTAssertEqual(testPoint.offset(offset.x.asInt, offset.y, factor: 0), testPoint)
        XCTAssertEqual(testPoint.offset(offset, factor: 0), testPoint)
        XCTAssertEqual(testPoint.offset(offset.asCGVector, factor: 0), testPoint)
        XCTAssertEqual(testPoint.offset(offset.asCGSize, factor: 0), testPoint)
        XCTAssertEqual(testPoint.xOffset(offset.x, factor: 0), testPoint)
        XCTAssertEqual(testPoint.yOffset(offset.y, factor: 0), testPoint)
        
        XCTAssertEqual(testPoint.offset(offset.x, offset.y, factor: 0.5), expectedHalfOffset)
        XCTAssertEqual(testPoint.offset(offset.x.asInt, offset.y, factor: 0.5), expectedHalfOffset)
        XCTAssertEqual(testPoint.offset(offset, factor: 0.5), expectedHalfOffset)
        XCTAssertEqual(testPoint.offset(offset.asCGVector, factor: 0.5), expectedHalfOffset)
        XCTAssertEqual(testPoint.offset(offset.asCGSize, factor: 0.5), expectedHalfOffset)
        XCTAssertEqual(testPoint.xOffset(offset.x, factor: 0.5), CGPoint(expectedHalfOffset.x, testPoint.y))
        XCTAssertEqual(testPoint.yOffset(offset.y, factor: 0.5), CGPoint(testPoint.x, expectedHalfOffset.y))
        
        XCTAssertEqual(testPoint.offset(offset.x, offset.y, factor: 1), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset.x.asInt, offset.y, factor: 1), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset, factor: 1), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset.asCGVector, factor: 1), expectedOffset)
        XCTAssertEqual(testPoint.offset(offset.asCGSize, factor: 1), expectedOffset)
        XCTAssertEqual(testPoint.xOffset(offset.x, factor: 1), CGPoint(expectedOffset.x, testPoint.y))
        XCTAssertEqual(testPoint.yOffset(offset.y, factor: 1), CGPoint(testPoint.x, expectedOffset.y))
    }
    
    func testOffsetRadiusAngleScaled() {
        assertEqual(testPoint.offset(radius: 10, angle: .trailing, factor: 0), testPoint)
        assertEqual(testPoint.offset(radius: 10, angle: .bottom, factor: 0), testPoint)
        assertEqual(testPoint.offset(radius: 10, angle: .leading, factor: 0), testPoint)
        assertEqual(testPoint.offset(radius: 10, angle: .top, factor: 0), testPoint)

        assertEqual(testPoint.offset(radius: 10, angle: .trailing, factor: 0.5), CGPoint(testPoint.x + 5, testPoint.y))
        assertEqual(testPoint.offset(radius: 10, angle: .bottom, factor: 0.5), CGPoint(testPoint.x, testPoint.y + 5))
        assertEqual(testPoint.offset(radius: 10, angle: .leading, factor: 0.5), CGPoint(testPoint.x - 5, testPoint.y))
        assertEqual(testPoint.offset(radius: 10, angle: .top, factor: 0.5), CGPoint(testPoint.x, testPoint.y - 5))

        assertEqual(testPoint.offset(radius: 10, angle: .trailing, factor: 1), CGPoint(testPoint.x + 10, testPoint.y))
        assertEqual(testPoint.offset(radius: 10, angle: .bottom, factor: 1), CGPoint(testPoint.x, testPoint.y + 10))
        assertEqual(testPoint.offset(radius: 10, angle: .leading, factor: 1), CGPoint(testPoint.x - 10, testPoint.y))
        assertEqual(testPoint.offset(radius: 10, angle: .top, factor: 1), CGPoint(testPoint.x, testPoint.y - 10))
    }
}

// MARK: ----- TO WITH FACTOR

extension CGPointConvenienceExtensionsTests {
    
    func testToScaled() {
        let point2 = CGPoint(x * 2, y * 2)
        XCTAssertEqual(testPoint.to(point2, 0), testPoint)
        XCTAssertEqual(testPoint.to(point2, 1), point2)
        XCTAssertEqual(testPoint.to(point2, 0.5), CGPoint(x * 1.5, y * 1.5))
        XCTAssertEqual(testPoint.to(point2, 2), CGPoint(x * 3, y * 3))
    }
    
    func testToScaledWithSize() {
        let point2 = CGPoint(x * 2, y * 2)
        XCTAssertEqual(testPoint.to(point2, .init(0, 1)), CGPoint(x, point2.y))
        XCTAssertEqual(testPoint.to(point2, .init(1, 1)), point2)
        XCTAssertEqual(testPoint.to(point2, .init(0, 0.5)), CGPoint(x, y * 1.5))
        XCTAssertEqual(testPoint.to(point2, .init(2, 0)), CGPoint(x * 3, y))
    }
}

// MARK: ----- CLAMPED PROPERTIES

extension CGPointConvenienceExtensionsTests {
    
    func testClampedMin() {
    
        let expectedResult = CGPoint(min, min)
        let result = CGPoint(min - 1, min - 1).clamped(from: min, to: max)
        let result2 = CGPoint(min - 1, min - 1).clamped(from: min.asInt, to: max)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(result2, expectedResult)
    }

    func testClampedMax() {
    
        let expectedResult = CGPoint(max, max)
        let result = CGPoint(max + 1, max + 1).clamped(from: min, to: max)
        let result2 = CGPoint(max + 1, max + 1).clamped(from: min.asInt, to: max)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(result2, expectedResult)
    }

    func testClampedMid() {
    
        let mid = (max - min) / 2 + min
        let expectedResult = CGPoint(mid, mid)
        let result = CGPoint(mid, mid).clamped(from: min, to: max)
        let result2 = CGPoint(mid, mid).clamped(from: min.asInt, to: max)

        XCTAssertEqual(result, expectedResult)
        XCTAssertEqual(result2, expectedResult)
    }
}

// MARK: ----- OFFSET ANCHOR IN SIZE

extension CGPointConvenienceExtensionsTests {
    
    func testOffsetAnchorInSize() {
        
        let size = CGSize(4, 2)
        
        assertEqual(testPoint.offset(in: size, anchor: UnitPoint(0, 0)), testPoint)
        assertEqual(testPoint.offset(in: size, anchor: UnitPoint(0.75, 1)), testPoint.offset(-3, -2))
        assertEqual(testPoint.offset(in: size, anchor: UnitPoint(0.25, 0.5)), testPoint.offset(-1, -1))
        assertEqual(testPoint.offset(in: size, anchor: UnitPoint(1, 1)), testPoint.offset(-4, -2))
        assertEqual(testPoint.offset(in: size, anchor: .topLeading), testPoint)
        assertEqual(testPoint.offset(in: size, anchor: .center), testPoint.offset(-2, -1))
        assertEqual(testPoint.offset(in: size, anchor: .topTrailing), testPoint.offset(size.scaled(-1, 0)))
        assertEqual(testPoint.offset(in: size, anchor: .trailing), testPoint.offset(size.scaled(-1, -0.5)))
        assertEqual(testPoint.offset(in: size, anchor: .bottomTrailing), testPoint.offset(size.scaled(-1)))
        assertEqual(testPoint.offset(in: size, anchor: .bottom), testPoint.offset(size.scaled(-0.5, -1)))
        assertEqual(testPoint.offset(in: size, anchor: .bottomLeading), testPoint.offset(size.scaled(0, -1)))
        assertEqual(testPoint.offset(in: size, anchor: .leading), testPoint.offset(size.scaled(0, -0.5)))

        assertEqual(testPoint.offset(in: size.asCGVector, anchor: .center), testPoint.offset(-2, -1))
        assertEqual(testPoint.offset(in: size.asCGPoint, anchor: .center), testPoint.offset(-2, -1))

        
    }
}

// MARK: ----- OFFSET ANCHOR IN SIZE WITH FACTOR

extension CGPointConvenienceExtensionsTests {
    
    
    func testOffsetAnchorInSizeScaled() {
        
        let size = CGSize(4, 2)
        
        assertEqual(testPoint.offset(in: size, anchor: .topLeading, factor: 0.5), testPoint)
        assertEqual(testPoint.offset(in: size, anchor: .center, factor: 0.5), testPoint.offset(CGSize.init(-2, -1).scaled(0.5)))
        assertEqual(testPoint.offset(in: size, anchor: .bottomTrailing, factor: 0.5), testPoint.offset(size.scaled(-1).scaled(0.5)))

        assertEqual(testPoint.offset(in: size.asCGVector, anchor: .center, factor: 0.5), testPoint.offset(CGSize.init(-2, -1).scaled(0.5)))
        assertEqual(testPoint.offset(in: size.asCGPoint, anchor: .center, factor: 0.5), testPoint.offset(CGSize.init(-2, -1).scaled(0.5)))

        let scaleSize = CGSize(0.3, 0.6)
        
        assertEqual(testPoint.offset(in: size, anchor: .topLeading, factor: scaleSize), testPoint)
        assertEqual(testPoint.offset(in: size, anchor: .center, factor: scaleSize), testPoint.offset(CGSize.init(-2, -1).scaled(scaleSize)))
        assertEqual(testPoint.offset(in: size, anchor: .bottomTrailing, factor: scaleSize), testPoint.offset(size.scaled(-1).scaled(scaleSize)))

        assertEqual(testPoint.offset(in: size.asCGVector, anchor: .center, factor: scaleSize), testPoint.offset(CGSize.init(-2, -1).scaled(scaleSize)))
        assertEqual(testPoint.offset(in: size.asCGPoint, anchor: .center, factor: scaleSize), testPoint.offset(CGSize.init(-2, -1).scaled(scaleSize)))
    }
}

// MARK: ----- CALC ANGLE

extension CGPointConvenienceExtensionsTests {
    
    func testDeprecatedCalcAngleTo() {
        
        let offsetPoint1 = testPoint.offset(1, -1)
        let offsetPoint2 = testPoint.offset(-1, 1)
        let offsetPoint3 = testPoint.offset(0, 2)

        XCTAssertEqual(testPoint.calcAngleTo(offsetPoint1), .topTrailing)
        XCTAssertEqual(testPoint.calcAngleTo(offsetPoint2), .bottomLeading)
        XCTAssertEqual(testPoint.calcAngleTo(offsetPoint3), .bottom)
        
        XCTAssertEqual(testPoint.calcAngleTo(offsetPoint1.x, offsetPoint1.y), .topTrailing)
        XCTAssertEqual(testPoint.calcAngleTo(offsetPoint2.x, offsetPoint2.y), .bottomLeading)
        XCTAssertEqual(testPoint.calcAngleTo(offsetPoint3.x, offsetPoint3.y), .bottom)
    }
    
    func testangleTo() {
        
        let offsetPoint1 = testPoint.offset(1, -1)
        let offsetPoint2 = testPoint.offset(-1, 1)
        let offsetPoint3 = testPoint.offset(0, 2)

        XCTAssertEqual(testPoint.angleTo(offsetPoint1), .topTrailing)
        XCTAssertEqual(testPoint.angleTo(offsetPoint2), .bottomLeading)
        XCTAssertEqual(testPoint.angleTo(offsetPoint3), .bottom)
        
        XCTAssertEqual(testPoint.angleTo(offsetPoint1.x, offsetPoint1.y), .topTrailing)
        XCTAssertEqual(testPoint.angleTo(offsetPoint2.x, offsetPoint2.y), .bottomLeading)
        XCTAssertEqual(testPoint.angleTo(offsetPoint3.x, offsetPoint3.y), .bottom)
    }
}

// MARK: ----- CALC RADIUS TO

extension CGPointConvenienceExtensionsTests {
    
    func testDeprecatedCalcRadiusTo() {
        
        let offsetPoint1 = testPoint.offset(1, 0)
        let offsetPoint2 = testPoint.offset(1, 1)
        let offsetPoint3 = testPoint.offset(-1, -1)
        let offsetPoint4 = testPoint.offset(0, -3)
        
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint1), 1)
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint2), sqrt(2.0))
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint3), sqrt(2.0))
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint4), 3)
        
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint1.x, offsetPoint1.y), 1)
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint2.x, offsetPoint2.y), sqrt(2.0))
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint3.x, offsetPoint3.y), sqrt(2.0))
        XCTAssertEqual(testPoint.calcRadiusTo(offsetPoint4.x, offsetPoint4.y), 3)
        
        //squared radius
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint1), 1)
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint2), 2)
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint3), 2)
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint4), 9)
        
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint1.x, offsetPoint1.y), 1)
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint2.x, offsetPoint2.y), 2)
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint3.x, offsetPoint3.y), 2)
        XCTAssertEqual(testPoint.calcSquaredRadiusTo(offsetPoint4.x, offsetPoint4.y), 9)
    }
    
    func testRadiusTo() {
        
        let offsetPoint1 = testPoint.offset(1, 0)
        let offsetPoint2 = testPoint.offset(1, 1)
        let offsetPoint3 = testPoint.offset(-1, -1)
        let offsetPoint4 = testPoint.offset(0, -3)
        
        XCTAssertEqual(testPoint.radiusTo(offsetPoint1), 1)
        XCTAssertEqual(testPoint.radiusTo(offsetPoint2), sqrt(2.0))
        XCTAssertEqual(testPoint.radiusTo(offsetPoint3), sqrt(2.0))
        XCTAssertEqual(testPoint.radiusTo(offsetPoint4), 3)
        
        XCTAssertEqual(testPoint.radiusTo(offsetPoint1.x, offsetPoint1.y), 1)
        XCTAssertEqual(testPoint.radiusTo(offsetPoint2.x, offsetPoint2.y), sqrt(2.0))
        XCTAssertEqual(testPoint.radiusTo(offsetPoint3.x, offsetPoint3.y), sqrt(2.0))
        XCTAssertEqual(testPoint.radiusTo(offsetPoint4.x, offsetPoint4.y), 3)
        
        //squared radius
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint1), 1)
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint2), 2)
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint3), 2)
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint4), 9)
        
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint1.x, offsetPoint1.y), 1)
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint2.x, offsetPoint2.y), 2)
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint3.x, offsetPoint3.y), 2)
        XCTAssertEqual(testPoint.squaredRadiusTo(offsetPoint4.x, offsetPoint4.y), 9)
    }
}

// MARK: ----- CALC POINT

extension CGPointConvenienceExtensionsTests {
    
    
    func testCalcPoint() {
        
        assertEqual(testPoint.calcPoint(length: 10, angle: .top), CGPoint(testPoint.x, testPoint.y - 10))
        assertEqual(testPoint.calcPoint(length: 10, angle: .trailing), CGPoint(testPoint.x + 10, testPoint.y))
        assertEqual(testPoint.calcPoint(length: 10, angle: .bottom), CGPoint(testPoint.x, testPoint.y + 10))
        assertEqual(testPoint.calcPoint(length: 10, angle: .leading), CGPoint(testPoint.x - 10, testPoint.y))
    }
}

// MARK: ----- CALC POINT FACTOR

extension CGPointConvenienceExtensionsTests {
    
    
    func testCalcPointScaled() {
        
        assertEqual(testPoint.calcPoint(length: 10, angle: .top, factor: 0.5), CGPoint(testPoint.x, testPoint.y - 5))
        assertEqual(testPoint.calcPoint(length: 10, angle: .trailing, factor: 0.5), CGPoint(testPoint.x + 5, testPoint.y))
        assertEqual(testPoint.calcPoint(length: 10, angle: .bottom, factor: 0.5), CGPoint(testPoint.x, testPoint.y + 5))
        assertEqual(testPoint.calcPoint(length: 10, angle: .leading, factor: 0.5), CGPoint(testPoint.x - 5, testPoint.y))
        
        let scaleSize = CGSize(0.3, 0.7)
        assertEqual(testPoint.calcPoint(length: 10, angle: .top, factor: scaleSize), CGPoint(testPoint.x, testPoint.y - 7))
        assertEqual(testPoint.calcPoint(length: 10, angle: .trailing, factor: scaleSize), CGPoint(testPoint.x + 3, testPoint.y))
        assertEqual(testPoint.calcPoint(length: 10, angle: .bottom, factor: scaleSize), CGPoint(testPoint.x, testPoint.y + 7))
        assertEqual(testPoint.calcPoint(length: 10, angle: .leading, factor: scaleSize), CGPoint(testPoint.x - 3, testPoint.y))
    }
}

// MARK: ----- MOVE ORIGIN

extension CGPointConvenienceExtensionsTests {
    
    func testMoveOrigin() {
        let size = CGSize(4, 2)

        assertEqual(testPoint.moveOrigin(in: size), testPoint)
        assertEqual(testPoint.moveOrigin(in: size, origin: .center), testPoint.offset(CGSize.init(2, 1)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .trailing), testPoint.offset(CGSize.init(4, 1)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .bottomTrailing), testPoint.offset(CGSize.init(4, 2)))
    
        assertEqual(testPoint.moveOrigin(in: size, origin: .init(0.25, 0.5)), testPoint.offset(CGSize.init(1, 1)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .init(0.75, 1)), testPoint.offset(CGSize.init(3, 2)))

        assertEqual(testPoint.moveOrigin(in: size.asCGVector, origin: .center), testPoint.offset(CGSize.init(2, 1)))
        assertEqual(testPoint.moveOrigin(in: size.asCGPoint, origin: .bottomTrailing), testPoint.offset(CGSize.init(4, 2)))
    }
}

// MARK: ----- MOVE ORIGIN FACTOR

extension CGPointConvenienceExtensionsTests {
    
    func testMoveOriginScaled() {
        let size = CGSize(4, 2)
        
        assertEqual(testPoint.moveOrigin(in: size, factor: 0.5), testPoint)
        assertEqual(testPoint.moveOrigin(in: size, origin: .center, factor: 0.5), testPoint.offset(CGSize.init(2, 1).scaled(0.5)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .trailing, factor: 0.5), testPoint.offset(CGSize.init(4, 1).scaled(0.5)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .bottomTrailing, factor: 0.5), testPoint.offset(CGSize.init(4, 2).scaled(0.5)))
        
        assertEqual(testPoint.moveOrigin(in: size, origin: .init(0.25, 0.5), factor: 0.5), testPoint.offset(CGSize.init(1, 1).scaled(0.5)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .init(0.75, 1), factor: 0.5), testPoint.offset(CGSize.init(3, 2).scaled(0.5)))

        assertEqual(testPoint.moveOrigin(in: size.asCGVector, origin: .center, factor: 0.5), testPoint.offset(CGSize.init(2, 1).scaled(0.5)))
        assertEqual(testPoint.moveOrigin(in: size.asCGPoint, origin: .bottomTrailing, factor: 0.5), testPoint.offset(CGSize.init(4, 2).scaled(0.5)))
        
        let scaleFactor = CGSize(0.3, 0.6)
        
        assertEqual(testPoint.moveOrigin(in: size, factor: scaleFactor), testPoint)
        assertEqual(testPoint.moveOrigin(in: size, origin: .center, factor: scaleFactor), testPoint.offset(CGSize.init(2, 1).scaled(scaleFactor)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .trailing, factor: scaleFactor), testPoint.offset(CGSize.init(4, 1).scaled(scaleFactor)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .bottomTrailing, factor: scaleFactor), testPoint.offset(CGSize.init(4, 2).scaled(scaleFactor)))
        
        assertEqual(testPoint.moveOrigin(in: size, origin: .init(0.25, 0.5), factor: scaleFactor), testPoint.offset(CGSize.init(1, 1).scaled(scaleFactor)))
        assertEqual(testPoint.moveOrigin(in: size, origin: .init(0.75, 1), factor: scaleFactor), testPoint.offset(CGSize.init(3, 2).scaled(scaleFactor)))

        assertEqual(testPoint.moveOrigin(in: size.asCGVector, origin: .center, factor: scaleFactor), testPoint.offset(CGSize.init(2, 1).scaled(scaleFactor)))
        assertEqual(testPoint.moveOrigin(in: size.asCGPoint, origin: .bottomTrailing, factor: scaleFactor), testPoint.offset(CGSize.init(4, 2).scaled(scaleFactor)))
    }
}

// MARK: ----- CONVERT TO RECT

extension CGPointConvenienceExtensionsTests {
    
    func testConvertToRect() {
 
        let point = CGPoint(10, 10)
        XCTAssertEqual(testPoint.rect(to: point), CGRect(4, 5, 6, 5))
    }
}

// MARK: ----- MAP FROM ONE RECT TO ANOTHER

extension CGPointConvenienceExtensionsTests {
    
    func testMapForPoint() {
        let sourceRect = CGRect(20, 30, 24, 40)
        let destination = CGRect(0, 0, 15, 20)
        XCTAssertEqual(sourceRect.center.map(from: sourceRect, to: destination), destination.center)
        XCTAssertEqual(sourceRect.top.map(from: sourceRect, to: destination), destination.top)
        XCTAssertEqual(sourceRect.bottomTrailing.map(from: sourceRect, to: destination), destination.bottomTrailing)
    }
    
    func testMapForPointWithNoWidth() {
        let sourceRect = CGRect(20, 30, 0, 40)
        let destination = CGRect(0, 0, 15, 20)
        XCTAssertEqual(sourceRect.center.map(from: sourceRect, to: destination), destination.leading)
        XCTAssertEqual(sourceRect.top.map(from: sourceRect, to: destination), destination.topLeading)
        XCTAssertEqual(sourceRect.bottomTrailing.map(from: sourceRect, to: destination), destination.bottomLeading)
    }
    
    func testMapForPointWithNoHeight() {
        let sourceRect = CGRect(20, 30, 24, 0)
        let destination = CGRect(0, 0, 15, 20)
        XCTAssertEqual(sourceRect.center.map(from: sourceRect, to: destination), destination.top)
        XCTAssertEqual(sourceRect.top.map(from: sourceRect, to: destination), destination.top)
        XCTAssertEqual(sourceRect.bottomTrailing.map(from: sourceRect, to: destination), destination.topTrailing)
    }
    
    func testMapForPointWithNoWidthOrHeight() {
        let sourceRect = CGRect(20, 30, 0, 0)
        let destination = CGRect(0, 0, 15, 20)
        XCTAssertEqual(sourceRect.center.map(from: sourceRect, to: destination), destination.topLeading)
        XCTAssertEqual(sourceRect.top.map(from: sourceRect, to: destination), destination.topLeading)
        XCTAssertEqual(sourceRect.bottomTrailing.map(from: sourceRect, to: destination), destination.topLeading)
    }
}
