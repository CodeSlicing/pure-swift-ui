//
//  LayoutCoordinatorTests.swift
//  
//
//  Created by Adam Fordyce on 14/02/2020.
//

import XCTest
@testable import PureSwiftUI

class LayoutCoordinatorTests: BaseLayoutGuideTests {

    var columns = 10
    var rows = 20
    
    var layoutConfig: LayoutGuideConfig {
        return LayoutGuideConfig.grid(columns: columns, rows: rows)
    }
    
    var grid: LayoutGuide {
        layoutConfig.layout(in: rect)
    }
}

// MARK: ----- OFFSET LAYOUT COORDINATOR PROPERTIES

extension LayoutCoordinatorTests {
    
    func testOffsetLayoutProperties() {
        var grid = self.grid
        assertEqual(grid[0,0], rect.origin)
        grid = grid.offset(.x(10))
        assertEqual(grid[0,0], rect.origin.xOffset(10))
        grid = grid.offset(.y(20))
        assertEqual(grid[0,0], rect.origin.offset(10, 20))
        
        XCTAssertEqual(grid.xCount, columns)
        XCTAssertEqual(grid.yCount, rows)
    }
}

// MARK: ----- REFRAMED OFFSET LAYOUT COORDINATOR

extension LayoutCoordinatorTests {
    
    func testReframedOffsetLayoutCoordinator() {
        var grid = self.grid
        grid = grid.offset(.x(10))
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        
        assertEqual(grid[10,20], bottomRightRect.bottomTrailing.xOffset(10))
    }
}

// MARK: ----- ROTATED LAYOUT COORDINATOR PROPERTIES

extension LayoutCoordinatorTests {
    
    func testRotatedLayoutProperties() {
        var grid = self.grid
        assertEqual(grid[5, 10], rect.center)
        grid = grid.rotated(10.degrees)
        assertEqual(grid[5, 10], rect.center)
        
        XCTAssertEqual(grid.xCount, columns)
        XCTAssertEqual(grid.yCount, rows)
    }
}

// MARK: ----- REFRAMED ROTATED LAYOUT COORDINATOR

extension LayoutCoordinatorTests {
    
    func testReframedRotatedLayoutCoordinator() {
        var grid = self.grid
        grid = grid.rotated(90.degrees)
        grid = grid.reframed(bottomRightRect, origin: .center)
        
        assertEqual(grid[0,0], rect.bottomTrailing.offset(bottomRightRect.halfHeight, -bottomRightRect.halfWidth))
    }
}

// MARK: ----- SCALED LAYOUT COORDINATOR PROPERTIES

extension LayoutCoordinatorTests {
    
    func testScaledLayoutProperties() {
        var grid = self.grid
        assertEqual(grid[5, 10], rect.center)
        grid = grid.scaled(2)
        assertEqual(grid[5, 10], rect.center)
  
        let location = grid.anchorLocation(for: .top)
        XCTAssertEqual(location, rect.top)
        
        XCTAssertEqual(grid.xCount, columns)
        XCTAssertEqual(grid.yCount, rows)
    }
}

// MARK: ----- REFRAMED SCALED LAYOUT COORDINATOR

extension LayoutCoordinatorTests {
    
    func testReframedScaledLayoutCoordinator() {
        var grid = self.grid
        grid = grid.scaled(2)
        grid = grid.reframed(bottomRightRect)
        
        assertEqual(grid[10,20], bottomRightRect.bottomTrailing.offset(bottomRightRect.sizeScaled(0.5)))
        assertEqual(grid[5,10], bottomRightRect.center)
        assertEqual(grid[0,0], bottomRightRect.topLeading.offset(bottomRightRect.sizeScaled(-0.5)))
    }
}


