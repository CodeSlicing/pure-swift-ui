//
//  GridLayoutGuideTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class GridLayoutGuideTests: XCTestCase {

    let x: CGFloat = 2
    let y: CGFloat = 4
    let width: CGFloat = 10
    let height: CGFloat = 5

    var rect: CGRect {
        CGRect(x, y, width, height)
    }
    
    var bottomRight: CGRect {
        CGRect(rect.center, rect.sizeScaled(0.5))
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS

extension GridLayoutGuideTests {

    func testPointsForEquidistant() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
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
        grid = grid.reframed(bottomRight, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRight.origin)
        assertEqual(grid[10, 6], bottomRight.extent)
        assertEqual(grid[10, 0], bottomRight.topTrailing)
        assertEqual(grid[0, 6], bottomRight.bottomLeading)
        assertEqual(grid[5, 3], bottomRight.center)
        assertEqual(grid[10, 3], bottomRight.trailing)
        assertEqual(grid[5, 6], bottomRight.bottom)
        assertEqual(grid[0, 3], bottomRight.leading)
        assertEqual(grid[5, 0], bottomRight.top)
    }
    
    func testPointsForEquidistantWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
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
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[-10, -6], (x - width, y - height))
        assertEqual(grid[20, 12], CGRect(CGPoint(x, y), rect.sizeScaled(2)).extent)
    }
}

// MARK: -----  RELATIVE POINT TESTS

extension GridLayoutGuideTests {

    func testPointsForRelative() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
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
        grid = grid.reframed(bottomRight, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRight.origin)
        assertEqual(grid[2, 2], bottomRight.extent)
        assertEqual(grid[2, 0], bottomRight.topTrailing)
        assertEqual(grid[0, 2], bottomRight.bottomLeading)
        assertEqual(grid[1, 1], bottomRight.center)
        assertEqual(grid[2, 1], bottomRight.trailing)
        assertEqual(grid[1, 2], bottomRight.bottom)
        assertEqual(grid[0, 1], bottomRight.leading)
        assertEqual(grid[1, 0], bottomRight.top)
    }
    
    func testPointsForRelativeWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
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
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[-10, -6], rect.origin)
        assertEqual(grid[6, 6], rect.extent)
    }
}

// MARK: ----- EQUIDISTANT X  RELATIVE Y POINT TESTS

extension GridLayoutGuideTests {

    func testPointsForEquidistantXRelativeY() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
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
        grid = grid.reframed(bottomRight, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRight.origin)
        assertEqual(grid[10, 2], bottomRight.extent)
        assertEqual(grid[10, 0], bottomRight.topTrailing)
        assertEqual(grid[0, 2], bottomRight.bottomLeading)
        assertEqual(grid[5, 1], bottomRight.center)
        assertEqual(grid[10, 1], bottomRight.trailing)
        assertEqual(grid[5, 2], bottomRight.bottom)
        assertEqual(grid[0, 1], bottomRight.leading)
        assertEqual(grid[5, 0], bottomRight.top)
    }
    
    func testPointsForEquidistantXRelativeYWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
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
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[-10, -6], (x - width, rect.origin.y))
        assertEqual(grid[20, 12], (x + width * 2, rect.extent.y))
    }
}

// MARK: -----  RELATIVE X EQUIDISTANT Y POINT TESTS

extension GridLayoutGuideTests {

    func testPointsForRelativeXEquidistantY() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
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
        grid = grid.reframed(bottomRight, origin: .topLeading)
        assertEqual(grid[0, 0], rect.center)
        assertEqual(grid[2, 6], bottomRight.extent)
        assertEqual(grid[2, 0], bottomRight.topTrailing)
        assertEqual(grid[0, 6], bottomRight.bottomLeading)
        assertEqual(grid[1, 3], bottomRight.center)
        assertEqual(grid[2, 3], bottomRight.trailing)
        assertEqual(grid[1, 6], bottomRight.bottom)
        assertEqual(grid[0, 3], bottomRight.leading)
        assertEqual(grid[1, 0], bottomRight.top)
    }
    
    func testPointsForRelativeXEquidistantYWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
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
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[-10, -6], (x, y - height))
        assertEqual(grid[20, 12], (rect.extent.x, y + height * 2))
    }
}
