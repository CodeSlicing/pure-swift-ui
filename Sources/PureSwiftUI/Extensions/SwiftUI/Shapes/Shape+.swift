//
//  Shape+.swift
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
    
    func xOffset<T: UINumericType>(_ xOffset: T) -> OffsetShape<Self> {
        offset(x: xOffset.asCGFloat)
    }

    func yOffset<T: UINumericType>(_ yOffset: T) -> OffsetShape<Self> {
        offset(y: yOffset.asCGFloat)
    }
    
    //native
    func offset(_ x: CGFloat, _ y: CGFloat) -> OffsetShape<Self> {
        offset(x: x, y: y)
    }

    func xOffset(_ xOffset: CGFloat) -> OffsetShape<Self> {
        offset(x: xOffset)
    }

    func yOffset(_ yOffset: CGFloat) -> OffsetShape<Self> {
        offset(y: yOffset)
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
    
    func scale<TX: UINumericType, TY: UINumericType>(_ scaleXFactor: TX, _ scaleYFactor: TY, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleXFactor.asCGFloat, y: scaleYFactor.asCGFloat, anchor: anchor)
    }
    
    func xScale<T: UINumericType>(_ scaleXFactor: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleXFactor.asCGFloat, anchor: anchor)
    }
    
    func yScale<T: UINumericType>(_ scaleYFactor: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleYFactor.asCGFloat, anchor: anchor)
    }
    
    //native
    
    func scale(_ scaleSize: CGSize, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(scaleSize.x, scaleSize.y, anchor: anchor)
    }
    
    func scale(_ scaleXFactor: CGFloat, _ scaleYFactor: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleXFactor, y: scaleYFactor, anchor: anchor)
    }
    
    func xScale(_ scaleXFactor: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleXFactor, anchor: anchor)
    }
    
    func yScale(_ scaleYFactor: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleYFactor, anchor: anchor)
    }
    
}

// MARK: ----- ROTATION

public extension Shape {

    func rotate(_ angle: Angle) -> RotatedShape<Self> {
        rotation(angle)
    }
}
