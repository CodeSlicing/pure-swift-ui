//
//  UIScreen+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 18/12/2019.
//

#if canImport(UIKit)
import XCTest
@testable import PureSwiftUI

class UIScreenConvenienceExtensionsTests: XCTestCase {
    
    func testOrigin() {
        XCTAssertEqual(UIScreen.main.origin, UIScreen.main.bounds.origin)
    }
    
    func testCenter() {
        XCTAssertEqual(UIScreen.main.center, UIScreen.main.bounds.center)
    }
    
    func testMinX() {
        XCTAssertEqual(UIScreen.main.minX, UIScreen.main.bounds.minX)
    }
    
    func testMinY() {
        XCTAssertEqual(UIScreen.main.minY, UIScreen.main.bounds.minY)
    }
    
    func testMaxX() {
        XCTAssertEqual(UIScreen.main.maxX, UIScreen.main.bounds.maxX)
    }
    
    func testMaxY() {
        XCTAssertEqual(UIScreen.main.maxY, UIScreen.main.bounds.maxY)
    }
    
    func testMidX() {
        XCTAssertEqual(UIScreen.main.midX, UIScreen.main.bounds.midX)
    }
    
    func testMidY() {
        XCTAssertEqual(UIScreen.main.midY, UIScreen.main.bounds.midY)
    }
    
    func testWidth() {
        XCTAssertEqual(UIScreen.main.width, UIScreen.main.bounds.width)
    }
    
    func testHeight() {
        XCTAssertEqual(UIScreen.main.height, UIScreen.main.bounds.height)
    }
    
    func testSize() {
        XCTAssertEqual(UIScreen.main.size, UIScreen.main.bounds.size)
    }
}
#endif
