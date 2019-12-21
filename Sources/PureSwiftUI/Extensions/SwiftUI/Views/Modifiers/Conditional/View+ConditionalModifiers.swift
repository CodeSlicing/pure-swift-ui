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
        self.frame(width: condition ? width.asCGFloat : nil, height: condition ? height.asCGFloat : nil)
    }
    
    func frameIfNot<TW: UINumericType, TH: UINumericType>(_ condition: Bool, _ width: TW, _ height: TH) -> some View {
        self.frameIf(!condition, width, height)
    }
    
    func frameIf(_ condition: Bool, _ size: CGSize) -> some View {
        self.frame(width: condition ? size.width : nil, height: condition ? size.height : nil)
    }
    
    func frameIfNot(_ condition: Bool, _ size: CGSize) -> some View {
        self.frameIf(!condition, size)
    }
    
    func widthIf<TW: UINumericType>(_ condition: Bool, _ width: TW) -> some View {
        self.frame(width: condition ? width.asCGFloat : nil)
    }
    
    func widthIfNot<TW: UINumericType>(_ condition: Bool, _ width: TW) -> some View {
        self.widthIf(!condition, width)
    }
    
    func heightIf<TH: UINumericType>(_ condition: Bool, _ height: TH) -> some View {
        self.frame(height: condition ? height.asCGFloat : nil)
    }
    
    func heightIfNot<TH: UINumericType>(_ condition: Bool, _ height: TH) -> some View {
        self.heightIf(!condition, height)
    }
}

// MARK: - ----- CONDITIONAL PADDING

public extension View {

    func paddingIf(_ condition: Bool) -> some View {
        self.padding(condition ? .all : [])
    }
    
    func paddingIfNot(_ condition: Bool) -> some View {
        self.paddingIf(!condition)
    }
    
    func paddingIf<T: UINumericType>(_ condition: Bool, _ paddingAmount: T) -> some View {
        self.paddingIf(condition, paddingAmount.asCGFloat)
    }
    
    func paddingIfNot<T: UINumericType>(_ condition: Bool, _ paddingAmount: T) -> some View {
        self.paddingIf(!condition, paddingAmount)
    }
    
    func hPaddingIf(_ condition: Bool) -> some View {
        self.padding(condition ? .horizontal : [])
    }

    func hPaddingIfNot(_ condition: Bool) -> some View {
        self.hPaddingIf(!condition)
    }
    
    func vPaddingIf(_ condition: Bool) -> some View {
        self.padding(condition ? .vertical : [])
    }
    
    func vPaddingIfNot(_ condition: Bool) -> some View {
        self.vPaddingIf(!condition)
    }

    func hPaddingIf<T: UINumericType>(_ condition: Bool, _ horizontalPadding: T) -> some View {
        self.hPaddingIf(condition, horizontalPadding.asCGFloat)
    }
    
    func hPaddingIfNot<T: UINumericType>(_ condition: Bool, _ horizontalPadding: T) -> some View {
        self.hPaddingIf(!condition, horizontalPadding)
    }

    func vPaddingIf<T: UINumericType>(_ condition: Bool, _ verticalPadding: T) -> some View {
        self.vPaddingIf(condition, verticalPadding.asCGFloat)
    }
    
    func vPaddingIfNot<T: UINumericType>(_ condition: Bool, _ verticalPadding: T) -> some View {
        self.vPaddingIf(!condition, verticalPadding)
    }

    //native
    func paddingIf(_ condition: Bool, _ paddingAmount: CGFloat) -> some View {
        self.padding(condition ? .all : [], paddingAmount)
    }
    
    func paddingIfNot(_ condition: Bool, _ paddingAmount: CGFloat) -> some View {
        self.paddingIf(!condition, paddingAmount)
    }
    
    func hPaddingIf(_ condition: Bool, _ horizontalPadding: CGFloat) -> some View {
        self.padding(condition ? .horizontal : [], horizontalPadding)
    }
    
    func hPaddingIfNot(_ condition: Bool, _ horizontalPadding: CGFloat) -> some View {
        self.hPaddingIf(!condition, horizontalPadding)
    }

    func vPaddingIf(_ condition: Bool, _ verticalPadding: CGFloat) -> some View {
        self.padding(condition ? .vertical : [], verticalPadding)
    }
    
    func vPaddingIfNot(_ condition: Bool, _ verticalPadding: CGFloat) -> some View {
        self.vPaddingIf(!condition, verticalPadding)
    }
}

// MARK: - ----- CONDITIONAL OFFSET

public extension View {
    
    func offsetIf(_ condition: Bool, _ point: CGPoint) -> some View {
        self.offset(condition ? point : .zero)
    }
    
    func offsetIfNot(_ condition: Bool, _ point: CGPoint) -> some View {
        self.offsetIf(!condition, point)
    }
    
    func offsetIf<T_LHS: UINumericType, T_RHS: UINumericType>(_ condition: Bool, _ x: T_LHS, _ y: T_RHS) -> some View {
        self.offsetIf(condition, x.asCGFloat, y.asCGFloat)
    }
    
