//
//  Float+AngleTests.swift
//
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest

class CollectionConvenienceTests: XCTestCase {
    
    
}

// MARK: ----- GENERAL

extension CollectionConvenienceTests {
    
    func testIsNotEmpty() {
        XCTAssertTrue([1].isNotEmpty)
        XCTAssertFalse([].isNotEmpty)
    }
}
