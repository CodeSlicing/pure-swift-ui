//
//  GridLayoutGuideTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class GridLayoutGuideTests: BaseLayoutGuideTests {
    
}

// MARK: ----- PROPERTIES {

extension GridLayoutGuideTests {
    
    func testForInvalidColumnNumber() {
        let grid = LayoutGuide.grid(rect, columns: 0, rows: 2)
        XCTAssertEqual(grid.xCount, 1)
    }
    
    func testForInvalidRowNumber() {
        let grid = LayoutGuide.grid(rect, columns: 2, rows: 0)
        XCTAssertEqual(grid.yCount, 1)
    }
    
    func testProperties() {
        
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        XCTAssertEqual(grid.xCount, 10)
        XCTAssertEqual(grid.yCount, 6)
        XCTAssertEqual(grid.origin, rect.topLeading)
        
        grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        XCTAssertEqual(grid.xCount, 3)
        XCTAssertEqual(grid.yCount, 6)
        XCTAssertEqual(grid.origin, rect.topLeading)
        
        grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        XCTAssertEqual(grid.xCount, 3)
        XCTAssertEqual(grid.yCount, 3)
        XCTAssertEqual(grid.origin, rect.topLeading)
        
        grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        XCTAssertEqual(grid.xCount, 10)
        XCTAssertEqual(grid.yCount, 3)
        XCTAssertEqual(grid.origin, rect.topLeading)
    }
}

// MARK: ----- ANGLE FOR POINT

extension GridLayoutGuideTests {
    
    func testAngleForPoint() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        
        XCTAssertEqual(grid.angleTo(10, 0), 90.degrees)
        XCTAssertEqual(grid.angleTo(0, 10), 180.degrees)
        
        XCTAssertEqual(grid.angleTo(0, 3, from: rect.center), 270.degrees)
        XCTAssertEqual(grid.angleTo(5, 0, from: rect.center), 0.degrees)
        XCTAssertEqual(grid.angleTo(10, 3, from: rect.center), 90.degrees)
        XCTAssertEqual(grid.angleTo(5, 6, from: rect.center), 180.degrees)
    }
}

// MARK: ----- RADIUS FOR POINT

extension GridLayoutGuideTests {
    
    func testRadiusForPoint() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        
        XCTAssertEqual(grid.radiusTo(10, 0), rect.width)
        XCTAssertEqual(grid.radiusTo(0, 6), rect.height)
        XCTAssertEqual(grid.radiusTo(0, 3), rect.halfHeight)
        XCTAssertEqual(grid.radiusTo(5, 0), rect.halfWidth)
        
        XCTAssertEqual(grid.radiusTo(0, 3, from: rect.center), rect.halfWidth)
        XCTAssertEqual(grid.radiusTo(5, 0, from: rect.center), rect.halfHeight)
        XCTAssertEqual(grid.radiusTo(10, 3, from: rect.center), rect.halfWidth)
        XCTAssertEqual(grid.radiusTo(5, 6, from: rect.center), rect.halfHeight)
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS

extension GridLayoutGuideTests {
    
    func testPointsForEquidistant() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[10, 6], rect.extent)
        assertEqual(grid[10, 0], rect.topTrailing)
        assertEqual(grid[0, 6], rect.bottomLeading)
        assertEqual(grid[5, 3], rect.center)
        assertEqual(grid[10, 3], rect.trailing)
        assertEqual(grid[5, 6], rect.bottom)
        assertEqual(grid[0, 3], rect.leading)
        assertEqual(grid[5, 0], rect.top)
    }
    
    func testPointsForEquidistantReframed() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRightRect.origin)
        assertEqual(grid[10, 6], bottomRightRect.extent)
        assertEqual(grid[10, 0], bottomRightRect.topTrailing)
        assertEqual(grid[0, 6], bottomRightRect.bottomLeading)
        assertEqual(grid[5, 3], bottomRightRect.center)
        assertEqual(grid[10, 3], bottomRightRect.trailing)
        assertEqual(grid[5, 6], bottomRightRect.bottom)
        assertEqual(grid[0, 3], bottomRightRect.leading)
        assertEqual(grid[5, 0], bottomRightRect.top)
    }
    
    func testPointsForEquidistantWithOrigin() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[10, 6, origin: rect.center], offsetRect.extent)
        assertEqual(grid[10, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 6, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[5, 3, origin: rect.center], offsetRect.center)
        assertEqual(grid[10, 3, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[5, 6, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 3, origin: rect.center], offsetRect.leading)
        assertEqual(grid[5, 0, origin: rect.center], offsetRect.top)
    }
    
    func testOutOfBoundsForEquidistant() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[-10, -6], (x - width, y - height))
        assertEqual(grid[20, 12], CGRect(CGPoint(x, y), rect.sizeScaled(2)).extent)
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS WITH RELATIVE COORDINATES

extension GridLayoutGuideTests {
    
