//
//  Edge+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class EdgeSetConvenienceExtensionsTests: XCTestCase {

    let size: CGFloat = 2
}

// MARK: ----- CONVENIENCE FUNCTIONS

extension EdgeSetConvenienceExtensionsTests {
    
    func testInset() {
        XCTAssertEqual(Edge.Set.horizontal.inset(.horizontal, size), size)
        XCTAssertEqual(Edge.Set.horizontal.inset(.vertical, size), 0)

        XCTAssertEqual(Edge.Set.horizontal.hInset(size), size)
        XCTAssertEqual(Edge.Set.horizontal.vInset(size), 0)
    }
}
