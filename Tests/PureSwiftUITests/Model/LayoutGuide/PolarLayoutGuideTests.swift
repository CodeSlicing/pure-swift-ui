//
//  PolarLayoutGuideTests.swift
//
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class PolarLayoutGuideTests: XCTestCase {

    let x: CGFloat = 2
    let y: CGFloat = 4
    let width: CGFloat = 12
    let height: CGFloat = 10

    var rect: CGRect {
        CGRect(x, y, width, height)
    }
    
    var bottomRightRect: CGRect {
        CGRect(rect.center, rect.sizeScaled(0.5))
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS

extension PolarLayoutGuideTests {

    func testPointsForEquidistant() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: 8)
        assertEqual(grid[0, 0], (rect.center))
        assertEqual(grid[5, 2], rect.trailing.xOffset(-1))
        assertEqual(grid[5, 4], rect.bottom)
        assertEqual(grid[5, 6], rect.leading.xOffset(1))
        assertEqual(grid[5, 8], rect.top)
        assertEqual(grid[3, 2], (rect.center.x + 3, rect.center.y))
    }

    func testPointsForEquidistantReframed() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: 8)
        grid = grid.reframed(bottomRightRect, origin: .center)
        assertEqual(grid[0, 0], (bottomRightRect.center))
        assertEqual(grid[5, 2], bottomRightRect.trailing.xOffset(-0.5))
        assertEqual(grid[5, 4], bottomRightRect.bottom)
        assertEqual(grid[5, 6], bottomRightRect.leading.xOffset(0.5))
        assertEqual(grid[5, 8], bottomRightRect.top)
        assertEqual(grid[3, 2], (bottomRightRect.center.x + 1.5, bottomRightRect.center.y))
    }
    
    func testPointsForEquidistantWithOrigin() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: 8)
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(grid[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[5, 2, origin: bottomRightRect.center], offsetRect.trailing.xOffset(-1))
        assertEqual(grid[5, 4, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(grid[5, 6, origin: bottomRightRect.center], offsetRect.leading.xOffset(1))
        assertEqual(grid[5, 8, origin: bottomRightRect.center], offsetRect.top)
        assertEqual(grid[3, 2, origin: bottomRightRect.center], (offsetRect.center.x + 3, offsetRect.center.y))
    }
    
    func testOutOfBoundsForEquidistant() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: 8)
        assertEqual(grid[5, -8], rect.top)
        assertEqual(grid[10, -8], rect.top.yOffset(-5))
    }
}

// MARK: ----- RELATIVE POINT TESTS

extension PolarLayoutGuideTests {

    func testPointsForRelative() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        assertEqual(grid[0, 0], (rect.center))
        assertEqual(grid[2, 1], rect.trailing.xOffset(-1))
        assertEqual(grid[2, 2], rect.bottom)
        assertEqual(grid[0, 2], rect.center)
    }

    func testPointsForRelativeReframed() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        grid = grid.reframed(bottomRightRect, origin: .center)
        assertEqual(grid[0, 0], (bottomRightRect.center))
        assertEqual(grid[2, 1], bottomRightRect.trailing.xOffset(-0.5))
        assertEqual(grid[2, 2], bottomRightRect.bottom)
        assertEqual(grid[0, 2], bottomRightRect.center)
    }
    
    func testPointsForRelativeWithOrigin() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(grid[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[2, 1, origin: bottomRightRect.center], offsetRect.trailing.xOffset(-1))
        assertEqual(grid[2, 2, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(grid[0, 2, origin: bottomRightRect.center], offsetRect.center)
    }
    
    func testOutOfBoundsForRelative() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: [0, 0.25, 0.5])
        assertEqual(grid[5, -8], rect.top)
        assertEqual(grid[10, 8], rect.bottom)
    }
    
    func testPointsForRelativeIsEquivalentToAbsolute() {
        let rings = [0, 0.5, 1]
        var gridRelative = LayoutGuide.polar(rect, rings: rings, segments: [0, 0.25, 0.5])
        var gridAbsolute = LayoutGuide.polar(rect, rings: rings, segments: [.cycle(0), .cycle(0.25), .cycle(0.5)])
        var gridAbsoluteDegrees = LayoutGuide.polar(rect, rings: rings, segments: [0.degrees, 90.degrees, 180.degrees])
        for ring in 0..<rings.count {
            for segment in 0..<3 {
                assertEqual(gridRelative[ring, segment], gridAbsolute[ring, segment])
                assertEqual(gridAbsolute[ring, segment], gridAbsoluteDegrees[ring, segment])
            }
        }
    }
}