    func testPointsForEquidistantForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[rel: 0, 0], (x, y))
        assertEqual(grid[rel: 1, 6], rect.extent)
        assertEqual(grid[10, rel: 0], rect.topTrailing)
        assertEqual(grid[0, rel: 1], rect.bottomLeading)
        assertEqual(grid[rel: 0.5, 3], rect.center)
        assertEqual(grid[rel: 1, 3], rect.trailing)
        assertEqual(grid[5, rel: 1], rect.bottom)
        assertEqual(grid[rel: 0, rel: 0.5], rect.leading)
        assertEqual(grid[rel: 0.5, rel: 0], rect.top)
    }

    func testPointsForEquidistantReframedForRelativeCoordinates() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[rel: 0, 0],        bottomRightRect.origin)
        assertEqual(grid[rel: 1, 6],        bottomRightRect.extent)
        assertEqual(grid[10, rel: 0],     bottomRightRect.topTrailing)
        assertEqual(grid[0, rel: 1],        bottomRightRect.bottomLeading)
        assertEqual(grid[5, rel: 0.5],    bottomRightRect.center)
        assertEqual(grid[rel: 1, 3],        bottomRightRect.trailing)
        assertEqual(grid[5, rel: 1],      bottomRightRect.bottom)
        assertEqual(grid[rel: 0, rel: 0.5], bottomRightRect.leading)
        assertEqual(grid[rel: 0.5, rel: 0], bottomRightRect.top)
    }

    func testPointsForEquidistantWithOriginForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[rel: 0, 0,        origin: rect.center], offsetRect.origin)
        assertEqual(grid[rel: 1, 6,        origin: rect.center], offsetRect.extent)
        assertEqual(grid[10, rel: 0,       origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, rel: 1,        origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[rel: 0.5, 3,      origin: rect.center], offsetRect.center)
        assertEqual(grid[rel: 1, 3,        origin: rect.center], offsetRect.trailing)
        assertEqual(grid[rel: 0.5, rel: 1, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[rel: 0, 3,      origin: rect.center], offsetRect.leading)
        assertEqual(grid[rel: 0.5, rel: 0, origin: rect.center], offsetRect.top)
    }

    func testOutOfBoundsForEquidistantForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[rel: -1, rel: -1], (x - width, y - height))
        assertEqual(grid[rel: 2, rel: 2], CGRect(CGPoint(x, y), rect.sizeScaled(2)).extent)
    }
}

// MARK: -----  RELATIVE POINT TESTS

extension GridLayoutGuideTests {
    
    func testPointsForRelative() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[2, 2], rect.extent)
        assertEqual(grid[2, 0], rect.topTrailing)
        assertEqual(grid[0, 2], rect.bottomLeading)
        assertEqual(grid[1, 1], rect.center)
        assertEqual(grid[2, 1], rect.trailing)
        assertEqual(grid[1, 2], rect.bottom)
        assertEqual(grid[0, 1], rect.leading)
        assertEqual(grid[1, 0], rect.top)
    }
    
    func testPointsForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRightRect.origin)
        assertEqual(grid[2, 2], bottomRightRect.extent)
        assertEqual(grid[2, 0], bottomRightRect.topTrailing)
        assertEqual(grid[0, 2], bottomRightRect.bottomLeading)
        assertEqual(grid[1, 1], bottomRightRect.center)
        assertEqual(grid[2, 1], bottomRightRect.trailing)
        assertEqual(grid[1, 2], bottomRightRect.bottom)
        assertEqual(grid[0, 1], bottomRightRect.leading)
        assertEqual(grid[1, 0], bottomRightRect.top)
    }
    
    func testPointsForRelativeWithOrigin() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], rect.center)
        assertEqual(grid[2, 2, origin: rect.center], offsetRect.extent)
        assertEqual(grid[2, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 2, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[1, 1, origin: rect.center], offsetRect.center)
        assertEqual(grid[2, 1, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[1, 2, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 1, origin: rect.center], offsetRect.leading)
        assertEqual(grid[1, 0, origin: rect.center], offsetRect.top)
    }
    
    func testOutOfBoundsForRelative() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[-10, -6], rect.origin)
        assertEqual(grid[6, 6], rect.extent)
    }
}

// MARK: -----  RELATIVE POINT TESTS WITH RELATIVE COORDINATES

extension GridLayoutGuideTests {
    
    func testPointsForRelativeForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[rel: 0, 0], (x, y))
        assertEqual(grid[2, rel: 1], rect.extent)
        assertEqual(grid[2, rel: 0], rect.topTrailing)
        assertEqual(grid[rel: 0, rel: 1], rect.bottomLeading)
        assertEqual(grid[1, rel: 0.5], rect.center)
        assertEqual(grid[rel: 1, rel: 0.5], rect.trailing)
        assertEqual(grid[rel: 0.5, 2], rect.bottom)
        assertEqual(grid[rel: 0, rel: 0.5], rect.leading)
        assertEqual(grid[1, rel: 0], rect.top)
    }
    
    func testPointsForRelativeReframedForRelativeCoordinates() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[rel: 0, 0], bottomRightRect.origin)
        assertEqual(grid[2, rel: 1], bottomRightRect.extent)
        assertEqual(grid[rel: 1, rel: 0], bottomRightRect.topTrailing)
        assertEqual(grid[rel: 0, rel: 1], bottomRightRect.bottomLeading)
        assertEqual(grid[1, rel: 0.5], bottomRightRect.center)
        assertEqual(grid[rel: 1, rel: 0.5], bottomRightRect.trailing)
        assertEqual(grid[rel: 0.5, 2], bottomRightRect.bottom)
        assertEqual(grid[rel: 0, rel: 0.5], bottomRightRect.leading)
        assertEqual(grid[1, rel: 0], bottomRightRect.top)
    }

    func testPointsForRelativeWithOriginForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[rel: 0, 0, origin: rect.center], rect.center)
        assertEqual(grid[2, rel: 1, origin: rect.center], offsetRect.extent)
        assertEqual(grid[rel: 1, rel: 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[rel: 0, rel: 1, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[1, rel: 0.5, origin: rect.center], offsetRect.center)
        assertEqual(grid[rel: 1, rel: 0.5, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[rel: 0.5, 2, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[rel: 0, rel: 0.5, origin: rect.center], offsetRect.leading)
        assertEqual(grid[1, rel: 0, origin: rect.center], offsetRect.top)
    }

    func testOutOfBoundsForRelativeForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[rel: -1, rel: -1], (x - width, y - height))
    }
}

