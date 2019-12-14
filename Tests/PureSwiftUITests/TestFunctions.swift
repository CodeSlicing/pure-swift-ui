//
//  TestFunctions.swift
//  
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest

func assertEquals(_ result: Double, _ expectedResult: Double) {
    XCTAssertEqual(result, expectedResult, accuracy: 0.0001)
}
