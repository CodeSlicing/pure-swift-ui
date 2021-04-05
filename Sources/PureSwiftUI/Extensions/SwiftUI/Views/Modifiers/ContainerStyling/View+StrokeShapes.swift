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
    case center
}

private struct StrokeShapeWithLineWidthViewModifier<IS: InsettableShape, SS: ShapeStyle>: ViewModifier {
    
    let shape: IS
    let shapeContent: SS
    let lineWidth: CGFloat
    let strokeType: ShapeStrokeType
    let constrainGestures: Bool
    
    func body(content: Content) -> some View {
        RenderIf(strokeType == .inner) {
            content.overlay(self.shape.strokeBorder(self.shapeContent, lineWidth: self.lineWidth))
        }.elseRender {
            RenderIf(self.strokeType == .outer) {
                content.overlay(self.shape.inset(by: -self.lineWidth).strokeBorder(self.shapeContent, lineWidth: self.lineWidth.asCGFloat))
            }.elseRender {
                content.overlay(self.shape.stroke(self.shapeContent, lineWidth: self.lineWidth))
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
    
    func strokeShape<IS: InsettableShape, SS: ShapeStyle>(_ shape: IS, content: SS, lineWidth: CGFloat, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        modifier(StrokeShapeWithLineWidthViewModifier(shape: shape, shapeContent: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures))
    }
    
    func strokeShape<IS: InsettableShape, SS: ShapeStyle>(_ shape: IS, content: SS, strokeStyle: StrokeStyle = StrokeStyle(), strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        modifier(StrokeShapeWithStrokeStyleViewModifier(shape: shape, shapeContent: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures))
    }
}

// MARK: - ----- CAPSULE -----

public extension View {

    func strokeCapsule<SS: ShapeStyle>(_ content: SS, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCapsule<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCapsule(_ color: Color, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCapsule(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- CIRCLE -----

public extension View {

    func strokeCircle<SS: ShapeStyle>(_ content: SS, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCircle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCircle(_ color: Color, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeCircle(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ELLIPSE -----

public extension View {

    func strokeEllipse<SS: ShapeStyle>(_ content: SS, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeEllipse<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeEllipse(_ color: Color, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeEllipse(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- RECTANGLE -----

public extension View {

    func strokeRectangle<SS: ShapeStyle>(_ content: SS, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRectangle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRectangle(_ color: Color, lineWidth: CGFloat, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRectangle(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- ROUNDED RECTANGLE -----

public extension View {

    func strokeRoundedRectangle<SS: ShapeStyle>(_ cornerRadius: CGFloat, _ content: SS, lineWidth: CGFloat, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeRoundedRectangle<SS: ShapeStyle>(_ cornerRadius: CGFloat, _ content: SS, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRoundedRectangle(_ cornerRadius: CGFloat, _ color: Color, lineWidth: CGFloat, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeRoundedRectangle(_ cornerRadius: CGFloat, _ color: Color, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ROUNDED RECTANGLE WITH SIZE -----

public extension View {
    
    func strokeRoundedRectangle<SS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, lineWidth: CGFloat, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRoundedRectangle<SS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    func strokeRoundedRectangle(_ cornerSize: CGSize, _ color: Color, lineWidth: CGFloat, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    func strokeRoundedRectangle(_ cornerSize: CGSize, _ color: Color, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