// MARK: ----- EQUIDISTANT RING RELATIVE SEGMENT POINT TESTS

extension PolarLayoutGuideTests {

    func testPointsForEquidistantRingRelativeSegment() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: [0, 0.25, 0.5])
        assertEqual(grid[0, 0], rect.center)
        assertEqual(grid[5, 1], rect.trailing.xOffset(-1))
        assertEqual(grid[5, 2], rect.bottom)
        assertEqual(grid[0, 2], rect.center)
        assertEqual(grid[3, 2], rect.center.yOffset(3))
    }

    func testPointsForEquidistantRingRelativeSegmentReframed() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: [0, 0.25, 0.5])
        grid = grid.reframed(bottomRightRect, origin: .center)
        assertEqual(grid[0, 0], bottomRightRect.center)
        assertEqual(grid[5, 1], bottomRightRect.trailing.xOffset(-0.5))
        assertEqual(grid[5, 2], bottomRightRect.bottom)
        assertEqual(grid[0, 2], bottomRightRect.center)
        assertEqual(grid[3, 2], bottomRightRect.center.yOffset(1.5))
    }
    
    func testPointsForEquidistantRingRelativeSegmentWithOrigin() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: [0, 0.25, 0.5])
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(grid[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[5, 1, origin: bottomRightRect.center], offsetRect.trailing.xOffset(-1))
        assertEqual(grid[5, 2, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(grid[0, 2, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[3, 2, origin: bottomRightRect.center], offsetRect.center.yOffset(3))
    }
    
    func testOutOfBoundsForEquidistantRingRelativeSegment() {
        var grid = LayoutGuide.polar(rect, rings: 5, segments: [0, 0.25, 0.5])
        assertEqual(grid[5, -8], rect.top)
        assertEqual(grid[10, 8], rect.bottom.yOffset(5))
    }
    
    func testPointsForEquidistantRingRelativeIsEquivalentToAbsolute() {
        let rings = 5
        var gridRelative = LayoutGuide.polar(rect, rings: rings, segments: [0, 0.25, 0.5])
        var gridAbsolute = LayoutGuide.polar(rect, rings: rings, segments: [.cycle(0), .cycle(0.25), .cycle(0.5)])
        var gridAbsoluteDegrees = LayoutGuide.polar(rect, rings: rings, segments: [0.degrees, 90.degrees, 180.degrees])
        for ring in 0..<rings {
            for segment in 0..<3 {
                assertEqual(gridRelative[ring, segment], gridAbsolute[ring, segment])
                assertEqual(gridAbsolute[ring, segment], gridAbsoluteDegrees[ring, segment])
            }
        }
    }
}


// MARK: -----  RELATIVE RING EQUIDISTANT SEGMENT POINT TESTS

extension PolarLayoutGuideTests {

    func testPointsForRelativeRingEquidistantSegment() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        assertEqual(grid[0, 0], (rect.center))
        assertEqual(grid[2, 2], rect.trailing.xOffset(-1))
        assertEqual(grid[2, 4], rect.bottom)
        assertEqual(grid[0, 4], rect.center)
    }

    func testPointsForRelativeRingEquidistantSegmentReframed() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        grid = grid.reframed(bottomRightRect, origin: .center)
        assertEqual(grid[0, 0], bottomRightRect.center)
        assertEqual(grid[2, 2], bottomRightRect.trailing.xOffset(-0.5))
        assertEqual(grid[2, 4], bottomRightRect.bottom)
        assertEqual(grid[0, 4], bottomRightRect.center)
    }
    
    func testPointsForRelativeRingEquidistantSegmentWithOrigin() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        let offsetRect = CGRect(bottomRightRect.center, rect.size, anchor: .center)
        assertEqual(grid[0, 0, origin: bottomRightRect.center], offsetRect.center)
        assertEqual(grid[2, 2, origin: bottomRightRect.center], offsetRect.trailing.xOffset(-1))
        assertEqual(grid[2, 4, origin: bottomRightRect.center], offsetRect.bottom)
        assertEqual(grid[0, 4, origin: bottomRightRect.center], offsetRect.center)
    }
    
    func testOutOfBoundsForRelativeRingEquidistantSegment() {
        var grid = LayoutGuide.polar(rect, rings: [0, 0.5, 1], segments: 8)
        assertEqual(grid[5, -8], rect.top)
        assertEqual(grid[10, 8], rect.top)
    }
}
