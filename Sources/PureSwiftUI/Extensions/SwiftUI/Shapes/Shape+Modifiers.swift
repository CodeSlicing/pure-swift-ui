//
//  Shape+Modifiers.swift
//  
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension Shape {
    
    func fillColor(_ color: Color) -> some View {
        fill(color)
    }

    func strokeColor(_ color: Color) -> some View {
        self.stroke(color)
    }
}

// MARK: ----- OFFSET

public extension Shape {
    
    func offset<T_LHS: UINumericType, T_RHS: UINumericType>(_ x: T_LHS, _ y: T_RHS) -> OffsetShape<Self> {
        offset(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    func xOffset<T: UINumericType>(_ x: T) -> OffsetShape<Self> {
        offset(x: x.asCGFloat)
    }

    func yOffset<T: UINumericType>(_ y: T) -> OffsetShape<Self> {
        offset(y: y.asCGFloat)
    }
    
    //native
    func offset(_ x: CGFloat, _ y: CGFloat) -> OffsetShape<Self> {
        offset(x: x, y: y)
    }

    func xOffset(_ x: CGFloat) -> OffsetShape<Self> {
        offset(x: x)
    }

    func yOffset(_ y: CGFloat) -> OffsetShape<Self> {
        offset(y: y)
    }
    
    func offset(_ point: CGPoint) -> OffsetShape<Self> {
        offset(x: point.x, y: point.y)
    }
    
    func offset(_ size: CGSize) -> OffsetShape<Self> {
        offset(x: size.width, y: size.height)
    }
}

// MARK: ----- SCALE

public extension Shape {

    func scale<T: UINumericType>(_ scaleFactor: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(scaleFactor.asCGFloat, anchor: anchor)
    }
    
    func scale<TX: UINumericType, TY: UINumericType>(_ scaleX: TX, _ scaleY: TY, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleX.asCGFloat, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    func xScale<T: UINumericType>(_ scaleX: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleX.asCGFloat, y: 1, anchor: anchor)
    }
    
    func yScale<T: UINumericType>(_ scaleY: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: 1, y: scaleY.asCGFloat, anchor: anchor)
    }
}

// MARK: ----- ROTATION

public extension Shape {

    func rotate(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotation(angle, anchor: anchor)
    }
}
