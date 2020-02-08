//
//  Angle+Convenience.swift
//  
//
//  Created by Adam Fordyce on 20/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//
import SwiftUI

public extension Angle {
    
    static func *<T: UINumericType>(lhs: Angle, rhs: T) -> Angle {
        Angle(degrees: lhs.degrees * rhs.asDouble)
    }

    static func /<T: UINumericType>(lhs: Angle, rhs: T) -> Angle {
        Angle(degrees: lhs.degrees / rhs.asDouble)
    }
}

// MARK: ----- TRIGONOMETRY

public extension Angle {
    
    var cos: Double {
        Darwin.cos(self.radians)
    }

    var sin: Double {
        Darwin.sin(self.radians)
    }
    
    var tan: Double {
        Darwin.tan(self.radians)
    }
}

// MARK: ----- COORDINATES

public extension Angle {
    
    static let topLeading = 315.degrees
    static let top = 0.degrees
    static let topTrailing = 45.degrees
    static let trailing = 90.degrees
    static let bottomTrailing = 135.degrees
    static let bottom = 180.degrees
    static let bottomLeading = 225.degrees
    static let leading = 270.degrees
}

// MARK: ----- CYCLE FRACTION

public extension Angle {
    
    static func cycle<T: UINumericType>(_ scale: T) -> Angle {
        (360.0 * scale.asDouble).degrees
    }
}
