//
//  TestFunctions.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
import PureSwiftUI

func assertEqual(_ result: Double, _ expectedResult: Double, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(result, expectedResult, accuracy: 0.0001, file: file, line: line)
}

func assertEqual<TX: UINumericType, TY: UINumericType>(_ result: CGPoint, _ expected: (x: TX, y: TY), file: StaticString = #file, line: UInt = #line) {
    assertEqual(result, CGPoint(expected.x, expected.y), file: file, line: line)
}

func assertEqual(_ result: CGPoint, _ expected: (x: CGFloat, y: CGFloat), file: StaticString = #file, line: UInt = #line) {
    assertEqual(result, CGPoint(expected.x, expected.y), file: file, line: line)
}

func assertEqual(_ result: CGPoint, _ expected: CGPoint, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(result.rounded(toPlaces: 2), expected.rounded(toPlaces: 2), file: file, line: line)
}

private extension CGPoint {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> CGPoint {
        CGPoint(round(self.x, to: 2), round(self.y, to: 2))
    }
    
    private func round(_ value: CGFloat, to places: Int) -> CGFloat {

        let divisor = pow(10.0, CGFloat(places))
        return (value * divisor).rounded() / divisor
    }
}
