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
        let expectedResult: Double = 256
        let result = Double(4) ** Double(4)
         XCTAssertEqual(result, expectedResult)
    }
    
}
