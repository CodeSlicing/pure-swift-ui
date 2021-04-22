//
//  Shape+Modifiers.swift
//
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- FILL AND STROKE

public extension Shape {
    
    func fillColor(_ color: Color, style: FillStyle = FillStyle()) -> some View {
        fill(color, style: style)
    }

    func strokeColor(_ color: Color) -> some View {
        stroke(color)
    }

    func strokeColor(_ color: Color, style: StrokeStyle) -> some View {
        stroke(color, style: style)
    }

    func strokeColor(_ color: Color, lineWidth: CGFloat) -> some View {
        stroke(color, lineWidth: lineWidth)
    }
    
    // named color
    func fillColor(_ colorName: String, style: FillStyle = FillStyle()) -> some View {
        fill(Color(colorName), style: style)
    }

    func strokeColor(_ colorName: String) -> some View {
        stroke(Color(colorName))
    }

    func strokeColor(_ colorName: String, style: StrokeStyle) -> some View {
        stroke(Color(colorName), style: style)
    }

    func strokeColor(_ colorName: String, lineWidth: CGFloat) -> some View {
        stroke(Color(colorName), lineWidth: lineWidth)
    }
}

// MARK: ----- EOFILL

public extension Shape {
    
    func eoFill<S: ShapeStyle>(_ content: S, antialiased: Bool = true) -> some View {
        fill(content, style: .init(eoFill: true, antialiased: antialiased))
    }
    
    func eoFill(antialiased: Bool = true) -> some View {
        fill(style: .init(eoFill: true, antialiased: antialiased))
    }
    
    func eoFillColor(_ color: Color, antialiased: Bool = true) -> some View {
        eoFill(color, antialiased: antialiased)
    }
    
    // named color
    func eoFillColor(_ colorName: String, antialiased: Bool = true) -> some View {
        eoFill(Color(colorName), antialiased: antialiased)
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
}

// MARK: ----- SCALE

public extension Shape {
    
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
