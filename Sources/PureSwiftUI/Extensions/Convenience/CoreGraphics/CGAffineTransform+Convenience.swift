//
//  CGAffineTransform+Convenience.swift
//  
//
//  Created by NTB on 27/01/2020.
//

import SwiftUI

public extension CGAffineTransform {
    
    static func rotation(_ angle: Angle) -> CGAffineTransform {
        .init(rotationAngle: angle.radians.asCGFloat)
    }
    
    static func translation(_ x: CGFloat, _ y: CGFloat) -> CGAffineTransform {
        .init(translationX: x, y: y)
    }
    
    static func xTranslation(_ x: CGFloat) -> CGAffineTransform {
        .init(translationX: x, y: 0)
    }

    static func yTranslation(_ y: CGFloat) -> CGAffineTransform {
        .init(translationX: 0, y: y)
    }

    static func scale(_ x: CGFloat, _ y: CGFloat) -> CGAffineTransform {
        .init(scaleX: x, y: y)
    }

    static func xScale(_ x: CGFloat) -> CGAffineTransform {
        .init(scaleX: x, y: 1)
    }

    static func yScale(_ y: CGFloat) -> CGAffineTransform {
        .init(scaleX: 1, y: y)
    }
}

