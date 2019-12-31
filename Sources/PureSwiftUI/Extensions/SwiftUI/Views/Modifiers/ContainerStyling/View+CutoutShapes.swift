//
//  View+CutoutShapes.swift
//
//
//  Created by Adam Fordyce on 21/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension View {

    func cutoutShape<S: InsettableShape>(_ shape: S, shadowColor: Color = .black, shadowRadius: CGFloat = 7.5, shadowStrokeWidth: CGFloat = 10, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        overlay(shape.inset(by: -shadowStrokeWidth)
            .strokeBorder(Color.white, lineWidth: shadowStrokeWidth)
            .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
            .blendMode(.multiply))
            .clipShape(shape)
            .contentShapeIf(constrainGestures, shape)
    }
    
    func cutoutCircle(shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 5, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(Circle(), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX, shadowY: shadowY)
    }
    
    func cutoutCapsule(shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 5, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(Capsule(), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX, shadowY: shadowY)
    }
    
    func cutoutRoundedRectangle<T: UINumericType>(_ cornerRadius: T, style: RoundedCornerStyle = .circular, shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 5, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(RoundedRectangle(cornerRadius, style: style), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX, shadowY: shadowY)
    }
    
    func cutoutRoundedRectangle<TW: UINumericType, TH: UINumericType>(_ cornerWidth: TW, _ cornerHeight: TH, style: RoundedCornerStyle = .circular, shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 5, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(RoundedRectangle(cornerWidth, cornerHeight, style: style), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX, shadowY: shadowY)
    }
    
    func cutoutRoundedRectangle(cornerSize: CGSize, style: RoundedCornerStyle = .circular, shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 5, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(RoundedRectangle(cornerSize, style: style), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX, shadowY: shadowY)
    }
    
    func cutoutRectangle(shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 5, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(Rectangle(), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX, shadowY: shadowY)
    }
    
    func cutoutEllipse(shadowColor: Color = .black, shadowRadius: CGFloat = 5, shadowStrokeWidth: CGFloat = 2, shadowX: CGFloat = 0, shadowY: CGFloat = 0, constrainGestures: Bool = true) -> some View {
        cutoutShape(Ellipse(), shadowColor: shadowColor, shadowRadius: shadowRadius, shadowStrokeWidth: shadowStrokeWidth, shadowX: shadowX + shadowStrokeWidth, shadowY: shadowY +
            shadowStrokeWidth)
    }
}
