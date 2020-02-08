//
//  UnitPoint+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class UnitPointConvenienceExtensionsTests: XCTestCase {

    let x: CGFloat = 0.5
    let y: CGFloat = 0.7
}

// MARK: ----- INIT

extension UnitPointConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(UnitPoint(x, y), UnitPoint(x: x, y: y))
     }
}
