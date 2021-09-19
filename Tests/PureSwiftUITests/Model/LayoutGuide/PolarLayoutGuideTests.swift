//
//  PolarLayoutGuideTests.swift
//
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class PolarLayoutGuideTests: BaseLayoutGuideTests {
    
}

// MARK: ----- PROPERTIES {

extension PolarLayoutGuideTests {
    
    func testForInvalidRingNumber() {
        let polar = LayoutGuide.polar(rect, rings: 0, segments: 2)
        XCTAssertEqual(polar.xCount, 1)
    }
    
    func testForInvalidSegmentNumber() {
        let polar = LayoutGuide.polar(rect, rings: 2, segments: 0)
        XCTAssertEqual(polar.yCount, 1)
    }
    
    func testProperties() {
        
        var polar = LayoutGuide.polar(rect, rings: 10, segments: 6)
        
        XCTAssertEqual(polar.yCount, 6)
        XCTAssertEqual(polar.origin, rect.center)
        
        polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 6)
        XCTAssertEqual(polar.xCount, 3)
        XCTAssertEqual(polar.yCount, 6)
        XCTAssertEqual(polar.origin, rect.center)
        
        polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.5, 1])
        XCTAssertEqual(polar.xCount, 3)
        XCTAssertEqual(polar.yCount, 3)
        XCTAssertEqual(polar.origin, rect.center)
        
        polar = LayoutGuide.polar(rect, rings: 10, segments: [0, 0.5, 1])
        XCTAssertEqual(polar.xCount, 10)
        XCTAssertEqual(polar.yCount, 3)
        XCTAssertEqual(polar.origin, rect.center)
    }
}

// MARK: ----- ANGLE FOR POINT

extension PolarLayoutGuideTests {
    
    func testAngleForPoint() {
        let polar = LayoutGuide.polar(rect, rings: 2, segments: 8)
        
        XCTAssertEqual(polar.angleTo(2, 2), 90.degrees)
        XCTAssertEqual(polar.angleTo(1, 4), 180.degrees)
        
        XCTAssertEqual(polar.angleTo(2, 2, from: rect.leading), 90.degrees)
        XCTAssertEqual(polar.angleTo(0, 0, from: rect.bottom), 0.degrees)
        XCTAssertEqual(polar.angleTo(2, 6, from: rect.center), 270.degrees)
    }
}

// MARK: ----- RADIUS FOR POINT

extension PolarLayoutGuideTests {
    
