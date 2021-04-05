//
//  EdgeInsets+ConvenienceTests.swift
//
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class EdgeInsetsConvenienceExtensionsTests: XCTestCase {

    let top: CGFloat = 1
    let leading: CGFloat = 2
    let bottom: CGFloat = 3
    let trailing: CGFloat = 4
    let width: CGFloat = 1
    let height: CGFloat = 4
    let size: CGFloat = 2
}

// MARK: ----- INIT

extension EdgeInsetsConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(EdgeInsets(size), EdgeInsets(top: size, leading: size, bottom: size, trailing: size))
        XCTAssertEqual(EdgeInsets(width, height), EdgeInsets(top: height, leading: width, bottom: height, trailing: width))
        XCTAssertEqual(EdgeInsets(top, leading, bottom, trailing), EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }
}

