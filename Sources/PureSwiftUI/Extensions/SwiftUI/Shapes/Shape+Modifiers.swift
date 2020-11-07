//
//  Shape+Modifiers.swift
//
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension Shape {
    
    func fillColor(_ color: Color, style: FillStyle = FillStyle()) -> some View {
        fill(color, style: style)
    }

    func strokeColor(_ color: Color) -> some View {
        stroke(color)
    }
    
    func strokeColor(_ color: Color, lineWidth: CGFloat) -> some View {
        stroke(color, lineWidth: lineWidth)
    }
    
    // named
    func fillColor(_ colorName: String, style: FillStyle = FillStyle()) -> some View {
        fill(Color(colorName), style: style)
    }

    func strokeColor(_ colorName: String) -> some View {
        stroke(Color(colorName))
    }
    
    func strokeColor(_ colorName: String, lineWidth: CGFloat) -> some View {
        stroke(Color(colorName), lineWidth: lineWidth)
    }
}

// MARK: ----- OFFSET

public extension Shape {
    
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

    func scale(_ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        self.scale(x: scale, y: scale, anchor: anchor)
    }
    
    func scale(_ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleX, y: scaleY, anchor: anchor)
    }
    
    func xScale(_ scaleX: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleX, y: 1, anchor: anchor)
    }
    
    func yScale(_ scaleY: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: 1, y: scaleY, anchor: anchor)
    }
}

// MARK: ----- ROTATION

public extension Shape {

    func rotate(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotation(angle, anchor: anchor)
    }
}

// MARK: ----- SIZE

public extension Shape {
    
    func size(_ width: CGFloat, _ height: CGFloat) -> some Shape {
        size(width: width, height: height)
    }

    func size(_ theSize: CGFloat) -> some Shape {
        size(theSize, theSize)
    }
}
