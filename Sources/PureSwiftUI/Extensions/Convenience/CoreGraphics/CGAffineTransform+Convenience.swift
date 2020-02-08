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
    
    static func translation<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGAffineTransform {
        .init(translationX: x.asCGFloat, y: y.asCGFloat)
    }
    
    static func xTranslation<T: UINumericType>(_ x: T) -> CGAffineTransform {
        .init(translationX: x.asCGFloat, y: 0)
    }

    static func yTranslation<T: UINumericType>(_ y: T) -> CGAffineTransform {
        .init(translationX: 0, y: y.asCGFloat)
    }

    static func scale<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGAffineTransform {
        .init(scaleX: x.asCGFloat, y: y.asCGFloat)
    }

    static func xScale<T: UINumericType>(_ x: T) -> CGAffineTransform {
        .init(scaleX: x.asCGFloat, y: 1)
    }

    static func yScale<T: UINumericType>(_ y: T) -> CGAffineTransform {
        .init(scaleX: 1, y: y.asCGFloat)
    }
}

