//
//  View+ConditionalPadding.swift
//
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: - ----- CONDITIONAL MODIFIERS

public extension View {
    
    func modifierIf<T: ViewModifier>(_ condition: Bool, _ modifier: T) -> some View {
        RenderIf(condition) {
            self.modifier(modifier)
        }.elseRender {
            self
        }
    }
    
    func modifierIfNot<T: ViewModifier>(_ condition: Bool, _ modifier: T) -> some View {
        modifierIf(!condition, modifier)
    }
    
    func modifierIfElse<T_IF: ViewModifier, T_ELSE: ViewModifier>(_ condition: Bool, _ modifierIf: T_IF, _ modifierElse: T_ELSE) -> some View {
        RenderIf(condition) {
            self.modifier(modifierIf)
        }.elseRender {
            self.modifier(modifierElse)
        }
    }
}

// MARK: - ----- CONDITIONAL FRAME

public extension View {
    
    func frameIf<TW: UINumericType, TH: UINumericType>(_ condition: Bool, _ width: TW, _ height: TH) -> some View {
        frame(width: condition ? width.asCGFloat : nil, height: condition ? height.asCGFloat : nil)
    }
    
    func frameIfNot<TW: UINumericType, TH: UINumericType>(_ condition: Bool, _ width: TW, _ height: TH) -> some View {
        frameIf(!condition, width, height)
    }
    
    func frameIf(_ condition: Bool, _ size: CGSize) -> some View {
        frame(width: condition ? size.width : nil, height: condition ? size.height : nil)
    }
    
    func frameIfNot(_ condition: Bool, _ size: CGSize) -> some View {
        frameIf(!condition, size)
    }
    
    func widthIf<TW: UINumericType>(_ condition: Bool, _ width: TW) -> some View {
        frame(width: condition ? width.asCGFloat : nil)
    }
    
    func widthIfNot<TW: UINumericType>(_ condition: Bool, _ width: TW) -> some View {
        widthIf(!condition, width)
    }
    
    func heightIf<TH: UINumericType>(_ condition: Bool, _ height: TH) -> some View {
        frame(height: condition ? height.asCGFloat : nil)
    }
    
    func heightIfNot<TH: UINumericType>(_ condition: Bool, _ height: TH) -> some View {
        heightIf(!condition, height)
    }
}

// MARK: - ----- CONDITIONAL PADDING

public extension View {

    func paddingIf(_ condition: Bool) -> some View {
        padding(condition ? .all : [])
    }
    
    func paddingIfNot(_ condition: Bool) -> some View {
        paddingIf(!condition)
    }
    
    func paddingIf<T: UINumericType>(_ condition: Bool, _ paddingAmount: T) -> some View {
        paddingIf(condition, paddingAmount.asCGFloat)
    }
    
    func paddingIfNot<T: UINumericType>(_ condition: Bool, _ paddingAmount: T) -> some View {
        paddingIf(!condition, paddingAmount)
    }
    
    func hPaddingIf(_ condition: Bool) -> some View {
        padding(condition ? .horizontal : [])
    }

    func hPaddingIfNot(_ condition: Bool) -> some View {
        hPaddingIf(!condition)
    }
    
    func vPaddingIf(_ condition: Bool) -> some View {
        padding(condition ? .vertical : [])
    }
    
    func vPaddingIfNot(_ condition: Bool) -> some View {
        vPaddingIf(!condition)
    }

    func hPaddingIf<T: UINumericType>(_ condition: Bool, _ horizontalPadding: T) -> some View {
        hPaddingIf(condition, horizontalPadding.asCGFloat)
    }
    
    func hPaddingIfNot<T: UINumericType>(_ condition: Bool, _ horizontalPadding: T) -> some View {
        hPaddingIf(!condition, horizontalPadding)
    }

    func vPaddingIf<T: UINumericType>(_ condition: Bool, _ verticalPadding: T) -> some View {
        vPaddingIf(condition, verticalPadding.asCGFloat)
    }
    
