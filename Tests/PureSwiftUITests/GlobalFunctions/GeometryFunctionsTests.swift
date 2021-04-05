//
//  GeometryFunctionsTests.swift
//  
//
//  Created by Adam Fordyce on 16/02/2020.
//

import XCTest
@testable import PureSwiftUI

class GeometryFunctionsTests: XCTestCase {
    
    
}

// MARK: ----- OFFSETS FOR ANGLES

extension GeometryFunctionsTests {
    
    func testCalcOffsetTest() {
        assertEqual(calcOffset(radius: 10, angle: 0.degrees), .point(0, -10))
        assertEqual(calcOffset(radius: 10, angle: 90.degrees), .point(10, -0))
        assertEqual(calcOffset(radius: 10, angle: 180.degrees), .point(0, 10))
        assertEqual(calcOffset(radius: 10, angle: 270.degrees), .point(-10, 0))
    }
}
