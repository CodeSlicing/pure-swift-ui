//
//  View+StrokeShapes.swift
//
//
//  Created by Adam Fordyce on 21/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI


public enum ShapeStrokeType {
    case inner
    case outer
    @available(*, deprecated, renamed: "center")
    case mid
    case center
}

private struct StrokeShapeWithLineWidthViewModifier<IS: InsettableShape, SS: ShapeStyle, TLW: UINumericType>: ViewModifier {
    
    let shape: IS
    let shapeContent: SS
    let lineWidth: TLW
    let strokeType: ShapeStrokeType
    let constrainGestures: Bool
    
    func body(content: Content) -> some View {
        RenderIf(strokeType == .inner) {
            content.overlay(self.shape.strokeBorder(self.shapeContent, lineWidth: self.lineWidth.asCGFloat))
        }.elseRender {
            RenderIf(self.strokeType == .outer) {
                content.overlay(self.shape.inset(by: -self.lineWidth.asCGFloat).strokeBorder(self.shapeContent, lineWidth: self.lineWidth.asCGFloat))
            }.elseRender {
                content.overlay(self.shape.stroke(self.shapeContent, lineWidth: self.lineWidth.asCGFloat))
            }
        }
        .contentShapeIf(constrainGestures, shape)
    }
}

private struct StrokeShapeWithStrokeStyleViewModifier<IS: InsettableShape, SS: ShapeStyle>: ViewModifier {
    
    let shape: IS
    let shapeContent: SS
    let strokeStyle: StrokeStyle
    let strokeType: ShapeStrokeType
    let constrainGestures: Bool
    
    func body(content: Content) -> some View {
        RenderIf(strokeType == .inner) {
            content.overlay(self.shape.strokeBorder(self.shapeContent, style: self.strokeStyle))
        }.elseRender {
            RenderIf(self.strokeType == .outer) {
                content.overlay(self.shape.inset(by: -self.strokeStyle.lineWidth).strokeBorder(self.shapeContent, style: self.strokeStyle))
            }.elseRender {
                content.overlay(self.shape.stroke(self.shapeContent, style: self.strokeStyle))
            }
        }
        .contentShapeIf(constrainGestures, shape)
    }
}

public extension View {
    
    func strokeShape<IS: InsettableShape, SS: ShapeStyle, TLW: UINumericType>(_ shape: IS, content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        modifier(StrokeShapeWithLineWidthViewModifier(shape: shape, shapeContent: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures))
    }
    
    func strokeShape<IS: InsettableShape, SS: ShapeStyle>(_ shape: IS, content: SS, strokeStyle: StrokeStyle = StrokeStyle(), strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        modifier(StrokeShapeWithStrokeStyleViewModifier(shape: shape, shapeContent: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures))
    }
}

// MARK: - ----- CAPSULE -----

public extension View {

    @inlinable
    func strokeCapsule<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeCapsule<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeCapsule<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeCapsule(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCapsule")
    @inlinable
    func strokeCapsuleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCapsule")
    @inlinable
    func strokeCapsuleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- CIRCLE -----

public extension View {

    @inlinable
    func strokeCircle<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeCircle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeCircle<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeCircle(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCircle")
    @inlinable
    func strokeCircleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCircle")
    @inlinable
    func strokeCircleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ELLIPSE -----

public extension View {

    @inlinable
    func strokeEllipse<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeEllipse<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeEllipse<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeEllipse(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeEllipse")
    @inlinable
    func strokeEllipseWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeEllipse")
    @inlinable
    func strokeEllipseWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- RECTANGLE -----

public extension View {

    @inlinable
    func strokeRectangle<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeRectangle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeRectangle<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeRectangle(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRectangle")
    @inlinable
    func strokeRectangleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRectangle")
    @inlinable
    func strokeRectangleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- ROUNDED RECTANGLE -----

public extension View {

    @inlinable
    func strokeRoundedRectangle<TR: UINumericType, SS: ShapeStyle, TLW: UINumericType>(_ cornerRadius: TR, _ content: SS, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func strokeRoundedRectangle<TR: UINumericType, SS: ShapeStyle>(_ cornerRadius: TR, _ content: SS, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Moved cornerRadius and removed argument label for consistency")
    @inlinable
    func strokeRoundedRectangle<SS: ShapeStyle, TR: UINumericType, TLW: UINumericType>(_ content: SS, cornerRadius: TR, style: RoundedCornerStyle = .circular, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Moved cornerRadius and removed argument label for consistency")
    @inlinable
    func strokeRoundedRectangle<SS: ShapeStyle, TR: UINumericType>(_ content: SS, cornerRadius: TR, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeRoundedRectangle<TR: UINumericType, TLW: UINumericType>(_ cornerRadius: TR, _ color: Color, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func strokeRoundedRectangle<TR: UINumericType>(_ cornerRadius: TR, _ color: Color, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerRadius and removed argument label for consistency")
    @inlinable
    func strokeRoundedRectangleWithColor<TR: UINumericType, TLW: UINumericType>(_ color: Color, cornerRadius: TR, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerRadius and removed argument label for consistency")
    @inlinable
    func strokeRoundedRectangleWithColor<TR: UINumericType>(_ color: Color, cornerRadius: TR, style: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ROUNDED RECTANGLE WITH SIZE -----

public extension View {
    
    @inlinable
    func strokeRoundedRectangle<SS: ShapeStyle,  TLW: UINumericType>(_ cornerSize: CGSize, _ content: SS, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeRoundedRectangle<SS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func strokeRoundedRectangle<TLW: UINumericType>(_ cornerSize: CGSize, _ color: Color, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func strokeRoundedRectangle(_ cornerSize: CGSize, _ color: Color, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerSize and removed argument label for consistency")
    @inlinable
    func strokeRoundedRectangleWithColor<TLW: UINumericType>(_ color: Color, cornerSize: CGSize, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerSize and removed argument label for consistency")
    @inlinable
    func strokebRoundedRectangleWithColor(_ color: Color, cornerSize: CGSize, style: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