    func vPaddingIfNot<T: UINumericType>(_ condition: Bool, _ verticalPadding: T) -> some View {
        vPaddingIf(!condition, verticalPadding)
    }

    //native
    func paddingIf(_ condition: Bool, _ paddingAmount: CGFloat) -> some View {
        padding(condition ? .all : [], paddingAmount)
    }
    
    func paddingIfNot(_ condition: Bool, _ paddingAmount: CGFloat) -> some View {
        paddingIf(!condition, paddingAmount)
    }
    
    func hPaddingIf(_ condition: Bool, _ horizontalPadding: CGFloat) -> some View {
        padding(condition ? .horizontal : [], horizontalPadding)
    }
    
    func hPaddingIfNot(_ condition: Bool, _ horizontalPadding: CGFloat) -> some View {
        hPaddingIf(!condition, horizontalPadding)
    }

    func vPaddingIf(_ condition: Bool, _ verticalPadding: CGFloat) -> some View {
        padding(condition ? .vertical : [], verticalPadding)
    }
    
    func vPaddingIfNot(_ condition: Bool, _ verticalPadding: CGFloat) -> some View {
        vPaddingIf(!condition, verticalPadding)
    }
}

// MARK: - ----- CONDITIONAL OFFSET

public extension View {
    
    func offsetIf(_ condition: Bool, _ point: CGPoint) -> some View {
        offset(condition ? point : .zero)
    }
    
    func offsetIfNot(_ condition: Bool, _ point: CGPoint) -> some View {
        offsetIf(!condition, point)
    }
    
    func offsetIf<T_LHS: UINumericType, T_RHS: UINumericType>(_ condition: Bool, _ x: T_LHS, _ y: T_RHS) -> some View {
        offsetIf(condition, x.asCGFloat, y.asCGFloat)
    }
    
    func offsetIfNot<T_LHS: UINumericType, T_RHS: UINumericType>(_ condition: Bool, _ x: T_LHS, _ y: T_RHS) -> some View {
        offsetIf(!condition, x, y)
    }
    
    func xOffsetIf<T: UINumericType>(_ condition: Bool, _ xOffset: T) -> some View {
        xOffsetIf(condition, xOffset.asCGFloat)
    }
    
    func xOffsetIfNot<T: UINumericType>(_ condition: Bool, _ xOffset: T) -> some View {
        xOffsetIf(!condition, xOffset)
    }
    
    func yOffsetIf<T: UINumericType>(_ condition: Bool, _ yOffset: T) -> some View {
        yOffsetIf(condition, yOffset.asCGFloat)
    }
    
    func yOffsetIfNot<T: UINumericType>(_ condition: Bool, _ yOffset: T) -> some View {
        yOffsetIf(!condition, yOffset)
    }
    
    //native
    func offsetIf(_ condition: Bool, _ x: CGFloat, _ y: CGFloat) -> some View {
        offset(condition ? x : 0, condition ? y : 0)
    }
    
    func offsetIfNot(_ condition: Bool, _ x: CGFloat, _ y: CGFloat) -> some View {
        offsetIf(!condition, x, y)
    }
    
    func xOffsetIf(_ condition: Bool, _ xOffset: CGFloat) -> some View {
        self.xOffset(condition ? xOffset : 0)
    }
    
    func xOffsetIfNot(_ condition: Bool, _ xOffset: CGFloat) -> some View {
        xOffsetIf(!condition, xOffset)
    }
    
    func yOffsetIf(_ condition: Bool, _ yOffset: CGFloat) -> some View {
        self.yOffset(condition ? yOffset : 0)
    }
    
    func yOffsetIfNot(_ condition: Bool, _ yOffset: CGFloat) -> some View {
        yOffsetIf(!condition, yOffset)
    }
}

// MARK: - ----- CONDITIONAL OPACITY

public extension View {
    
    func opacityIf<T: UINumericType>(_ condition: Bool, _ opacity: T) -> some View {
        self.opacity(condition ? opacity.asDouble : 1)
    }
    
