//
//  View+ClipShapes.swift
//
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension View {
    //extract modifier to also clip content shape
    
    private func clipShapeInternal<S: Shape>(_ shape: S, constrainGestures: Bool) -> some View {
            self.clipShape(shape)
                .contentShapeIf(constrainGestures, shape)
    }
    
    private func clipShapeInternal<S: Shape, SS: ShapeStyle>(_ shape: S, fill: SS, fillStyle: FillStyle, constrainGestures: Bool) -> some View {
        background(shape.fill(fill, style: fillStyle))
            .clipShape(shape)
            .contentShapeIf(constrainGestures, shape)
    }
    
    func clipCapsule(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Capsule(), constrainGestures: constrainGestures)
    }
    
    func clipCapsule<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Capsule(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipCircle(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Circle(), constrainGestures: constrainGestures)
    }
    
    func clipCircle<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Circle(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipEllipse(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Ellipse(), constrainGestures: constrainGestures)
    }
    
    func clipEllipse<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Ellipse(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipRectangle(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Rectangle(), constrainGestures: constrainGestures)
    }
    
    func clipRectangle<SS: ShapeStyle>(fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Rectangle(), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<T: UINumericType>(_ cornerRadius: T, cornerStyle: RoundedCornerStyle = .circular, constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerRadius, style: cornerStyle), constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<T: UINumericType, SS: ShapeStyle>(_ cornerRadius: T, cornerStyle: RoundedCornerStyle = .circular, fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerRadius, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<T: UINumericType>(_ cornerRadius: T, cornerStyle: RoundedCornerStyle = .circular, fill: Color, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerRadius, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<TW: UINumericType, TH: UINumericType>(_ cornerWidth: TW, _ cornerHeight: TH, cornerStyle: RoundedCornerStyle = .circular, constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerWidth, cornerHeight, style: cornerStyle), constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<TW: UINumericType, TH: UINumericType, SS: ShapeStyle>(_ width: TW, _ height: TH, cornerStyle: RoundedCornerStyle = .circular, fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(width, height, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle(_ cornerSize: CGSize, cornerStyle: RoundedCornerStyle = .circular, constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerSize, style: cornerStyle), constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<SS: ShapeStyle>(_ cornerSize: CGSize, cornerStyle: RoundedCornerStyle = .circular, fill: SS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerSize, style: cornerStyle), fill: fill, fillStyle: fillStyle, constrainGestures: constrainGestures)
    }
}
