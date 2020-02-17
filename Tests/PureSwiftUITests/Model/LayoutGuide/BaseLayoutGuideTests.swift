//
//  LayoutGuideTests.swift
//  
//
//  Created by Adam Fordyce on 14/02/2020.
//

import XCTest
@testable import PureSwiftUI

class BaseLayoutGuideTests: XCTestCase {

    let x: CGFloat = 2
    let y: CGFloat = 4
    let width: CGFloat = 20
    let height: CGFloat = 12
    
    var rect: CGRect {
        CGRect(x, y, width, height)
    }
    
    var bottomRightRect: CGRect {
        CGRect(rect.center, rect.sizeScaled(0.5))
    }
}

class LayoutGuideTests: BaseLayoutGuideTests {
    
}