    func testRadiusForPoint() {
        let polar = LayoutGuide.polar(rect, rings: 2, segments: 8)
        
        XCTAssertEqual(polar.radiusTo(2, 2), rect.halfHeight)
        XCTAssertEqual(polar.radiusTo(1, 4), rect.heightScaled(0.25))
        
        XCTAssertEqual(polar.radiusTo(2, 2, from: rect.leading), rect.halfWidth + rect.halfHeight)
        XCTAssertEqual(polar.radiusTo(0, 0, from: rect.bottom), rect.halfHeight)
        XCTAssertEqual(polar.radiusTo(2, 6, from: rect.center), rect.halfHeight)
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS

extension PolarLayoutGuideTests {
    
    func testPointsForEquidistant() {
        let polar = LayoutGuide.polar(rect, rings: 6, segments: 8)
        assertEqual(polar[0, 0], (rect.center))
        assertEqual(polar[6, 2], rect.center.xOffset(rect.halfHeight))
        assertEqual(polar[6, 4], rect.bottom)
        assertEqual(polar[6, 6], rect.center.xOffset(-rect.halfHeight))
        assertEqual(polar[6, 8], rect.top)
        assertEqual(polar[3, 2], (rect.center.x + rect.heightScaled(0.25), rect.center.y))
    }
    
    func testPointsForEquidistantUsingMaxDimension() {
        let polar = LayoutGuide.polar(rect, rings: 6, segments: 8, useMaxDimension: true)
        assertEqual(polar[0, 0], (rect.center))
        assertEqual(polar[6, 2], rect.trailing)
        assertEqual(polar[6, 4], rect.center.yOffset(rect.halfWidth))
        assertEqual(polar[6, 6], rect.leading)
        assertEqual(polar[6, 8], rect.center.yOffset(-rect.halfWidth))
        assertEqual(polar[3, 2], rect.center.xOffset(rect.widthScaled(0.25)))
    }
    
    func testPointsForEquidistantReframed() {
        var polar = LayoutGuide.polar(rect, rings: 6, segments: 8)
        polar = polar.reframed(bottomRightRect, origin: .center)
        assertEqual(polar[0, 0], (bottomRightRect.center))
        assertEqual(polar[6, 2], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polar[6, 4], bottomRightRect.bottom)
        assertEqual(polar[6, 6], bottomRightRect.center.xOffset(-bottomRightRect.halfHeight))
        assertEqual(polar[6, 8], bottomRightRect.top)
        assertEqual(polar[3, 2], (bottomRightRect.center.x + bottomRightRect.heightScaled(0.25), bottomRightRect.center.y))
    }
    
    func testPointsForEquidistantWithOrigin() {
        let grid = LayoutGuide.polar(rect, rings: 6, segments: 8)
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(grid[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[6, 2, origin: bottomRightRect.center], offsetRect.center.xOffset(offsetRect.halfHeight))
        assertEqual(grid[6, 4, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(grid[6, 6, origin: bottomRightRect.center], offsetRect.center.xOffset(-offsetRect.halfHeight))
        assertEqual(grid[6, 8, origin: bottomRightRect.center], offsetRect.top)
        assertEqual(grid[3, 2, origin: bottomRightRect.center], (offsetRect.center.x + offsetRect.heightScaled(0.25), offsetRect.center.y))
    }
    
    func testOutOfBoundsForEquidistant() {
        let polar = LayoutGuide.polar(rect, rings: 5, segments: 8)
        assertEqual(polar[5, -8], rect.top)
        assertEqual(polar[10, -8], rect.top.yOffset(-rect.halfHeight))
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS WITH RELATIVE COORDINATES

extension PolarLayoutGuideTests {
    
    func testPointsForEquidistantForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: 6, segments: 8)
        assertEqual(polar[rel: 0, rel: 0], (rect.center))
        assertEqual(polar[rel: 1, rel: 0.25], rect.center.xOffset(rect.halfHeight))
        assertEqual(polar[rel: 1, 4], rect.bottom)
        assertEqual(polar[rel: 1, rel: 0.75], rect.center.xOffset(-rect.halfHeight))
        assertEqual(polar[rel: 1, rel: 1], rect.top)
        assertEqual(polar[3, rel: 0.25], (rect.center.x + rect.heightScaled(0.25), rect.center.y))
    }

    func testPointsForEquidistantUsingMaxDimensionForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: 6, segments: 8, useMaxDimension: true)
        assertEqual(polar[rel: 0, rel: 0],      (rect.center))
        assertEqual(polar[rel: 1, rel: 0.25],   rect.trailing)
        assertEqual(polar[rel: 1, 4],    rect.center.yOffset(rect.halfWidth))
        assertEqual(polar[rel: 1, rel: 0.75],   rect.leading)
        assertEqual(polar[6, rel: 1],      rect.center.yOffset(-rect.halfWidth))
        assertEqual(polar[rel: 0.5, rel: 0.25], rect.center.xOffset(rect.widthScaled(0.25)))
    }

    func testPointsForEquidistantReframedForRelativeCoordinates() {
        var polar = LayoutGuide.polar(rect, rings: 6, segments: 8)
        polar = polar.reframed(bottomRightRect, origin: .center)
        assertEqual(polar[rel: 0, rel: 0],      (bottomRightRect.center))
        assertEqual(polar[6, rel: 0.25],   bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polar[rel: 1, 4],    bottomRightRect.bottom)
        assertEqual(polar[rel: 1, 6],   bottomRightRect.center.xOffset(-bottomRightRect.halfHeight))
        assertEqual(polar[6, rel: 1],      bottomRightRect.top)
        assertEqual(polar[rel: 0.5, rel: 0.25], (bottomRightRect.center.x + bottomRightRect.heightScaled(0.25), bottomRightRect.center.y))
    }

    func testPointsForEquidistantWithOriginForRelativeCoordinates() {
        let grid = LayoutGuide.polar(rect, rings: 6, segments: 8)
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(grid[rel: 0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[6, rel: 0.25, origin: bottomRightRect.center], offsetRect.center.xOffset(offsetRect.halfHeight))
        assertEqual(grid[rel: 1, rel: 0.5, origin: bottomRightRect.center], offsetRect.bottom)
    }

    func testOutOfBoundsForEquidistantForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: 5, segments: 8)
        assertEqual(polar[rel: 1, rel: -1], rect.top)
        assertEqual(polar[rel: 2, rel: -1], rect.top.yOffset(-rect.halfHeight))
    }
}

// MARK: ----- RELATIVE POINT TESTS

extension PolarLayoutGuideTests {
    
    func testPointsForRelative() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        assertEqual(polar[0, 0], rect.center)
        assertEqual(polar[2, 1], rect.center.xOffset(rect.halfHeight))
        assertEqual(polar[2, 2], rect.bottom)
        assertEqual(polar[0, 2], rect.center)
    }
    
    func testPointsForRelativeUsingMaxDimension() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5], useMaxDimension: true)
        assertEqual(polar[0, 0], rect.center)
        assertEqual(polar[2, 1], rect.trailing)
        assertEqual(polar[2, 2], rect.center.yOffset(rect.halfWidth))
        assertEqual(polar[1, 2], rect.center.yOffset(rect.widthScaled(0.25)))
    }
    
    func testPointsForRelativeReframed() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        polar = polar.reframed(bottomRightRect, origin: .center)
        assertEqual(polar[0, 0], bottomRightRect.center)
        assertEqual(polar[2, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polar[2, 2], bottomRightRect.bottom)
        assertEqual(polar[0, 2], bottomRightRect.center)
    }
    
    func testPointsForRelativeWithOrigin() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(polar[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(polar[2, 1, origin: bottomRightRect.center], offsetRect.center.xOffset(offsetRect.halfHeight))
        assertEqual(polar[2, 2, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(polar[0, 2, origin: bottomRightRect.center], offsetRect.center)
    }
    
    func testOutOfBoundsForRelative() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        assertEqual(polar[5, -8], rect.top)
        assertEqual(polar[10, 8], rect.bottom)
    }
    
    func testPointsForRelativeIsEquivalentToAbsolute() {
        let rings: [CGFloat] = [0, 0.5, 1]
        let polarRelative = LayoutGuide.polar(rect, rings: rings, segments: [0, 0.25, 0.5])
        let polarAbsolute = LayoutGuide.polar(rect, rings: rings, segments: [.cycles(0), .cycles(0.25), .cycles(0.5)])
        let polarAbsoluteDegrees = LayoutGuide.polar(rect, rings: rings, segments: [0.degrees, 90.degrees, 180.degrees])
        for ring in 0..<rings.count {
            for segment in 0..<3 {
                assertEqual(polarRelative[ring, segment], polarAbsolute[ring, segment])
                assertEqual(polarAbsolute[ring, segment], polarAbsoluteDegrees[ring, segment])
            }
        }
    }
}

// MARK: ----- RELATIVE POINT TESTS WITH RELATIVE COORDINATES

extension PolarLayoutGuideTests {
    
    func testPointsForRelativeForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        assertEqual(polar[rel: 0, rel: 0],    rect.center)
        assertEqual(polar[rel: 1, 1], rect.center.xOffset(rect.halfHeight))
        assertEqual(polar[2, rel: 0.5],  rect.bottom)
        assertEqual(polar[rel: 0, rel: 1],    rect.center)
    }

    func testPointsForRelativeUsingMaxDimensionForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5], useMaxDimension: true)
        assertEqual(polar[rel: 0, rel: 0],    rect.center)
        assertEqual(polar[rel: 1, 1], rect.trailing)
        assertEqual(polar[rel: 1.0, rel: 0.5],  rect.center.yOffset(rect.halfWidth))
        assertEqual(polar[rel: 0.5, rel: 0.5],    rect.center.yOffset(rect.widthScaled(0.25)))
    }

    func testPointsForRelativeReframedForRelativeCoordinates() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        polar = polar.reframed(bottomRightRect, origin: .center)
        assertEqual(polar[rel: 0, rel: 0], bottomRightRect.center)
        assertEqual(polar[rel: 1, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polar[2, rel: 0.5], bottomRightRect.bottom)
        assertEqual(polar[rel: 0, rel: 0.5], bottomRightRect.center)
    }

    func testPointsForRelativeWithOriginForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(polar[rel: 0, rel: 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(polar[2, rel: 0.25, origin: bottomRightRect.center], offsetRect.center.xOffset(offsetRect.halfHeight))
        assertEqual(polar[rel: 1, rel: 0.5, origin: bottomRightRect.center], offsetRect.bottom)
    }

    func testOutOfBoundsForRelativeForRelativeCoordinates() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        assertEqual(polar[rel: 2, rel: 2], rect.top.yOffset(-rect.halfHeight))
    }

}