// MARK: ----- EQUIDISTANT X  RELATIVE Y POINT TESTS

extension GridLayoutGuideTests {
    
    func testPointsForEquidistantXRelativeY() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[10, 2], rect.extent)
        assertEqual(grid[10, 0], rect.topTrailing)
        assertEqual(grid[0, 2], rect.bottomLeading)
        assertEqual(grid[5, 1], rect.center)
        assertEqual(grid[10, 1], rect.trailing)
        assertEqual(grid[5, 2], rect.bottom)
        assertEqual(grid[0, 1], rect.leading)
        assertEqual(grid[5, 0], rect.top)
    }
    
    func testPointsForEquidistantXRelativeYReframed() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .center)
        let offset = bottomRightRect.sizeScaled(0.5)
        assertEqual(grid[0, 0], bottomRightRect.center)
        assertEqual(grid[10, 2], bottomRightRect.bottomTrailing.offset(offset))
        assertEqual(grid[10, 0], bottomRightRect.topTrailing.offset(offset))
        assertEqual(grid[0, 2], bottomRightRect.bottomLeading.offset(offset))
        assertEqual(grid[5, 1], bottomRightRect.center.offset(offset))
        assertEqual(grid[10, 1], bottomRightRect.trailing.offset(offset))
        assertEqual(grid[5, 2], bottomRightRect.bottom.offset(offset))
        assertEqual(grid[0, 1], bottomRightRect.leading.offset(offset))
        assertEqual(grid[5, 0], bottomRightRect.top.offset(offset))
    }
    
    func testPointsForEquidistantXRelativeYWithOrigin() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[10, 2, origin: rect.center], offsetRect.extent)
        assertEqual(grid[10, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 2, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[5, 1, origin: rect.center], offsetRect.center)
        assertEqual(grid[10, 1, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[5, 2, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 1, origin: rect.center], offsetRect.leading)
        assertEqual(grid[5, 0, origin: rect.center], offsetRect.top)
    }
    
    func testOutOfBoundsForEquidistantXRelativeY() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[-10, -6], (x - width, rect.origin.y))
        assertEqual(grid[20, 12], (x + width * 2, rect.extent.y))
    }
}

// MARK: ----- EQUIDISTANT X  RELATIVE Y POINT TESTS WITH RELATIVE COORDINATES

extension GridLayoutGuideTests {
    
    func testPointsForEquidistantXRelativeYForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[rel: 0, 0], (x, y))
        assertEqual(grid[rel: 1, rel: 1], rect.extent)
        assertEqual(grid[rel: 1, rel: 0], rect.topTrailing)
        assertEqual(grid[0, rel: 1], rect.bottomLeading)
        assertEqual(grid[rel: 0.5, 1], rect.center)
        assertEqual(grid[10, rel: 0.5], rect.trailing)
        assertEqual(grid[rel: 0.5, rel: 1], rect.bottom)
        assertEqual(grid[rel: 0, rel: 0.5], rect.leading)
        assertEqual(grid[5, rel: 0], rect.top)
    }
    
    func testPointsForEquidistantXRelativeYReframedForRelativeCoordinates() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .center)
        let offset = bottomRightRect.sizeScaled(0.5)
        assertEqual(grid[rel: 0, 0], bottomRightRect.center)
        assertEqual(grid[rel: 1, 2], bottomRightRect.bottomTrailing.offset(offset))
        assertEqual(grid[rel: 1, 0], bottomRightRect.topTrailing.offset(offset))
        assertEqual(grid[rel: 0, 2], bottomRightRect.bottomLeading.offset(offset))
        assertEqual(grid[5, rel: 0.5], bottomRightRect.center.offset(offset))
        assertEqual(grid[10, rel: 0.5], bottomRightRect.trailing.offset(offset))
        assertEqual(grid[5, rel: 1], bottomRightRect.bottom.offset(offset))
        assertEqual(grid[0, rel: 0.5], bottomRightRect.leading.offset(offset))
        assertEqual(grid[5, rel: 0], bottomRightRect.top.offset(offset))
    }

    func testPointsForEquidistantXRelativeYWithOriginForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[rel: 0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[rel: 1, 2, origin: rect.center], offsetRect.extent)
        assertEqual(grid[rel: 1, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[rel: 0, 2, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[5, rel: 0.5, origin: rect.center], offsetRect.center)
        assertEqual(grid[rel: 1, rel: 0.5, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[5, rel: 1, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, rel: 0.5, origin: rect.center], offsetRect.leading)
        assertEqual(grid[rel: 0.5, rel: 0, origin: rect.center], offsetRect.top)
    }

    func testOutOfBoundsForEquidistantXRelativeYForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[rel: -1, rel: -1], (x - width, y - height))
    }
}

// MARK: -----  RELATIVE X EQUIDISTANT Y POINT TESTS

extension GridLayoutGuideTests {
    