    func opacityIfNot<T: UINumericType>(_ condition: Bool, _ opacity: T) -> some View {
        opacityIf(!condition, opacity)
    }
}

// MARK: ----- CONDITIONAL BLUR

public extension View {
    
    func blurIf<T: UINumericType>(_ condition: Bool, _ radius: T, opaque: Bool = false) -> some View {
        blur(radius: condition ? radius.asCGFloat : 0, opaque: opaque)
    }
    
    func blurIfNot<T: UINumericType>(_ condition: Bool, _ radius: T, opaque: Bool = false) -> some View {
        blurIf(!condition, radius, opaque: opaque)
    }
}

// MARK: ----- CONDITIONAL HUE ROTATION

public extension View {
    
    func hueRotationIf(_ condition: Bool, _ angle: Angle) -> some View {
        hueRotation(condition ? angle : 0.degrees)
    }
    
    func hueRotationIfNot(_ condition: Bool, _ angle: Angle) -> some View {
        hueRotationIf(!condition, angle)
    }
}

// MARK: ----- CONDITIONAL IMAGE PROCESSING

public extension View {
 
    func saturationIf<T: UINumericType>(_ condition: Bool, _ value: T) -> some View {
        saturation(condition ? value.asDouble : 1)
    }
    
    func saturationIfNot<T: UINumericType>(_ condition: Bool, _ value: T) -> some View {
        saturationIf(!condition, value.asDouble)
    }
    
    func brightnessIf<T: UINumericType>(_ condition: Bool, _ amount: T) -> some View {
        brightness(condition ? amount.asDouble : 0)
    }
    
    func brightnessIfNot<T: UINumericType>(_ condition: Bool, _ amount: T) -> some View {
        brightnessIf(!condition, amount)
    }
    
    func contrastIf<T: UINumericType>(_ condition: Bool, _ amount: T) -> some View {
        contrast(condition ? amount.asDouble : 1)
    }
    
    func contrastIfNot<T: UINumericType>(_ condition: Bool, _ amount: T) -> some View {
        contrastIf(!condition, amount)
    }
      
    func grayscaleIf<T: UINumericType>(_ condition: Bool, _ amount: T) -> some View {
        grayscale(condition ? amount.asDouble : 0)
    }
      
    func grayscaleIfNot<T: UINumericType>(_ condition: Bool, _ amount: T) -> some View {
        grayscaleIf(!condition, amount)
    }
}

// MARK: ----- BACKGROUND

public extension View {
    func backgroundIf<T: View>(_ condition: Bool, _ content: T, alignment: Alignment = .center) -> some View {
        RenderIf(condition) {
            self.background(content, alignment: alignment)
        }.elseRender {
            self
        }
    }
    
    func backgroundIfNot<T: View>(_ condition: Bool, _ content: T, alignment: Alignment = .center) -> some View {
        backgroundIf(!condition, content, alignment: alignment)
    }
    
    func backgroundIf(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        background(condition ? color : Color.clear, alignment: alignment)
    }
    
    func backgroundIfNot(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        backgroundIf(!condition, color, alignment: alignment)
    }
    
    func backgroundColorIf(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        backgroundIf(condition, color, alignment: alignment)
    }
    
    func backgroundColorIfNot(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        backgroundIf(!condition, color, alignment: alignment)
    }
}

// MARK: ----- OVERLAY

public extension View {
    func overlayIf<T: View>(_ condition: Bool, _ content: T, alignment: Alignment = .center) -> some View {
        RenderIf(condition) {
            self.overlay(content, alignment: alignment)
        }.elseRender {
            self
        }
    }
    
    func overlayIfNot<T: View>(_ condition: Bool, _ content: T, alignment: Alignment = .center) -> some View {
        overlayIf(!condition, content, alignment: alignment)
    }
    
    func overlayIf(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        overlay(condition ? color : Color.clear, alignment: alignment)
    }
    
    func overlayIfNot(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        overlayIf(!condition, color, alignment: alignment)
    }
    
    func overlayColorIf(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        overlayIf(condition, color, alignment: alignment)
    }
    