// MARK: ----- EQUIDISTANT RING RELATIVE SEGMENT POINT TESTS

extension PolarLayoutGuideTests {
    
    func testPointsForEquidistantRingRelativeSegment() {
        let polar = LayoutGuide.polar(rect, rings: 6, segments: [0, 0.25, 0.5])
        assertEqual(polar[0, 0], rect.center)
        assertEqual(polar[6, 1], rect.center.xOffset(rect.halfHeight))
        assertEqual(polar[6, 2], rect.bottom)
        assertEqual(polar[0, 2], rect.center)
        assertEqual(polar[3, 2], rect.center.yOffset(rect.heightScaled(0.25)))
    }
    
    func testPointsForEquidistantRingRelativeSegmentReframed() {
        var polar = LayoutGuide.polar(rect, rings: 6, segments: [0, 0.25, 0.5])
        polar = polar.reframed(bottomRightRect, origin: .center)
        assertEqual(polar[0, 0], bottomRightRect.center)
        assertEqual(polar[6, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polar[6, 2], bottomRightRect.bottom)
        assertEqual(polar[0, 2], bottomRightRect.center)
        assertEqual(polar[3, 2], bottomRightRect.center.yOffset(bottomRightRect.heightScaled(0.25)))
    }
    
    func testPointsForEquidistantRingRelativeSegmentWithOrigin() {
        let polar = LayoutGuide.polar(rect, rings: 6, segments: [0, 0.25, 0.5])
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(polar[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(polar[6, 1, origin: bottomRightRect.center], offsetRect.center.xOffset(offsetRect.halfHeight))
        assertEqual(polar[6, 2, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(polar[0, 2, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(polar[3, 2, origin: bottomRightRect.center], offsetRect.center.yOffset(offsetRect.heightScaled(0.25)))
    }
    
    func testOutOfBoundsForEquidistantRingRelativeSegment() {
        let polar = LayoutGuide.polar(rect, rings: 5, segments: [0, 0.25, 0.5])
        assertEqual(polar[5, -8], rect.top)
        assertEqual(polar[10, 8], rect.bottom.yOffset(rect.halfHeight))
    }
    
    func testPointsForEquidistantRingRelativeIsEquivalentToAbsolute() {
        let rings = 5
        let polarRelative = LayoutGuide.polar(rect, rings: rings, segments: [0, 0.25, 0.5])
        let polarAbsolute = LayoutGuide.polar(rect, rings: rings, segments: [.cycles(0), .cycles(0.25), .cycles(0.5)])
        let polarAbsoluteDegrees = LayoutGuide.polar(rect, rings: rings, segments: [0.degrees, 90.degrees, 180.degrees])
        for ring in 0..<rings {
            for segment in 0..<3 {
                assertEqual(polarRelative[ring, segment], polarAbsolute[ring, segment])
                assertEqual(polarAbsolute[ring, segment], polarAbsoluteDegrees[ring, segment])
            }
        }
    }
}


// MARK: -----  RELATIVE RING EQUIDISTANT SEGMENT POINT TESTS

extension PolarLayoutGuideTests {
    
    func testPointsForRelativeRingEquidistantSegment() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        assertEqual(polar[0, 0], rect.center)
        assertEqual(polar[2, 2], rect.center.xOffset(rect.halfHeight))
        assertEqual(polar[2, 4], rect.bottom)
        assertEqual(polar[0, 4], rect.center)
    }
    
    func testPointsForRelativeRingEquidistantSegmentReframed() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        polar = polar.reframed(bottomRightRect, origin: .center)
        assertEqual(polar[0, 0], bottomRightRect.center)
        assertEqual(polar[2, 2], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polar[2, 4], bottomRightRect.bottom)
        assertEqual(polar[0, 4], bottomRightRect.center)
    }
    
    func testPointsForRelativeRingEquidistantSegmentWithOrigin() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(polar[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(polar[2, 2, origin: bottomRightRect.center], offsetRect.center.xOffset(offsetRect.halfHeight))
        assertEqual(polar[2, 4, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(polar[0, 4, origin: bottomRightRect.center], offsetRect.center)
    }
    
    func testOutOfBoundsForRelativeRingEquidistantSegment() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        assertEqual(polar[5, -8], rect.top)
        assertEqual(polar[10, 8], rect.top)
    }
}

// MARK: ----- OFFSET POLAR LAYOUT GUIDE

extension PolarLayoutGuideTests {
    
    func testPointsWithOffset() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 10)
        
        var polarOffset = polar.offset(offset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.center)
        assertEqual(polarOffset[2, 0], rect.top)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarOffset = polar.offset(offset, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offset.asCGPoint.scaled(0.5))
        
        polarOffset = polar.offset(10, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + CGPoint(10).scaled(0.5))
        
        polarOffset = polar.offset(offset)
        assertEqual(polarOffset[0, 0], rect.center + offset.asCGPoint)
        assertEqual(polarOffset[2, 0], rect.top + offset.asCGPoint)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offset.asCGPoint)
        
        polarOffset = polar.offset(10)
        assertEqual(polarOffset[0, 0], rect.center.offset(CGPoint(10)))
        assertEqual(polarOffset[2, 0], rect.top.offset(CGPoint(10)))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight).offset(CGPoint(10)))
    }
    
    func testPointsWithOffsetWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 10)
        
        var polarOffset = polarConfig
            .offset(offset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center)
        assertEqual(polarOffset[2, 0], rect.top)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarOffset = polarConfig
            .offset(offset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offset.asCGPoint.scaled(0.5))
        
        polarOffset = polarConfig
            .offset(10, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + CGPoint(10).scaled(0.5))
        
        polarOffset = polarConfig
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center + offset.asCGPoint)
        assertEqual(polarOffset[2, 0], rect.top + offset.asCGPoint)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offset.asCGPoint)
        
        polarOffset = polarConfig
            .offset(10)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.offset(CGPoint(10)))
        assertEqual(polarOffset[2, 0], rect.top.offset(CGPoint(10)))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight).offset(CGPoint(10)))
    }
    
    func testPointsWithOffsetForRelativeReframed() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        polar = polar.reframed(bottomRightRect, origin: .center)
        let offset = CGPoint(5, 10)
        
        var polarOffset = polar.offset(offset, factor: 0)
        assertEqual(polarOffset[0, 0], bottomRightRect.center)
        assertEqual(polarOffset[2, 0], bottomRightRect.top)
        assertEqual(polarOffset[2, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        
        polarOffset = polar.offset(offset, factor: 0.5)
        assertEqual(polarOffset[0, 0], bottomRightRect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 0], bottomRightRect.top + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight) + offset.asCGPoint.scaled(0.5))
        
        polarOffset = polar.offset(offset)
        assertEqual(polarOffset[0, 0], bottomRightRect.center + offset.asCGPoint)
        assertEqual(polarOffset[2, 0], bottomRightRect.top + offset.asCGPoint)
        assertEqual(polarOffset[2, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight) + offset.asCGPoint)
    }
    
    func testPointsWithOffsetForRelativeWithOrigin() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 10)
        
        var polarOffset = polar.offset(offset, factor: 0)
        assertEqual(polarOffset[0, 0, origin: rect.topLeading], rect.topLeading)
        assertEqual(polarOffset[2, 0, origin: rect.topLeading], rect.topLeading.yOffset(-rect.halfHeight))
        assertEqual(polarOffset[2, 1, origin: rect.topLeading], rect.topLeading.xOffset(rect.halfHeight))
        
        polarOffset = polar.offset(offset, factor: 0.5)
        assertEqual(polarOffset[0, 0, origin: rect.topLeading], rect.topLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 0, origin: rect.topLeading], rect.topLeading.yOffset(-rect.halfHeight) + offset.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 1, origin: rect.topLeading], rect.topLeading.xOffset(rect.halfHeight) + offset.asCGPoint.scaled(0.5))
        
        polarOffset = polar.offset(offset)
        assertEqual(polarOffset[0, 0, origin: rect.topLeading], rect.topLeading + offset.asCGPoint)
        assertEqual(polarOffset[2, 0, origin: rect.topLeading], rect.topLeading.yOffset(-rect.halfHeight) + offset.asCGPoint)
        assertEqual(polarOffset[2, 1, origin: rect.topLeading], rect.topLeading.xOffset(rect.halfHeight) + offset.asCGPoint)
    }
}

