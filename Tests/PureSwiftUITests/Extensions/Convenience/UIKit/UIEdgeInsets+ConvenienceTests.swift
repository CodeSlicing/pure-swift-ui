//
//  UIEdgeInsets+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

#if canImport(UIKit)
import XCTest
@testable import PureSwiftUI

class UIEdgeInsetsConvenienceExtensionsTests: XCTestCase {
    
    let top: CGFloat = 1
    let leading: CGFloat = 2
    let bottom: CGFloat = 3
    let trailing: CGFloat = 4
    let width: CGFloat = 1
    let height: CGFloat = 4
}

// MARK: ----- INIT

extension UIEdgeInsetsConvenienceExtensionsTests {
    
    func testInit() {
        XCTAssertEqual(UIEdgeInsets(width), UIEdgeInsets(top: width, left: width, bottom: width, right: width))
        XCTAssertEqual(UIEdgeInsets(width, height), UIEdgeInsets(top: height, left: width, bottom: height, right: width))
        XCTAssertEqual(UIEdgeInsets(top, leading, bottom, trailing), UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing))
    }
}
#endif