    func overlayColorIfNot(_ condition: Bool, _ color: Color, alignment: Alignment = .center) -> some View {
        overlayIf(!condition, color, alignment: alignment)
    }
}

// MARK: ----- BORDER

public extension View {
    
    func borderIf<SS: ShapeStyle>(_ condition: Bool, _ shapeStyle: SS) -> some View {
        RenderIf(condition) {
            self.border(shapeStyle)
        }.elseRender {
            self
        }
    }
    
    func borderIfNot<SS: ShapeStyle>(_ condition: Bool, _ shapeStyle: SS) -> some View {
        borderIf(!condition, shapeStyle)
    }
    
    func borderIf(_ condition: Bool, _ color: Color) -> some View {
        border(condition ? color : Color.clear)
    }
    
    func borderIfNot(_ condition: Bool, _ color: Color) -> some View {
        borderIf(!condition, color)
    }
    
    func borderColorIf(_ condition: Bool, _ color: Color) -> some View {
        border(condition ? color : Color.clear)
    }
    
    func borderColorIfNot(_ condition: Bool, _ color: Color) -> some View {
        borderColorIf(!condition, color)
    }
    
    // with width
    func borderIf<SS: ShapeStyle, T: UINumericType>(_ condition: Bool, _ shapeStyle: SS, width: T) -> some View {
        RenderIf(condition) {
            self.border(shapeStyle, width: width.asCGFloat)
        }.elseRender {
            self
        }
    }
    
    func borderIfNot<SS: ShapeStyle, T: UINumericType>(_ condition: Bool, _ shapeStyle: SS, width: T) -> some View {
        borderIf(!condition, shapeStyle, width: width)
    }
    
    func borderIf<T: UINumericType>(_ condition: Bool, _ color: Color, width: T) -> some View {
        border(condition ? color : Color.clear, width: width.asCGFloat)
    }
    
    func borderIfNot<T: UINumericType>(_ condition: Bool, _ color: Color, width: T) -> some View {
        borderIf(!condition, color, width: width)
    }
    
    func borderColorIf<T: UINumericType>(_ condition: Bool, _ color: Color, width: T) -> some View {
        borderIf(condition, color, width: width)
    }
    
    func borderColorIfNot<T: UINumericType>(_ condition: Bool, _ color: Color, width: T) -> some View {
        borderIf(!condition, color, width: width)
    }
}

// MARK: - ----- CONDITIONAL ROTATION

public extension View {
    
    func rotateIf(_ condition: Bool, _ rotation: Angle, anchor: UnitPoint = .center) -> some View {
        rotate(condition ? rotation : 0.degrees, anchor: anchor)
    }
    
    func rotateIfNot(_ condition: Bool, _ rotation: Angle, anchor: UnitPoint = .center) -> some View {
        rotateIf(!condition, rotation, anchor: anchor)
    }
    
    func rotate3DIf(_ condition: Bool, _ rotation: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        rotate3D(condition ? rotation : 0.degrees, axis, anchor: anchor, anchorZ: anchorZ)
    }
    
    func rotate3DIfNot(_ condition: Bool, _ rotation: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        rotate3DIf(!condition, rotation, axis: axis, anchor: anchor, anchorZ: anchorZ)
    }
}

// MARK: - ----- CONDITIONAL SCALE

private let defaultScaleSize = CGSize(1, 1)

public extension View {
    
    func scaleIf<T: UINumericType>(_ condition: Bool, _ scale: T, anchor: UnitPoint = .center) -> some View {
        self.scaleEffect(condition ? scale.asCGFloat : 1, anchor: anchor)
    }
    
    func scaleIfNot<T: UINumericType>(_ condition: Bool, _ scale: T, anchor: UnitPoint = .center) -> some View {
        scaleIf(!condition, scale)
    }
    
    func scaleIf(_ condition: Bool, _ scale: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleEffect(condition ? scale : defaultScaleSize, anchor: anchor)
    }
    
    func scaleIfNot(_ condition: Bool, _ scale: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleIf(!condition, scale, anchor: anchor)
    }
    