// MARK: ----- OFFSET FROM AND TO POLAR LAYOUT GUIDE

extension PolarLayoutGuideTests {
    
    func testPointsWithOffsetFromTo() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offsetFrom = CGPoint(0, 0)
        let offsetTo = CGPoint(5, 10)
        
        var polarOffset = polar.offset(from: offsetFrom, to: offsetTo, factor: 0)
        assertEqual(polarOffset[0, 0], rect.center)
        assertEqual(polarOffset[2, 0], rect.top)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarOffset = polar.offset(from: offsetFrom, to: offsetTo, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offsetTo.asCGPoint.scaled(0.5))
        polarOffset = polar.offset(from: .point(0), to: .point(10), factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + CGPoint(10).scaled(0.5))
        
        polarOffset = polar.offset(from: offsetFrom, to: offsetTo, factor: 1)
        assertEqual(polarOffset[0, 0], rect.center + offsetTo.asCGPoint)
        assertEqual(polarOffset[2, 0], rect.top + offsetTo.asCGPoint)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offsetTo.asCGPoint)
    }
    
    func testPointsWithOffsetFromToWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offsetFrom = CGPoint(0, 0)
        let offsetTo = CGPoint(5, 10)
        
        var polarOffset = polarConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center)
        assertEqual(polarOffset[2, 0], rect.top)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarOffset = polarConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offsetTo.asCGPoint.scaled(0.5))
        
        polarOffset = polarConfig
            .offset(from: .point(0), to: .point(10), factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 0], rect.top + CGPoint(10).scaled(0.5))
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + CGPoint(10).scaled(0.5))
        
        polarOffset = polarConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center + offsetTo.asCGPoint)
        assertEqual(polarOffset[2, 0], rect.top + offsetTo.asCGPoint)
        assertEqual(polarOffset[2, 1], rect.center.xOffset(rect.halfHeight) + offsetTo.asCGPoint)
    }
}


// MARK: ----- OFFSET IN X AND Y

extension PolarLayoutGuideTests {
    
    func testPointsWithXOffset() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let xOffset: CGFloat = 10
        
        var polarOffset = polar.xOffset(xOffset)
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset))
        
        polarOffset = polar.xOffset(xOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polar.xOffset(xOffset, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = polar.xOffset(xOffset, factor: 1)
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset))
    }
    
    func testPointsWithXOffsetWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let xOffset: CGFloat = 10
        
        var polarOffset = polarConfig
            .xOffset(xOffset)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset))
        
        polarOffset = polarConfig
            .xOffset(xOffset, factor: 0)
                    .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polarConfig
            .xOffset(xOffset, factor: 0.5)
                    .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = polarConfig
            .xOffset(xOffset, factor: 1)
                    .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset))
    }

    func testPointsWithYOffset() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let yOffset: CGFloat = 10
        
        var polarOffset = polar.yOffset(yOffset)
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset))
        
        polarOffset = polar.yOffset(yOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polar.yOffset(yOffset, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = polar.yOffset(yOffset, factor: 1)
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset))
    }
    
    func testPointsWithYOffsetWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let yOffset: CGFloat = 10
        
        var polarOffset = polarConfig
            .yOffset(yOffset)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset))
        
        polarOffset = polarConfig
            .yOffset(yOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polarConfig
            .yOffset(yOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = polarConfig
            .yOffset(yOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset))
    }
}

// MARK: ----- OFFSET IN X AND Y FROM TO

extension PolarLayoutGuideTests {
    
    func testPointsWithXOffsetFromTo() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let xOffset: CGFloat = 10
        