    func testPointsForRelativeXEquidistantY() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[2, 6], rect.extent)
        assertEqual(grid[2, 0], rect.topTrailing)
        assertEqual(grid[0, 6], rect.bottomLeading)
        assertEqual(grid[1, 3], rect.center)
        assertEqual(grid[2, 3], rect.trailing)
        assertEqual(grid[1, 6], rect.bottom)
        assertEqual(grid[0, 3], rect.leading)
        assertEqual(grid[1, 0], rect.top)
    }
    
    func testPointsForRelativeXEquidistantYReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[0, 0], rect.center)
        assertEqual(grid[2, 6], bottomRightRect.extent)
        assertEqual(grid[2, 0], bottomRightRect.topTrailing)
        assertEqual(grid[0, 6], bottomRightRect.bottomLeading)
        assertEqual(grid[1, 3], bottomRightRect.center)
        assertEqual(grid[2, 3], bottomRightRect.trailing)
        assertEqual(grid[1, 6], bottomRightRect.bottom)
        assertEqual(grid[0, 3], bottomRightRect.leading)
        assertEqual(grid[1, 0], bottomRightRect.top)
    }
    
    func testPointsForRelativeXEquidistantYWithOrigin() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[2, 6, origin: rect.center], offsetRect.extent)
        assertEqual(grid[2, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 6, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[1, 3, origin: rect.center], offsetRect.center)
        assertEqual(grid[2, 3, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[1, 6, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 3, origin: rect.center], offsetRect.leading)
        assertEqual(grid[1, 0, origin: rect.center], offsetRect.top)
    }
    
    func testOutOfBoundsForRelativeXEquidistantY() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[-10, -6], (x, y - height))
        assertEqual(grid[20, 12], (rect.extent.x, y + height * 2))
    }
}

// MARK: -----  RELATIVE X EQUIDISTANT Y POINT TESTS WITH RELATIVE COORDINATES

extension GridLayoutGuideTests {
    
    func testPointsForRelativeXEquidistantYForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[rel: 0, 0], (x, y))
        assertEqual(grid[rel: 1, 6], rect.extent)
        assertEqual(grid[rel: 1, 0], rect.topTrailing)
        assertEqual(grid[rel: 0, 6], rect.bottomLeading)
        assertEqual(grid[1, rel: 0.5], rect.center)
        assertEqual(grid[2, rel: 0.5], rect.trailing)
        assertEqual(grid[1, rel: 1], rect.bottom)
        assertEqual(grid[0, rel: 0.5], rect.leading)
        assertEqual(grid[1, rel: 0], rect.top)
    }
    
    func testPointsForRelativeXEquidistantYReframedForRelativeCoordinates() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[rel: 0, 0], rect.center)
        assertEqual(grid[rel: 1, 6], bottomRightRect.extent)
        assertEqual(grid[rel: 1, 0], bottomRightRect.topTrailing)
        assertEqual(grid[rel: 0, 6], bottomRightRect.bottomLeading)
        assertEqual(grid[1, rel: 0.5], bottomRightRect.center)
        assertEqual(grid[2, rel: 0.5], bottomRightRect.trailing)
        assertEqual(grid[1, rel: 1], bottomRightRect.bottom)
        assertEqual(grid[0, rel: 0.5], bottomRightRect.leading)
        assertEqual(grid[1, rel: 0], bottomRightRect.top)
    }

    func testPointsForRelativeXEquidistantYWithOriginForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[rel: 0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[rel: 1, 6, origin: rect.center], offsetRect.extent)
        assertEqual(grid[rel: 1, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[rel: 0, 6, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[rel: 0.5, rel: 0.5, origin: rect.center], offsetRect.center)
        assertEqual(grid[2, rel: 0.5, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[1, rel: 1, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, rel: 0.5, origin: rect.center], offsetRect.leading)
        assertEqual(grid[1, rel: 0, origin: rect.center], offsetRect.top)
    }

    func testOutOfBoundsForRelativeXEquidistantYForRelativeCoordinates() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[rel: -1, rel: -1], (x - width, y - height))
    }
}

// MARK: ----- OFFSET GRID

extension GridLayoutGuideTests {
    
    func testPointsWithOffset() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(5, 10)
        
        var offsetGrid = grid.offset(offset, factor: 0)
        assertEqual(offsetGrid[0, 0], CGPoint(x, y))
        assertEqual(offsetGrid[2, 2], rect.extent)
        assertEqual(offsetGrid[2, 0], rect.topTrailing)
        
        offsetGrid = grid.offset(offset, factor: 0.5)
        assertEqual(offsetGrid[0, 2], rect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[1, 1], rect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[2, 1], rect.trailing + offset.asCGPoint.scaled(0.5))
        