    func xScaleIf<T: UINumericType>(_ condition: Bool, _ scaleX: T, anchor: UnitPoint = .center) -> some View {
        xScale(condition ? scaleX.asCGFloat : 1, anchor: anchor)
    }
    
    func xScaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleX: T, anchor: UnitPoint = .center) -> some View {
        xScaleIf(!condition, scaleX, anchor: anchor)
    }
    
    func yScaleIf<T: UINumericType>(_ condition: Bool, _ scaleY: T, anchor: UnitPoint = .center) -> some View {
        yScale(condition ? scaleY.asCGFloat : 1, anchor: anchor)
    }

    func yScaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleY: T, anchor: UnitPoint = .center) -> some View {
        yScaleIf(!condition, scaleY, anchor: anchor)
    }
}

// MARK: - ----- CONDITIONAL SHADOW

public extension View {
    
    private func shadowIf(_ condition: Bool, color: Color? = nil, radius: CGFloat, x: CGFloat, y: CGFloat) -> some View {
        RenderIf(color != nil) {
            self.shadow(color: color!, radius: condition ? radius : 0, x: condition ? x : 0, y: condition ? y : 0)
        }.elseRender {
            self.shadow(radius: condition ? radius : 0, x: condition ? x : 0, y: condition ? y : 0)
        }
    }
    
    func shadowIf<TR: UINumericType, TX: UINumericType, TY: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR, x: TX, y: TY) -> some View {
        shadowIf(condition, color: color, radius: radius.asCGFloat, x: x.asCGFloat, y: x.asCGFloat)
    }
    
    func shadowIfNot<TR: UINumericType, TX: UINumericType, TY: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR, x: TX, y: TY) -> some View {
        shadowIf(!condition, color: color, radius: radius.asCGFloat, x: x.asCGFloat, y: x.asCGFloat)
    }
    
    func shadowIf<TR: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR) -> some View {
        shadowIf(condition, color: color, radius: radius, x: 0, y: 0)
    }
    
    func shadowIfNot<TR: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR) -> some View {
        shadowIf(!condition, color: color, radius: radius, x: 0, y: 0)
    }
    
    func shadowIf<TR: UINumericType, TX: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR, x: TX) -> some View {
        shadowIf(condition, color: color, radius: radius, x: x, y: 0)
    }
    
    func shadowIfNot<TR: UINumericType, TX: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR, x: TX) -> some View {
        shadowIf(!condition, color: color, radius: radius, x: x, y: 0)
    }

    func shadowIf<TR: UINumericType, TY: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR, y: TY) -> some View {
        shadowIf(condition, color: color, radius: radius, x: 0, y: y)
    }
    
    func shadowIfNot<TR: UINumericType, TY: UINumericType>(_ condition: Bool, color: Color? = nil, radius: TR, y: TY) -> some View {
        shadowIf(!condition, color: color, radius: radius, x: 0, y: y)
    }
}

// MARK: - ----- CONDITIONAL CONTENT SHAPE

public extension View {
    
    func contentShapeIf<S: Shape>(_ condition: Bool, _ shape: S) -> some View {
        RenderIf(condition) {
            self.contentShape(shape)
        }.elseRender {
            self
        }
    }
    
    func contentShapeIfNot<S: Shape>(_ condition: Bool, _ shape: S) -> some View {
        contentShapeIf(!condition, shape)
    }
}

// MARK: ----- CONDITIONAL ANIMATION

public extension View {
    
    func animationIf(_ condition: Bool, _ theAnimation: Animation? = .default) -> some View {
        transaction {
            if condition {
                $0.animation = theAnimation
            }
        }
    }
    
    func withAnimationIf<Result>(_ condition: Bool, _ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if condition {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

// MARK: ----- DISABLED

public extension View {
    
    func disabledIf(_ condition: Bool) -> some View {
        disabled(condition)
    }
    
    func disabledIfNot(_ condition: Bool) -> some View {
        disabledIf(!condition)
    }
}