        var polarOffset = polar.xOffset(from: 0, to: xOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polar.xOffset(from: 0, to: xOffset, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = polar.xOffset(from: 0, to: xOffset, factor: 1)
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset))
    }
    
    func testPointsWithXOffsetFromToWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let xOffset: CGFloat = 10
        
        var polarOffset = polarConfig
            .xOffset(from: 0, to: xOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polarConfig
            .xOffset(from: 0, to: xOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = polarConfig
            .xOffset(from: 0, to: xOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.xOffset(xOffset))
    }

    func testPointsWithYOffsetFromTo() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let yOffset: CGFloat = 10
        
        var polarOffset = polar.yOffset(from: 0, to: yOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polar.yOffset(from: 0, to: yOffset, factor: 0.5)
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = polar.yOffset(from: 0, to: yOffset, factor: 1)
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset))
    }
    
    func testPointsWithYOffsetFromToWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let yOffset: CGFloat = 10
        
        var polarOffset = polarConfig
            .yOffset(from: 0, to: yOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center)
        
        polarOffset = polarConfig
            .yOffset(from: 0, to: yOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = polarConfig
            .yOffset(from: 0, to: yOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.center.yOffset(yOffset))
    }
}

// MARK: ----- ROTATE POLAR LAYOUT GUIDE

extension PolarLayoutGuideTests {
    
    func testPointsWithRotation() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarRotated = polar.rotated(180.degrees, factor: 0)
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.top)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarRotated = polar.rotated(180.degrees, factor: 0.5)
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(polarRotated[2, 1], rect.bottom)
        
        polarRotated = polar.rotated(180.degrees)
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.bottom)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(-rect.halfHeight))
    }
    
    func testPointsWithRotationWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarRotated = polarConfig
            .rotated(180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.top)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarRotated = polarConfig
            .rotated(180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.center.xOffset(rect.halfHeight))
        
        polarRotated = polarConfig
            .rotated(180.degrees)
            .layout(in: rect)
        
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.bottom)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(-rect.halfHeight))
    }
    
    func testPointsWithRotationForRelativeReframed() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        polar = polar.reframed(bottomRightRect, origin: .center)
        
        var polarRotated = polar.rotated(180.degrees, factor: 0)
        assertEqual(polarRotated[0, 0], bottomRightRect.center)
        assertEqual(polarRotated[2, 0], bottomRightRect.top)
        assertEqual(polarRotated[2, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        
        polarRotated = polar.rotated(180.degrees, factor: 0.5)
        assertEqual(polarRotated[0, 0], bottomRightRect.center)
        assertEqual(polarRotated[2, 0], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(polarRotated[2, 1], bottomRightRect.bottom)
        
        polarRotated = polar.rotated(180.degrees)
        assertEqual(polarRotated[0, 0], bottomRightRect.center)
        assertEqual(polarRotated[2, 0], bottomRightRect.bottom)
        assertEqual(polarRotated[2, 1], bottomRightRect.center.xOffset(-bottomRightRect.halfHeight))
    }
    
    func testPointsWithRotationForRelativeWithOrigin() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        let offset = bottomRightRect.center - rect.center
        
        var polarRotated = polar.rotated(180.degrees, factor: 0)
        assertEqual(polarRotated[0, 0, origin: bottomRightRect.center], rect.center + offset)
        assertEqual(polarRotated[2, 0, origin: bottomRightRect.center], rect.top + offset)
        assertEqual(polarRotated[2, 1, origin: bottomRightRect.center], rect.center.xOffset(rect.halfHeight) + offset)
        
        polarRotated = polar.rotated(180.degrees, factor: 0.5)
        assertEqual(polarRotated[0, 0, origin: bottomRightRect.center], bottomRightRect.center)
        assertEqual(polarRotated[2, 0, origin: bottomRightRect.center], rect.center.xOffset(rect.halfHeight) + offset)
        assertEqual(polarRotated[2, 1, origin: bottomRightRect.center], rect.bottom + offset)
        
        polarRotated = polar.rotated(180.degrees)
        assertEqual(polarRotated[0, 0, origin: bottomRightRect.center], rect.center + offset)
        assertEqual(polarRotated[2, 0, origin: bottomRightRect.center], rect.bottom + offset)
        assertEqual(polarRotated[2, 1, origin: bottomRightRect.center], rect.center.xOffset(-rect.halfHeight) + offset)
    }
}

// MARK: ----- ROTATE POLAR LAYOUT GUIDE FROM TO

extension PolarLayoutGuideTests {
    
    func testPointsWithRotationFromTo() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarRotated = polar.rotated(from: 0.degrees, to: 180.degrees, factor: 0)
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.top)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarRotated = polar.rotated(from: 0.degrees, to: 180.degrees, factor: 0.5)
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(polarRotated[2, 1], rect.bottom)
        
        polarRotated = polar.rotated(from: 0.degrees, to: 180.degrees, factor: 1)
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.bottom)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(-rect.halfHeight))
    }
    
    func testPointsWithRotationFromToWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarRotated = polarConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.top)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarRotated = polarConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(polarRotated[2, 1], rect.bottom)
        
        polarRotated = polarConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarRotated[0, 0], rect.center)
        assertEqual(polarRotated[2, 0], rect.bottom)
        assertEqual(polarRotated[2, 1], rect.center.xOffset(-rect.halfHeight))
    }
}

// MARK: ----- SCALE POLAR LAYOUT GUIDE

extension PolarLayoutGuideTests {
    