    func offsetIfNot<T_LHS: UINumericType, T_RHS: UINumericType>(_ condition: Bool, _ x: T_LHS, _ y: T_RHS) -> some View {
        self.offsetIf(!condition, x, y)
    }
    
    func xOffsetIf<T: UINumericType>(_ condition: Bool, _ xOffset: T) -> some View {
        self.xOffsetIf(condition, xOffset.asCGFloat)
    }
    
    func xOffsetIfNot<T: UINumericType>(_ condition: Bool, _ xOffset: T) -> some View {
        self.xOffsetIf(!condition, xOffset)
    }
    
    func yOffsetIf<T: UINumericType>(_ condition: Bool, _ yOffset: T) -> some View {
        self.yOffsetIf(condition, yOffset.asCGFloat)
    }
    
    func yOffsetIfNot<T: UINumericType>(_ condition: Bool, _ yOffset: T) -> some View {
        self.yOffsetIf(!condition, yOffset)
    }
    
    //native
    func offsetIf(_ condition: Bool, _ x: CGFloat, _ y: CGFloat) -> some View {
        self.offset(condition ? x : 0, condition ? y : 0)
    }
    
    func offsetIfNot(_ condition: Bool, _ x: CGFloat, _ y: CGFloat) -> some View {
        self.offsetIf(!condition, x, y)
    }
    
    func xOffsetIf(_ condition: Bool, _ xOffset: CGFloat) -> some View {
        self.xOffset(condition ? xOffset : 0)
    }
    
    func xOffsetIfNot(_ condition: Bool, _ xOffset: CGFloat) -> some View {
        self.xOffsetIf(!condition, xOffset)
    }
    
    func yOffsetIf(_ condition: Bool, _ yOffset: CGFloat) -> some View {
        self.yOffset(condition ? yOffset : 0)
    }
    
    func yOffsetIfNot(_ condition: Bool, _ yOffset: CGFloat) -> some View {
        self.yOffsetIf(!condition, yOffset)
    }
}

// MARK: - ----- CONDITIONAL OPACITY

public extension View {
    
    func opacityIf<T: UINumericType>(_ condition: Bool, _ opacity: T) -> some View {
        self.opacity(condition ? opacity.asDouble : 1)
    }
    
    func opacityIfNot<T: UINumericType>(_ condition: Bool, _ opacity: T) -> some View {
        self.opacityIf(!condition, opacity)
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

// MARK: - ----- CONDITIONAL ROTATION

public extension View {
    
    func rotateIf(_ condition: Bool, _ rotation: Angle, anchor: UnitPoint = .center) -> some View {
        self.rotate(condition ? rotation : 0.degrees, anchor: anchor)
    }
    
    func rotateIfNot(_ condition: Bool, _ rotation: Angle, anchor: UnitPoint = .center) -> some View {
        self.rotateIf(!condition, rotation, anchor: anchor)
    }
    
    func rotate3DIf(_ condition: Bool, _ rotation: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        self.rotate3D(condition ? rotation : 0.degrees, axis, anchor: anchor, anchorZ: anchorZ)
    }
    
    func rotate3DIfNot(_ condition: Bool, _ rotation: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        self.rotate3DIf(!condition, rotation, axis: axis, anchor: anchor, anchorZ: anchorZ)
    }
    
//    func rotate3D(_ angle: Angle, _ axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
//        rotation3DEffect(angle, axis: axis, anchor: anchor, anchorZ: anchorZ, perspective: perspective)
//    }
}

// MARK: - ----- CONDITIONAL SCALE

private let defaultScaleSize = CGSize(1, 1)

public extension View {
    
    func scaleIf<T: UINumericType>(_ condition: Bool, _ scaleEffect: T, anchor: UnitPoint = .center) -> some View {
        self.scaleEffect(condition ? scaleEffect.asCGFloat : 1, anchor: anchor)
    }
    
    func scaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleEffect: T, anchor: UnitPoint = .center) -> some View {
        self.scaleIf(!condition, scaleEffect)
    }
    
    func scaleIf(_ condition: Bool, _ scaleEffect: CGSize, anchor: UnitPoint = .center) -> some View {
        self.scaleEffect(condition ? scaleEffect : defaultScaleSize, anchor: anchor)
    }
    
    func scaleIfNot(_ condition: Bool, _ scaleEffect: CGSize, anchor: UnitPoint = .center) -> some View {
        self.scaleIf(!condition, scaleEffect, anchor: anchor)
    }
    
    func xScaleIf<T: UINumericType>(_ condition: Bool, _ scaleX: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: condition ? scaleX.asCGFloat : 1, anchor: anchor)
    }
    
    func xScaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleX: T, anchor: UnitPoint = .center) -> some View {
        xScaleIf(!condition, scaleX, anchor: anchor)
    }
    
    func yScaleIf<T: UINumericType>(_ condition: Bool, _ scaleY: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(y: condition ? scaleY.asCGFloat : 1, anchor: anchor)
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
