//
//  Angle+.swift
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
