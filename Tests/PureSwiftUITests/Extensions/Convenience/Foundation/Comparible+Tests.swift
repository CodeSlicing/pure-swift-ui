//
//  Comparible+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class ComparibleConvenienceExtensionsTests: XCTestCase {
    
    func testClamped() {

        XCTAssertEqual(1, 2.clamped(from: 0, to: 1))
        XCTAssertEqual(4, 3.clamped(from: 4, to: 10))
        XCTAssertEqual(2, 2.clamped(from: 0, to: 3))
        XCTAssertEqual(2, 2.clamped(from: -3, to: 3))
    }
}

