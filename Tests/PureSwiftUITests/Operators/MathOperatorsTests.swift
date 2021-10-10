//
//  MathOperatorsTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class MathOperatorsTests: XCTestCase {

    func testPowForDouble() {
        XCTAssertEqual(Double(4) ** Double(4), 256)
        XCTAssertEqual(CGFloat(4) ** CGFloat(2), 16)
        XCTAssertEqual(5.asDouble ** 0, 1)
        XCTAssertEqual(5.asCGFloat ** 0, 1)
    }
    
}