    func testPointsWithScale() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polar.scaled(2, factor: 0)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polar.scaled(2, factor: 0.5)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.heightScaled(0.75)))
        
        polarScaled = polar.scaled(2)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.height))
    }
    
    func testPointsWithXScale() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polar.xScaled(2, factor: 0)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polar.xScaled(2, factor: 0.5)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.heightScaled(0.75)))
        
        polarScaled = polar.xScaled(2)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.height))
    }

    func testPointsWithYScale() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polar.yScaled(2, factor: 0)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polar.yScaled(2, factor: 0.5)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polar.yScaled(2)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
    }
    
    func testPointsWithScaleWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polarConfig
            .scaled(2, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polarConfig
            .scaled(2, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.heightScaled(0.75)))
        
        polarScaled = polarConfig
            .scaled(2)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.height))
    }
    
    func testPointsWithXScaleWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polarConfig
            .xScaled(2, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polarConfig
            .xScaled(2, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.heightScaled(0.75)))
        
        polarScaled = polarConfig
            .xScaled(2)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.height))
    }
    
    func testPointsWithYScaleWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polarConfig
            .yScaled(2, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polarConfig
            .yScaled(2, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polarConfig
            .yScaled(2)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
    }

    func testPointsWithScaleForRelativeReframed() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        polar = polar.reframed(bottomRightRect, origin: .center)
        
        var polarScaled = polar.scaled(2, factor: 0)
        assertEqual(polarScaled[0, 0], bottomRightRect.center)
        assertEqual(polarScaled[2, 0], bottomRightRect.top)
        assertEqual(polarScaled[2, 1], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        
        polarScaled = polar.scaled(2, factor: 0.5)
        assertEqual(polarScaled[0, 0], bottomRightRect.center)
        assertEqual(polarScaled[2, 0], bottomRightRect.top.yOffset(-bottomRightRect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], bottomRightRect.center.xOffset(bottomRightRect.heightScaled(0.75)))
        
        polarScaled = polar.scaled(2)
        assertEqual(polarScaled[0, 0], bottomRightRect.center)
        assertEqual(polarScaled[2, 0], bottomRightRect.top.yOffset(-bottomRightRect.halfHeight))
        assertEqual(polarScaled[2, 1], bottomRightRect.center.xOffset(bottomRightRect.height))
    }
    
    func testPointsWithScaleForRelativeWithOrigin() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset: CGPoint = .x(-rect.halfWidth)
        
        var polarScaled = polar.scaled(2, factor: 0)
        assertEqual(polarScaled[0, 0, origin: rect.leading], rect.center + offset)
        assertEqual(polarScaled[2, 0, origin: rect.leading], rect.top + offset)
        assertEqual(polarScaled[2, 1, origin: rect.leading], rect.center.xOffset(rect.halfHeight) + offset)
        
        polarScaled = polar.scaled(2, factor: 0.5)
        assertEqual(polarScaled[0, 0, origin: rect.leading], rect.center + offset)
        assertEqual(polarScaled[2, 0, origin: rect.leading], rect.top.yOffset(-rect.heightScaled(0.25)) + offset)
        assertEqual(polarScaled[2, 1, origin: rect.leading], rect.center.xOffset(rect.heightScaled(0.75)) + offset)
        
        polarScaled = polar.scaled(2)
        assertEqual(polarScaled[0, 0, origin: rect.leading], rect.center + offset)
        assertEqual(polarScaled[2, 0, origin: rect.leading], rect.top.yOffset(-rect.halfHeight) + offset)
        assertEqual(polarScaled[2, 1, origin: rect.leading], rect.center.xOffset(rect.height) + offset)
    }
}

// MARK: ----- SCALE POLAR LAYOUT GUIDE FROM TO

extension PolarLayoutGuideTests {
    
    func testPointsWithScaleFromTo() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polar.scaled(from: 1, to: 2, factor: 0)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polar.scaled(from: 1, to: 2, factor: 0.5)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.heightScaled(0.75)))
        
        polarScaled = polar.scaled(from: 1, to: 2, factor: 1)
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.height))
    }
    
    func testPointsWithScaleFromToWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        
        var polarScaled = polarConfig
            .scaled(from: 1, to: 2, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top)
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarScaled = polarConfig
            .scaled(from: 1, to: 2, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.heightScaled(0.25)))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.heightScaled(0.75)))
        
        polarScaled = polarConfig
            .scaled(from: 1, to: 2, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarScaled[0, 0], rect.center)
        assertEqual(polarScaled[2, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(polarScaled[2, 1], rect.center.xOffset(rect.height))
    }
}

// MARK: ----- ROTATE AND OFFSET POLAR LAYOUT GUIDE

extension PolarLayoutGuideTests {
    
    func testPointsWithRotationAndOffset() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 10)
        
        var polarTransformed = polar
            .rotated(180.degrees, factor: 0)
            .offset(offset, factor: 0)
        
        assertEqual(polarTransformed[0, 0], rect.center)
        assertEqual(polarTransformed[2, 0], rect.top)
        assertEqual(polarTransformed[2, 1], rect.center.xOffset(rect.halfHeight))
        assertEqual(polarTransformed[rel: 0, 0], polarTransformed[0, 0])
        assertEqual(polarTransformed[2, rel: 0], polarTransformed[2, 0])
        assertEqual(polarTransformed[rel: 1, rel: 0.25], polarTransformed[2, 1])
        
        polarTransformed = polar
            .rotated(180.degrees, factor: 0.5)
            .offset(offset, factor: 0.5)
        
        assertEqual(polarTransformed[0, 0], rect.center + offset.scaled(0.5).asCGPoint)
        assertEqual(polarTransformed[2, 0], rect.center.xOffset(rect.halfHeight) + offset.scaled(0.5).asCGPoint)
        assertEqual(polarTransformed[2, 1], rect.bottom + offset.scaled(0.5).asCGPoint)
        assertEqual(polarTransformed[rel: 0, 0], polarTransformed[0, 0])
        assertEqual(polarTransformed[2, rel: 0], polarTransformed[2, 0])
        assertEqual(polarTransformed[rel: 1, rel: 0.25], polarTransformed[2, 1])
        
        polarTransformed = polar
            .rotated(180.degrees)
            .offset(offset)
        
        assertEqual(polarTransformed[0, 0], rect.center + offset.asCGPoint)
        assertEqual(polarTransformed[2, 0], rect.bottom + offset.asCGPoint)
        assertEqual(polarTransformed[2, 1], rect.center.xOffset(-rect.halfHeight) + offset.asCGPoint)
        assertEqual(polarTransformed[rel: 0, 0], polarTransformed[0, 0])
        assertEqual(polarTransformed[2, rel: 0], polarTransformed[2, 0])
        assertEqual(polarTransformed[rel: 1, rel: 0.25], polarTransformed[2, 1])
    }
    
    func testPointsWithRotationAndOffsetWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 10)
        
        var polarTransformed = polarConfig
            .rotated(180.degrees, factor: 0)
            .offset(offset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarTransformed[0, 0], rect.center)
        assertEqual(polarTransformed[2, 0], rect.top)
        assertEqual(polarTransformed[2, 1], rect.center.xOffset(rect.halfHeight))
        assertEqual(polarTransformed[rel: 0, 0], polarTransformed[0, 0])
        assertEqual(polarTransformed[2, rel: 0], polarTransformed[2, 0])
        assertEqual(polarTransformed[rel: 1, rel: 0.25], polarTransformed[2, 1])
        
        polarTransformed = polarConfig
            .rotated(180.degrees, factor: 0.5)
            .offset(offset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarTransformed[0, 0], rect.center + offset.scaled(0.5).asCGPoint)
        assertEqual(polarTransformed[2, 0], rect.center.xOffset(rect.halfHeight) + offset.scaled(0.5).asCGPoint)
        assertEqual(polarTransformed[2, 1], rect.bottom + offset.scaled(0.5).asCGPoint)
        assertEqual(polarTransformed[rel: 0, 0], polarTransformed[0, 0])
        assertEqual(polarTransformed[2, rel: 0], polarTransformed[2, 0])
        assertEqual(polarTransformed[rel: 1, rel: 0.25], polarTransformed[2, 1])
        
        polarTransformed = polarConfig
            .rotated(180.degrees)
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(polarTransformed[0, 0], rect.center + offset.asCGPoint)
        assertEqual(polarTransformed[2, 0], rect.bottom + offset.asCGPoint)
        assertEqual(polarTransformed[2, 1], rect.center.xOffset(-rect.halfHeight) + offset.asCGPoint)
        assertEqual(polarTransformed[rel: 0, 0], polarTransformed[0, 0])
        assertEqual(polarTransformed[2, rel: 0], polarTransformed[2, 0])
        assertEqual(polarTransformed[rel: 1, rel: 0.25], polarTransformed[2, 1])
    }
}