        offsetGrid = grid.offset(10, factor: 0.5)
        assertEqual(offsetGrid[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(offsetGrid[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(offsetGrid[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        offsetGrid = grid.offset(offset)
        assertEqual(offsetGrid[1, 2], rect.bottom + offset.asCGPoint)
        assertEqual(offsetGrid[0, 1], rect.leading + offset.asCGPoint)
        assertEqual(offsetGrid[1, 0], rect.top + offset.asCGPoint)
    }
    
    func testPointsWithOffsetForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        let offset = CGPoint(5, 10)
        
        var offsetGrid = grid.offset(offset, factor: 0)
        assertEqual(offsetGrid[0, 0], bottomRightRect.origin)
        assertEqual(offsetGrid[2, 2], bottomRightRect.extent)
        assertEqual(offsetGrid[2, 0], bottomRightRect.topTrailing)
        
        offsetGrid = grid.offset(offset, factor: 0.5)
        assertEqual(offsetGrid[0, 2], bottomRightRect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[1, 1], bottomRightRect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[2, 1], bottomRightRect.trailing + offset.asCGPoint.scaled(0.5))
        
        offsetGrid = grid.offset(offset)
        assertEqual(offsetGrid[1, 2], bottomRightRect.bottom + offset.asCGPoint)
        assertEqual(offsetGrid[0, 1], bottomRightRect.leading + offset.asCGPoint)
        assertEqual(offsetGrid[1, 0], bottomRightRect.top + offset.asCGPoint)
    }
    
    func testPointsWithOffsetForRelativeWithOrigin() {
        let baseGrid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        let offset = CGPoint(5, 10)
        
        var offsetGrid = baseGrid.offset(offset, factor: 0)
        assertEqual(offsetGrid[0, 0, origin: rect.center], rect.center)
        assertEqual(offsetGrid[2, 2, origin: rect.center], offsetRect.extent)
        assertEqual(offsetGrid[2, 0, origin: rect.center], offsetRect.topTrailing)
        
        offsetGrid = baseGrid.offset(offset, factor: 0.5)
        assertEqual(offsetGrid[0, 2, origin: rect.center], offsetRect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[1, 1, origin: rect.center], offsetRect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[2, 1, origin: rect.center], offsetRect.trailing + offset.asCGPoint.scaled(0.5))
        
        offsetGrid = baseGrid.offset(offset)
        assertEqual(offsetGrid[1, 2, origin: rect.center], offsetRect.bottom + offset.asCGPoint)
        assertEqual(offsetGrid[0, 1, origin: rect.center], offsetRect.leading + offset.asCGPoint)
        assertEqual(offsetGrid[1, 0, origin: rect.center], offsetRect.top + offset.asCGPoint)
    }
    
    func testPointsWithOffsetWithConfig() {
        let offset = CGPoint(5, 10)
        let baseConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        var grid = baseConfig
            .offset(offset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(grid[1, 1], rect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + offset.asCGPoint.scaled(0.5))
        
        grid = baseConfig
            .offset(10, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(grid[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        grid = baseConfig
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(grid[1, 2], rect.bottom + offset.asCGPoint)
        assertEqual(grid[0, 1], rect.leading + offset.asCGPoint)
        assertEqual(grid[1, 0], rect.top + offset.asCGPoint)
    }
}

// MARK: ----- OFFSET GRID FROM TO

extension GridLayoutGuideTests {
    
    func testPointsWithOffsetFromTo() {
        let baseGrid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetFrom = CGPoint(0, 0)
        let offsetTo = CGPoint(5, 10)
        
        var gridOffset = baseGrid.offset(from: offsetFrom, to: offsetTo, factor: 0)
        assertEqual(gridOffset[0, 0], CGPoint(x, y))
        assertEqual(gridOffset[2, 2], rect.extent)
        assertEqual(gridOffset[2, 0], rect.topTrailing)
        
        gridOffset = baseGrid.offset(from: offsetFrom, to: offsetTo, factor: 0.5)
        assertEqual(gridOffset[0, 2], rect.bottomLeading + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(gridOffset[1, 1], rect.center + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(gridOffset[2, 1], rect.trailing + offsetTo.asCGPoint.scaled(0.5))
        
        gridOffset = baseGrid.offset(from: .size(0), to: .size(10), factor: 0.5)
        assertEqual(gridOffset[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(gridOffset[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(gridOffset[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        gridOffset = baseGrid.offset(from: offsetFrom, to: offsetTo, factor: 1)
        assertEqual(gridOffset[1, 2], rect.bottom + offsetTo.asCGPoint)
        assertEqual(gridOffset[0, 1], rect.leading + offsetTo.asCGPoint)
        assertEqual(gridOffset[1, 0], rect.top + offsetTo.asCGPoint)
    }
    
    func testPointsWithOffsetFromToWithConfig() {
        let baseConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetFrom = CGPoint(0, 0)
        let offsetTo = CGPoint(5, 10)
        
        var grid = baseConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 0)
            .layout(in: rect)
        
        assertEqual(grid[0, 0], CGPoint(x, y))
        assertEqual(grid[2, 2], rect.extent)
        assertEqual(grid[2, 0], rect.topTrailing)
        
        grid = baseConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(grid[1, 1], rect.center + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + offsetTo.asCGPoint.scaled(0.5))
        
        grid = baseConfig
            .offset(from: .point(0), to: .point(10), factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(grid[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        grid = baseConfig.offset(from: offsetFrom, to: offsetTo, factor: 1)
            .layout(in: rect)
        
        assertEqual(grid[1, 2], rect.bottom + offsetTo.asCGPoint)
        assertEqual(grid[0, 1], rect.leading + offsetTo.asCGPoint)
        assertEqual(grid[1, 0], rect.top + offsetTo.asCGPoint)
    }
}

// MARK: ----- OFFSET IN X AND Y FROM TO

extension GridLayoutGuideTests {
    
    func testPointsWithXOffsetFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let xOffset: CGFloat = 10
        
        var polarOffset = grid.xOffset(from: 0, to: xOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = grid.xOffset(from: 0, to: xOffset, factor: 0.5)
        assertEqual(polarOffset[1, 1], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = grid.xOffset(from: 0, to: xOffset, factor: 1)
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.xOffset(xOffset))
    }
    
    func testPointsWithXOffsetFromToWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let xOffset: CGFloat = 10
        
        var polarOffset = gridConfig
            .xOffset(from: 0, to: xOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = gridConfig
            .xOffset(from: 0, to: xOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[1, 1], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = gridConfig
            .xOffset(from: 0, to: xOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.xOffset(xOffset))
    }
    
    func testPointsWithYOffsetFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let yOffset: CGFloat = 10
        
        var polarOffset = grid.yOffset(from: 0, to: yOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = grid.yOffset(from: 0, to: yOffset, factor: 0.5)
        assertEqual(polarOffset[1, 1], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = grid.yOffset(from: 0, to: yOffset, factor: 1)
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.yOffset(yOffset))
    }
    
    func testPointsWithYOffsetFromToWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let yOffset: CGFloat = 10
        
        var polarOffset = gridConfig
            .yOffset(from: 0, to: yOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = gridConfig
            .yOffset(from: 0, to: yOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[1, 1], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = gridConfig
            .yOffset(from: 0, to: yOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.yOffset(yOffset))
    }
}

// MARK: ----- ROTATE GRID

extension GridLayoutGuideTests {
    
    func testPointsWithRotation() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = grid.rotated(180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = grid.rotated(180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = grid.rotated(180.degrees)
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
    
    func testPointsWithRotationWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = gridConfig
            .rotated(180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = gridConfig
            .rotated(180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = gridConfig
            .rotated(180.degrees)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
    
    func testPointsWithRotationForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        
        var gridRotated = grid.rotated(180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0], bottomRightRect.origin)
        assertEqual(gridRotated[2, 2], bottomRightRect.extent)
        assertEqual(gridRotated[2, 0], bottomRightRect.topTrailing)
        
        gridRotated = grid.rotated(180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 0], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(gridRotated[0, 1], bottomRightRect.center.yOffset(-bottomRightRect.halfWidth))
        assertEqual(gridRotated[1, 1], bottomRightRect.center)
        
        gridRotated = grid.rotated(180.degrees)
        assertEqual(gridRotated[1, 0], bottomRightRect.bottom)
        assertEqual(gridRotated[0, 1], bottomRightRect.center.xOffset(bottomRightRect.halfWidth))
        assertEqual(gridRotated[1, 1], bottomRightRect.center)
    }
    
    func testPointsWithRotationForRelativeWithOrigin() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint.zero.moveOrigin(in: rect.size, origin: .center)
        
        var gridRotated = grid.rotated(180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0, origin: rect.center], rect.center)
        assertEqual(gridRotated[1, 0, origin: rect.center], rect.trailing)
        assertEqual(gridRotated[1, 1, origin: rect.center], rect.bottomTrailing)
        
        gridRotated = grid.rotated(180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 1, origin: rect.center], rect.center + offset)
        assertEqual(gridRotated[1, 0, origin: rect.center], rect.center.xOffset(rect.halfHeight) + offset)
        assertEqual(gridRotated[0, 1, origin: rect.center], rect.center.yOffset(-rect.halfWidth) + offset)
        
        gridRotated = grid.rotated(180.degrees)
        assertEqual(gridRotated[1, 1, origin: rect.center], rect.center + offset)
        assertEqual(gridRotated[1, 0, origin: rect.center], rect.bottom + offset)
        assertEqual(gridRotated[0, 1, origin: rect.center], rect.trailing + offset)
    }
}

// MARK: ----- ROTATE GRID FROM TO

extension GridLayoutGuideTests {
    
    func testPointsWithRotationFromTo() {
        
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = grid.rotated(from: 0.degrees, to: 180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = grid.rotated(from: 0.degrees, to: 180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = grid.rotated(from: 0.degrees, to: 180.degrees, factor: 1)
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
    
    func testPointsWithRotationFromToWithConfig() {
        
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = gridConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = gridConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = gridConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 1)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
}

// MARK: ----- SCALE GRID

extension GridLayoutGuideTests {
    
    func testPointsWithScale() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.scaled(.square(2), factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.scaled(.square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.scaled(.square(2))
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithXScale() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.xScaled(2, factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.xScaled(2, factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top)
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.xScaled(2)
        assertEqual(gridScaled[1, 0], rect.top)
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }

    func testPointsWithYScale() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.yScaled(2, factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.yScaled(2, factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading)
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.yScaled(2)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading)
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithScaleWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = gridConfig
            .scaled(.square(2), factor: 0)
            .layout(in: rect)
        
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = gridConfig
            .scaled(.square(2), factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = gridConfig
            .scaled(.square(2))
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithXScaleWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = gridConfig
            .xScaled(2, factor: 0)
            .layout(in: rect)
        
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = gridConfig
            .xScaled(2, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top)
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = gridConfig
            .xScaled(2)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top)
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithYScaleWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = gridConfig
            .yScaled(2, factor: 0)
            .layout(in: rect)
        
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = gridConfig
            .yScaled(2, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading)
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = gridConfig
            .yScaled(2)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading)
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithScaleForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        
        var gridScaled = grid.scaled(.square(2), factor: 0)
        assertEqual(gridScaled[0, 0], bottomRightRect.origin)
        assertEqual(gridScaled[2, 2], bottomRightRect.extent)
        assertEqual(gridScaled[2, 0], bottomRightRect.topTrailing)
        
        gridScaled = grid.scaled(.square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0], bottomRightRect.top.yOffset(bottomRightRect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], bottomRightRect.leading.xOffset(bottomRightRect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], bottomRightRect.center)
        
        gridScaled = grid.scaled(.square(2))
        assertEqual(gridScaled[1, 0], bottomRightRect.top.yOffset(-bottomRightRect.halfHeight))
        assertEqual(gridScaled[0, 1], bottomRightRect.leading.xOffset(-bottomRightRect.halfWidth))
        assertEqual(gridScaled[1, 1], bottomRightRect.center)
    }
    
    func testPointsWithScaleForRelativeWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .center)
        let offset = CGPoint(-rect.halfWidth, 0)
        
        var gridScaled = grid.scaled(.square(2), factor: 0)
        assertEqual(gridScaled[0, 0, origin: rect.leading], bottomRightRect.origin + offset)
        assertEqual(gridScaled[2, 2, origin: rect.leading], bottomRightRect.extent + offset)
        assertEqual(gridScaled[2, 0, origin: rect.leading], bottomRightRect.topTrailing + offset)
        
        gridScaled = grid.scaled(.square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0, origin: rect.leading], bottomRightRect.top.yOffset(bottomRightRect.heightScaled(-0.25)) + offset)
        assertEqual(gridScaled[0, 1, origin: rect.leading], bottomRightRect.leading.xOffset(bottomRightRect.widthScaled(-0.25)) + offset)
        assertEqual(gridScaled[1, 1, origin: rect.leading], bottomRightRect.center + offset)
        
        gridScaled = grid.scaled(.square(2))
        assertEqual(gridScaled[1, 0, origin: rect.leading], bottomRightRect.top.yOffset(-bottomRightRect.halfHeight) + offset)
        assertEqual(gridScaled[0, 1, origin: rect.leading], bottomRightRect.leading.xOffset(-bottomRightRect.halfWidth) + offset)
        assertEqual(gridScaled[1, 1, origin: rect.leading], bottomRightRect.center + offset)
    }
}

// MARK: ----- SCALE GRID FROM TO

extension GridLayoutGuideTests {
    
    func testPointsWithScaleFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.scaled(from: .square(1), to: .square(2), factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.scaled(from: .square(1), to: .square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.scaled(from: .square(1), to: .square(2), factor: 1)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithXScaleFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.xScaled(from: 1, to: 2, factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.xScaled(from: 1, to: 2, factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top)
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.xScaled(from: 1, to: 2, factor: 1)
        assertEqual(gridScaled[1, 0], rect.top)
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    func testPointsWithYScaleFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.yScaled(from: 1, to: 2, factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.yScaled(from: 1, to: 2, factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading)
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.yScaled(from: 1, to: 2, factor: 1)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading)
        assertEqual(gridScaled[1, 1], rect.center)
    }

    func testPointsWithScaleFromToWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = gridConfig
            .scaled(from: .square(1), to: .square(2), factor: 0)
            .layout(in: rect)
        
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = gridConfig
            .scaled(from: .square(1), to: .square(2), factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = gridConfig
            .scaled(from: .square(1), to: .square(2), factor: 1)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
}

// MARK: ----- CONSTRUCTED FROM LAYOUT CONFIG WITH SCALE AND OFFSET

extension GridLayoutGuideTests {
    
    func testPropertiesForRotatedAndOffsetGridLayoutFromConfig() {
        let offset = CGPoint(15, 20)
        
        let grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
            .rotated(180.degrees)
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(grid.topLeading, rect.bottomTrailing.offset(offset))
        assertEqual(grid[0, 0], rect.bottomTrailing.offset(offset))
        assertEqual(grid.top, rect.bottom.offset(offset))
        assertEqual(grid[1, 0], grid.top)
        assertEqual(grid.topTrailing, rect.bottomLeading.offset(offset))
        assertEqual(grid[2, 0], grid.topTrailing)
        assertEqual(grid.trailing, rect.leading.offset(offset))
        assertEqual(grid[2, 1], grid.trailing)
        assertEqual(grid.bottomTrailing, rect.topLeading.offset(offset))
        assertEqual(grid[2, 2], grid.bottomTrailing)
        assertEqual(grid.bottom, rect.top.offset(offset))
        assertEqual(grid[1, 2], grid.bottom)
        assertEqual(grid.bottomLeading, rect.topTrailing.offset(offset))
        assertEqual(grid[0, 2], grid.bottomLeading)
        assertEqual(grid.leading, rect.trailing.offset(offset))
        assertEqual(grid[0, 1], grid.leading)
        assertEqual(grid.center, rect.center.offset(offset))
        assertEqual(grid[1, 1], grid.center)
    }
}

// MARK: ----- TRANSFORMED TESTING RELATIVE COORDINATE POINTS

extension GridLayoutGuideTests {
    
    func testRelativeCoordinatesAfterTransform() {
        let offset = CGPoint(15, 20)
        
        let grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
            .rotated(180.degrees)
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(grid[rel: 0, 1], grid[0, 1])
        assertEqual(grid[1, rel: 0.5], grid[1, 1])
        assertEqual(grid[rel: 1, rel: 1], grid[2, 2])

    }
}

// MARK: ----- CONSTRUCT WITH GRID CONFIG OVERLOADS

extension GridLayoutGuideTests {

    func testLayoutGuideConfigGridOverloads() {
        
        var grid = LayoutGuideConfig.grid(columns: 2, rows: 2).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: 2).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: 2, rows: [0, 0.5, 1]).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1]).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
    }
}

// MARK: ----- CONSTRUCTED WITH ALTERNATIVE ORIGIN

extension GridLayoutGuideTests {
    
    func testLayoutGuideAlternativeOrigin() {
        
        var grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .topLeading)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .top)
        assertEqual(grid[0, 0], rect.top)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .topTrailing)
        assertEqual(grid[0, 0], rect.topTrailing)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .trailing)
        assertEqual(grid[0, 0], rect.trailing)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .bottomTrailing)
        assertEqual(grid[0, 0], rect.bottomTrailing)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .bottom)
        assertEqual(grid[0, 0], rect.bottom)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .bottomLeading)
        assertEqual(grid[0, 0], rect.bottomLeading)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .leading)
        assertEqual(grid[0, 0], rect.leading)
    }
    
    func testLayoutGuideAlternativeOriginWithConfig() {
        
        var grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .topLeading).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .top).layout(in: rect)
        assertEqual(grid[0, 0], rect.top)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .topTrailing).layout(in: rect)
        assertEqual(grid[0, 0], rect.topTrailing)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .trailing).layout(in: rect)
        assertEqual(grid[0, 0], rect.trailing)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .bottomTrailing).layout(in: rect)
        assertEqual(grid[0, 0], rect.bottomTrailing)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .bottom).layout(in: rect)
        assertEqual(grid[0, 0], rect.bottom)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .bottomLeading).layout(in: rect)
        assertEqual(grid[0, 0], rect.bottomLeading)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .leading).layout(in: rect)
        assertEqual(grid[0, 0], rect.leading)
    }
}

// MARK: ----- DIMENSION PROPERTIES

extension GridLayoutGuideTests {
    
