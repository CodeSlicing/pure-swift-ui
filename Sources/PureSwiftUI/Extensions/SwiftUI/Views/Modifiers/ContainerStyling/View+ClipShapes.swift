//
//  View+ClipShapes.swift
//
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

private struct ClipShapeWithNoFillViewModifier<S: Shape>: ViewModifier {
    
    let shape: S
    let constrainGestures: Bool
    
    func body(content: Content) -> some View {
        content
            .clipShape(shape)
            .contentShapeIf(constrainGestures, shape)
    }
}

private struct ClipShapeWithFillViewModifier<S: Shape, SS: ShapeStyle>: ViewModifier {
    
    let shape: S
    let fill: SS
    let fillStyle: FillStyle
    let constrainGestures: Bool
    
    func body(content: Content) -> some View {
        content
            .background(shape.fill(fill, style: fillStyle))
            .clipShape(shape)
            .contentShapeIf(constrainGestures, shape)
    }
}

public extension View {
    
    func clipShape<S: Shape>(_ shape: S, constrainGestures: Bool) -> some View {
        modifier(ClipShapeWithNoFillViewModifier(shape: shape, constrainGestures: constrainGestures))
    }
    
    func clipShape<S: Shape, SS: ShapeStyle>(_ shape: S, fill: SS, fillStyle: FillStyle, constrainGestures: Bool) -> some View {
        modifier(ClipShapeWithFillViewModifier(shape: shape, fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures))
    }
    
    @inlinable
    func clipCapsule(constrainGestures: Bool = true) -> some View {
        clipShape(Capsule(), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsule<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(Capsule(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircle(constrainGestures: Bool = true) -> some View {
        clipShape(Circle(), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircle<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(Circle(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipse(constrainGestures: Bool = true) -> some View {
        clipShape(Ellipse(), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipse<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(Ellipse(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangle(constrainGestures: Bool = true) -> some View {
        clipShape(Rectangle(), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangle<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(Rectangle(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle<T: UINumericType>(_ cornerRadius: T, cornerStyle: RoundedCornerStyle = .circular, constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(cornerRadius, style: cornerStyle), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle<T: UINumericType, SS: ShapeStyle>(_ cornerRadius: T, cornerStyle: RoundedCornerStyle = .circular, fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(cornerRadius, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle<T: UINumericType>(_ cornerRadius: T, cornerStyle: RoundedCornerStyle = .circular, fill: Color, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(cornerRadius, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle<TW: UINumericType, TH: UINumericType>(_ cornerWidth: TW, _ cornerHeight: TH, cornerStyle: RoundedCornerStyle = .circular, constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(cornerWidth, cornerHeight, style: cornerStyle), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle<TW: UINumericType, TH: UINumericType, SS: ShapeStyle>(_ width: TW, _ height: TH, cornerStyle: RoundedCornerStyle = .circular, fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(width, height, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle(_ cornerSize: CGSize, cornerStyle: RoundedCornerStyle = .circular, constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(cornerSize, style: cornerStyle), constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangle<SS: ShapeStyle>(_ cornerSize: CGSize, cornerStyle: RoundedCornerStyle = .circular, fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShape(RoundedRectangle(cornerSize, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
}