// MARK: ----- OFFSET AND ROTATE POLAR LAYOUT GUIDE

extension PolarLayoutGuideTests {
    
    func testPointsWithOffsetAndRotation() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 0)
        
        var polarTransformed = polar
            .offset(offset, factor: 0)
            .rotated(180.degrees, factor: 0)
        
        assertEqual(polarTransformed[0, 0], rect.center)
        assertEqual(polarTransformed[2, 0], rect.top)
        assertEqual(polarTransformed[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarTransformed = polar
            .offset(offset, factor: 0.5)
            .rotated(180.degrees, factor: 0.5)
        
        assertEqual(polarTransformed[0, 0], rect.center.yOffset(offset.halfWidth))
        
        polarTransformed = polar
            .offset(offset)
            .rotated(180.degrees)
        
        assertEqual(polarTransformed[0, 0], rect.center.xOffset(-offset.width))
        assertEqual(polarTransformed[2, 0], rect.center.xOffset(-offset.width).yOffset(rect.halfHeight))
    }
    
    func testPointsWithOffsetAndRotationWithConfig() {
        let polarConfig = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offset = CGPoint(5, 0)
        
        var polarTransformed = polarConfig
            .offset(offset, factor: 0)
            .rotated(180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarTransformed[0, 0], rect.center)
        assertEqual(polarTransformed[2, 0], rect.top)
        assertEqual(polarTransformed[2, 1], rect.center.xOffset(rect.halfHeight))
        
        polarTransformed = polarConfig
            .offset(offset, factor: 0.5)
            .rotated(180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarTransformed[0, 0], rect.center.yOffset(offset.halfWidth))
        
        polarTransformed = polarConfig
            .offset(offset)
            .rotated(180.degrees)
            .layout(in: rect)
        
        assertEqual(polarTransformed[0, 0], rect.center.xOffset(-offset.width))
        assertEqual(polarTransformed[2, 0], rect.center.xOffset(-offset.width).yOffset(rect.halfHeight))
    }
}

// MARK: ----- CONSTRUCTED FROM LAYOUT CONFIG OFFSET AND ROTATE

extension PolarLayoutGuideTests {
    
    func testPointsWithOffsetAndRotationFromConfig() {
        let offset = CGPoint(5, 0)
        
        let polar = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
            .offset(offset)
            .rotated(180.degrees)
            .layout(in: rect)
        
        assertEqual(polar[0, 0], rect.center.xOffset(-offset.width))
        assertEqual(polar[0, 0], polar.center)
        assertEqual(polar[2, 0], rect.center.xOffset(-offset.width).yOffset(rect.halfHeight))
        assertEqual(polar[2, 0], polar.top)
        assertEqual(polar[2, 1], polar.trailing)
        assertEqual(polar[2, 2], polar.bottom)
    }
}

// MARK: ----- CONSTRUCT WITH POLAR CONFIG OVERLOADS

extension PolarLayoutGuideTests {

    func testLayoutGuideConfigGridOverloads() {
        
        var polar = LayoutGuideConfig.polar(rings: 2, segments: 2).layout(in: rect)
        assertEqual(polar[0, 0], rect.center)
        polar = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: 2).layout(in: rect)
        assertEqual(polar[0, 0], rect.center)
        polar = LayoutGuideConfig.polar(rings: 2, segments: [0, 0.5, 1]).layout(in: rect)
        assertEqual(polar[0, 0], rect.center)
        polar = LayoutGuideConfig.polar(rings: [0, 0.5, 1], segments: [0, 0.5, 1]).layout(in: rect)
        assertEqual(polar[0, 0], rect.center)
    }
}

// MARK: ----- CONSTRUCTED WITH ALTERNATIVE ORIGIN

extension PolarLayoutGuideTests {
    
    func testLayoutGuideAlternativeOrigin() {
        
        var polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .topLeading)
        assertEqual(polar[0, 0], rect.topLeading)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .top)
        assertEqual(polar[0, 0], rect.top)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .topTrailing)
        assertEqual(polar[0, 0], rect.topTrailing)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .trailing)
        assertEqual(polar[0, 0], rect.trailing)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .bottomTrailing)
        assertEqual(polar[0, 0], rect.bottomTrailing)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .bottom)
        assertEqual(polar[0, 0], rect.bottom)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .bottomLeading)
        assertEqual(polar[0, 0], rect.bottomLeading)
        polar = LayoutGuide.polar(rect, rings: 2, segments: 2, origin: .leading)
        assertEqual(polar[0, 0], rect.leading)
    }
    
    func testLayoutGuideAlternativeOriginWithConfig() {
        
        var polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .topLeading).layout(in: rect)
        
        assertEqual(polar[0, 0], rect.topLeading)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .top).layout(in: rect)
        assertEqual(polar[0, 0], rect.top)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .topTrailing).layout(in: rect)
        assertEqual(polar[0, 0], rect.topTrailing)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .trailing).layout(in: rect)
        assertEqual(polar[0, 0], rect.trailing)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .bottomTrailing).layout(in: rect)
        assertEqual(polar[0, 0], rect.bottomTrailing)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .bottom).layout(in: rect)
        assertEqual(polar[0, 0], rect.bottom)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .bottomLeading).layout(in: rect)
        assertEqual(polar[0, 0], rect.bottomLeading)
        polar = LayoutGuideConfig.polar(rings: 2, segments: 2, origin: .leading).layout(in: rect)
        assertEqual(polar[0, 0], rect.leading)
    }
}