    func testPropertiesForGridLayout() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        assertEqual(grid.topLeading, rect.topLeading)
        assertEqual(grid.top, rect.top)
        assertEqual(grid.topTrailing, rect.topTrailing)
        assertEqual(grid.trailing, rect.trailing)
        assertEqual(grid.bottomTrailing, rect.bottomTrailing)
        assertEqual(grid.bottom, rect.bottom)
        assertEqual(grid.bottomLeading, rect.bottomLeading)
        assertEqual(grid.leading, rect.leading)
        assertEqual(grid.center, rect.center)

    }
    
    func testPropertiesForScaledGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.scaled(2)
        
        assertEqual(grid.topLeading, rect.topLeading.offset(rect.sizeScaled(-0.5)))
        assertEqual(grid.top, rect.top.yOffset(-rect.halfHeight))
        assertEqual(grid.topTrailing, rect.topTrailing.offset(rect.sizeScaled(.point(0.5, -0.5))))
        assertEqual(grid.trailing, rect.trailing.xOffset(rect.halfWidth))
        assertEqual(grid.bottomTrailing, rect.bottomTrailing.offset(rect.sizeScaled(0.5)))
        assertEqual(grid.bottom, rect.bottom.yOffset(rect.halfHeight))
        assertEqual(grid.bottomLeading, rect.bottomLeading.offset(rect.sizeScaled(.point(-0.5, 0.5))))
        assertEqual(grid.leading, rect.leading.xOffset(-rect.halfWidth))
    }
    
    func testPropertiesForOffsetGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(15, 20)
        grid = grid.offset(offset)
        
        assertEqual(grid.topLeading, rect.topLeading.offset(offset))
        assertEqual(grid.top, rect.top.offset(offset))
        assertEqual(grid.topTrailing, rect.topTrailing.offset(offset))
        assertEqual(grid.trailing, rect.trailing.offset(offset))
        assertEqual(grid.bottomTrailing, rect.bottomTrailing.offset(offset))
        assertEqual(grid.bottom, rect.bottom.offset(offset))
        assertEqual(grid.bottomLeading, rect.bottomLeading.offset(offset))
        assertEqual(grid.leading, rect.leading.offset(offset))
    }
    
    func testPropertiesForRotatedGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.rotated(180.degrees)
        
        assertEqual(grid.topLeading, rect.bottomTrailing)
        assertEqual(grid.top, rect.bottom)
        assertEqual(grid.topTrailing, rect.bottomLeading)
        assertEqual(grid.trailing, rect.leading)
        assertEqual(grid.bottomTrailing, rect.topLeading)
        assertEqual(grid.bottom, rect.top)
        assertEqual(grid.bottomLeading, rect.topTrailing)
        assertEqual(grid.leading, rect.trailing)
    }
    
    func testPropertiesForRotatedAndOffsetGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(15, 20)
        grid = grid.rotated(180.degrees)
        grid = grid.offset(offset)
        
        assertEqual(grid.topLeading, rect.bottomTrailing.offset(offset))
        assertEqual(grid[0, 0], grid.topLeading)
        assertEqual(grid.top, rect.bottom.offset(offset))
        assertEqual(grid[1, 0], grid.top)
        assertEqual(grid.topTrailing, rect.bottomLeading.offset(offset))
        assertEqual(grid[2, 0], grid.topTrailing)
        assertEqual(grid.trailing, rect.leading.offset(offset))
        assertEqual(grid[2, 1], grid.trailing)
        assertEqual(grid.bottomTrailing, rect.topLeading.offset(offset))
        assertEqual(grid[2, 2], grid.bottomTrailing)
        assertEqual(grid.bottom, rect.top.offset(offset))
        assertEqual(grid[1, 2], grid.bottom)
        assertEqual(grid.bottomLeading, rect.topTrailing.offset(offset))
        assertEqual(grid[0, 2], grid.bottomLeading)
        assertEqual(grid.leading, rect.trailing.offset(offset))
        assertEqual(grid[0, 1], grid.leading)
        assertEqual(grid.center, rect.center.offset(offset))
        assertEqual(grid[1, 1], grid.center)
    }
}

// MARK: ----- ANCHOR LOCATION

extension GridLayoutGuideTests {
    
    func testAnchorLocation() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 10)
        
        assertEqual(grid.anchorLocation(for: .topLeading), rect.topLeading)
        assertEqual(grid.anchorLocation(for: .top), rect.top)
        assertEqual(grid.anchorLocation(for: .topTrailing), rect.topTrailing)
        assertEqual(grid.anchorLocation(for: .trailing), rect.trailing)
        assertEqual(grid.anchorLocation(for: .bottomTrailing), rect.bottomTrailing)
        assertEqual(grid.anchorLocation(for: .bottom), rect.bottom)
        assertEqual(grid.anchorLocation(for: .bottomLeading), rect.bottomLeading)
        assertEqual(grid.anchorLocation(for: .leading), rect.leading)
        assertEqual(grid.anchorLocation(for: .center), rect.center)
        
        assertEqual(grid.anchorLocation(for: UnitPoint(0.25, 0.5)), CGPoint(rect.xScaled(0.25), rect.yScaled(0.5)))
        assertEqual(grid.anchorLocation(for: UnitPoint(0.75, 0.75)), CGPoint(rect.xScaled(0.75), rect.yScaled(0.75)))

    }
}
