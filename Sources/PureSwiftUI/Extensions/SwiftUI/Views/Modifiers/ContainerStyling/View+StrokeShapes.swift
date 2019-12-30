//
//  View+StrokeShapes.swift
//
//
//  Created by Adam Fordyce on 21/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI


public enum ShapeStrokeType {
    case inner, outer, mid
}

public extension View {
    func strokeShape<IS: InsettableShape, SS: ShapeStyle, TLW: UINumericType>(_ shape: IS, content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        RenderIf(strokeType == .inner) {
            self.overlay(shape.strokeBorder(content, lineWidth: lineWidth.asCGFloat))
        }.elseRender {
            RenderIf(strokeType == .outer) {
                self.overlay(shape.inset(by: -lineWidth.asCGFloat).strokeBorder(content, lineWidth: lineWidth.asCGFloat))
            }.elseRender {
                self.overlay(shape.stroke(content, lineWidth: lineWidth.asCGFloat))
            }
        }
        .contentShapeIf(constrainGestures, shape)
    }
    
    func strokeShape<IS: InsettableShape, SS: ShapeStyle>(_ shape: IS, content: SS, strokeStyle: StrokeStyle = StrokeStyle(), strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        RenderIf(strokeType == .inner) {
            self.overlay(shape.strokeBorder(content, style: strokeStyle))
        }.elseRender {
            RenderIf(strokeType == .outer) {
                self.overlay(shape.inset(by: -strokeStyle.lineWidth).strokeBorder(content, style: strokeStyle))
            }.elseRender {
                self.overlay(shape.stroke(content, style: strokeStyle))
            }
        }
        .contentShapeIf(constrainGestures, shape)
    }
}

// MARK: - ----- CAPSULE -----

public extension View {

    func strokeCapsule<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCapsule<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeCapsuleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCapsuleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- CIRCLE -----

public extension View {

    func strokeCircle<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCircle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCircleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCircleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ELLIPSE -----

public extension View {

    func strokeEllipse<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeEllipse<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeEllipseWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeEllipseWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- RECTANGLE -----

public extension View {

    func strokeRectangle<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRectangle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRectangleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRectangleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- ROUNDED RECTANGLE -----

public extension View {


    func strokeRoundedRectangle<SS: ShapeStyle, TR: UINumericType, TLW: UINumericType>(_ content: SS, cornerRadius: TR, style: RoundedCornerStyle = .continuous, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeRoundedRectangle<SS: ShapeStyle>(_ content: SS, cornerRadius: CGFloat, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .continuous, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRoundedRectangleWithColor<TLW: UINumericType>(_ color: Color, cornerRadius: CGFloat, lineWidth: TLW, style: RoundedCornerStyle = .continuous, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeRoundedRectangleWithColor(_ color: Color, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ROUNDED RECTANGLE WITH SIZE -----

public extension View {
    
    func strokeRoundedRectangle<SS: ShapeStyle,  TLW: UINumericType>(_ content: SS, cornerSize: CGSize, style: RoundedCornerStyle = .continuous, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRoundedRectangle<SS: ShapeStyle>(_ content: SS, cornerSize: CGSize, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .continuous, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeRoundedRectangleWithColor<TLW: UINumericType>(_ color: Color, cornerSize: CGSize, lineWidth: TLW, style: RoundedCornerStyle = .continuous, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokebRoundedRectangleWithColor(_ color: Color, cornerSize: CGSize, style: RoundedCornerStyle = .continuous, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