// MARK: ----- DIMENSION PROPERTIES

extension PolarLayoutGuideTests {
    
    private func getPolarRect() -> CGRect {
        let origin = calcOrigin(in: rect, origin: .center)
        let size: CGSize = .square(rect.minDimension)
        return CGRect(origin.offset(in: size, anchor: .center), size)
    }
    
    func testPropertiesForPolarLayout() {
        let polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.5, 1])
        let polarRect = getPolarRect()
        
        assertEqual(polar.topLeading, polarRect.topLeading)
        assertEqual(polar.top, polarRect.top)
        assertEqual(polar.topTrailing, polarRect.topTrailing)
        assertEqual(polar.trailing, polarRect.trailing)
        assertEqual(polar.bottomTrailing, polarRect.bottomTrailing)
        assertEqual(polar.bottom, polarRect.bottom)
        assertEqual(polar.bottomLeading, polarRect.bottomLeading)
        assertEqual(polar.leading, polarRect.leading)
        assertEqual(polar.center, polarRect.center)
    }
    
    func testPropertiesForScaledPolarLayout() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.5, 1])
        let polarRect = getPolarRect()
        polar = polar.scaled(2)

        assertEqual(polar.topLeading, polarRect.topLeading.offset(polarRect.sizeScaled(-0.5)))
        assertEqual(polar.top, polarRect.top.yOffset(-polarRect.halfHeight))
        assertEqual(polar.topTrailing, polarRect.topTrailing.offset(polarRect.sizeScaled(.point(0.5, -0.5))))
        assertEqual(polar.trailing, polarRect.trailing.xOffset(polarRect.halfWidth))
        assertEqual(polar.bottomTrailing, polarRect.bottomTrailing.offset(polarRect.sizeScaled(0.5)))
        assertEqual(polar.bottom, polarRect.bottom.yOffset(polarRect.halfHeight))
        assertEqual(polar.bottomLeading, polarRect.bottomLeading.offset(polarRect.sizeScaled(.point(-0.5, 0.5))))
        assertEqual(polar.leading, polarRect.leading.xOffset(-polarRect.halfWidth))
    }

    func testPropertiesForOffsetPolarLayout() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.5, 1])
        let polarRect = getPolarRect()

        let offset = CGPoint(15, 20)
        polar = polar.offset(offset)

        assertEqual(polar.topLeading, polarRect.topLeading.offset(offset))
        assertEqual(polar.top, polarRect.top.offset(offset))
        assertEqual(polar.topTrailing, polarRect.topTrailing.offset(offset))
        assertEqual(polar.trailing, polarRect.trailing.offset(offset))
        assertEqual(polar.bottomTrailing, polarRect.bottomTrailing.offset(offset))
        assertEqual(polar.bottom, polarRect.bottom.offset(offset))
        assertEqual(polar.bottomLeading, polarRect.bottomLeading.offset(offset))
        assertEqual(polar.leading, polarRect.leading.offset(offset))
    }

    func testPropertiesForRotatedPolarLayout() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.5, 1])
        let polarRect = getPolarRect()
        polar = polar.rotated(180.degrees)

        assertEqual(polar.topLeading, polarRect.bottomTrailing)
        assertEqual(polar.top, polarRect.bottom)
        assertEqual(polar.topTrailing, polarRect.bottomLeading)
        assertEqual(polar.trailing, polarRect.leading)
        assertEqual(polar.bottomTrailing, polarRect.topLeading)
        assertEqual(polar.bottom, polarRect.top)
        assertEqual(polar.bottomLeading, polarRect.topTrailing)
        assertEqual(polar.leading, polarRect.trailing)
    }

    func testPropertiesForRotatedAndOffsetGridLayout() {
        var polar = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.5, 1])
        let polarRect = getPolarRect()
        let offset = CGPoint(15, 20)
        polar = polar.rotated(180.degrees)
        polar = polar.offset(offset)

        assertEqual(polar.topLeading, polarRect.bottomTrailing.offset(offset))
        assertEqual(polar[0, 0], polar.center)
        assertEqual(polar.top, polarRect.bottom.offset(offset))
        assertEqual(polar[2, 0], polar.top)
        assertEqual(polar.topTrailing, polarRect.bottomLeading.offset(offset))
        assertEqual(polar[2, 1], polar.bottom)
        assertEqual(polar.trailing, polarRect.leading.offset(offset))
        assertEqual(polar.bottomTrailing, polarRect.topLeading.offset(offset))
        assertEqual(polar.bottom, polarRect.top.offset(offset))
        assertEqual(polar.bottomLeading, polarRect.topTrailing.offset(offset))
        assertEqual(polar.leading, polarRect.trailing.offset(offset))
        assertEqual(polar.center, polarRect.center.offset(offset))
    }
}

// MARK: ----- ANCHOR LOCATION

extension PolarLayoutGuideTests {
    
    func testAnchorLocation() {
        let polar = LayoutGuide.polar(rect, rings: 10, segments: 10)
        let polarRect = getPolarRect()
        assertEqual(polar.anchorLocation(for: .topLeading), polarRect.topLeading)
        assertEqual(polar.anchorLocation(for: .top), polarRect.top)
        assertEqual(polar.anchorLocation(for: .topTrailing), polarRect.topTrailing)
        assertEqual(polar.anchorLocation(for: .trailing), polarRect.trailing)
        assertEqual(polar.anchorLocation(for: .bottomTrailing), polarRect.bottomTrailing)
        assertEqual(polar.anchorLocation(for: .bottom), polarRect.bottom)
        assertEqual(polar.anchorLocation(for: .bottomLeading), polarRect.bottomLeading)
        assertEqual(polar.anchorLocation(for: .leading), polarRect.leading)
        assertEqual(polar.anchorLocation(for: .center), polarRect.center)
        
        assertEqual(polar.anchorLocation(for: UnitPoint(0.25, 0.5)), CGPoint(polarRect.relativeX(0.25), polarRect.relativeY(0.5)))
        assertEqual(polar.anchorLocation(for: UnitPoint(0.75, 0.75)), CGPoint(polarRect.relativeX(0.75), polarRect.relativeY(0.75)))
    }
}
