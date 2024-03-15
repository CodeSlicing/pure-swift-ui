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
    
    @ViewBuilder func modifierIf<T: ViewModifier>(_ condition: Bool, _ modifier: T) -> some View {
        if condition {
            self.modifier(modifier)
        } else {
            self
        }
    }
    
    func modifierIfNot<T: ViewModifier>(_ condition: Bool, _ modifier: T) -> some View {
        modifierIf(!condition, modifier)
    }
    
    @ViewBuilder func modifierIfElse<T_IF: ViewModifier, T_ELSE: ViewModifier>(_ condition: Bool, _ modifierIf: T_IF, _ modifierElse: T_ELSE) -> some View {
        if condition {
            self.modifier(modifierIf)
        } else {
            self.modifier(modifierElse)
        }
    }
}

// MARK: - ----- CONDITIONAL FRAME

public extension View {
    
    func frameIf(_ condition: Bool, _ width: CGFloat, _ height: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: condition ? width : nil, height: condition ? height : nil, alignment: alignment)
    }
    
    func frameIfNot(_ condition: Bool, _ width: CGFloat, _ height: CGFloat, alignment: Alignment = .center) -> some View {
        frameIf(!condition, width, height, alignment: alignment)
    }
    
    func frameIf(_ condition: Bool, _ size: CGFloat, alignment: Alignment = .center) -> some View {
        frameIf(condition, size, size, alignment: alignment)
    }
    
    func frameIfNot(_ condition: Bool, _ size: CGFloat, alignment: Alignment = .center) -> some View {
        frameIf(!condition, size, alignment: alignment)
    }
    
    func frameIf(_ condition: Bool, _ size: CGSize, alignment: Alignment = .center) -> some View {
        frame(width: condition ? size.width : nil, height: condition ? size.height : nil, alignment: alignment)
    }
    
    func frameIfNot(_ condition: Bool, _ size: CGSize, alignment: Alignment = .center) -> some View {
        frameIf(!condition, size, alignment: alignment)
    }
    
    func widthIf(_ condition: Bool, _ width: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: condition ? width : nil, alignment: alignment)
    }
    
    func widthIfNot(_ condition: Bool, _ width: CGFloat, alignment: Alignment = .center) -> some View {
        widthIf(!condition, width, alignment: alignment)
    }
    
    func heightIf(_ condition: Bool, _ height: CGFloat, alignment: Alignment = .center) -> some View {
        frame(height: condition ? height : nil, alignment: alignment)
    }
    
    func heightIfNot(_ condition: Bool, _ height: CGFloat, alignment: Alignment = .center) -> some View {
        heightIf(!condition, height, alignment: alignment)
    }
}

// MARK: ----- CONDITIONAL CORNER RADIUS

public extension View {
    
    func cornerRadiusIf(_ condition: Bool, _ radius: CGFloat, antialiased: Bool = true) -> some View {
        cornerRadius(condition ? radius : 0, antialiased: antialiased)
    }

    func cornerRadiusIfNot(_ condition: Bool, _ radius: CGFloat, antialiased: Bool = true) -> some View {
        cornerRadiusIf(!condition, radius, antialiased: antialiased)
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
    
    func opacityIf(_ condition: Bool, _ opacity: Double) -> some View {
        self.opacity(condition ? opacity : 1)
    }
    
    func opacityIfNot(_ condition: Bool, _ opacity: Double) -> some View {
        opacityIf(!condition, opacity)
    }
}

// MARK: ----- CONDITIONAL BLUR

public extension View {
    
    func blurIf(_ condition: Bool, _ radius: CGFloat, opaque: Bool = false) -> some View {
        blur(radius: condition ? radius : 0, opaque: opaque)
    }
    
    func blurIfNot(_ condition: Bool, _ radius: CGFloat, opaque: Bool = false) -> some View {
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
 
    func saturationIf(_ condition: Bool, _ value: Double) -> some View {
        saturation(condition ? value : 1)
    }
    
    func saturationIfNot(_ condition: Bool, _ value: Double) -> some View {
        saturationIf(!condition, value)
    }
    
    func brightnessIf(_ condition: Bool, _ amount: Double) -> some View {
        brightness(condition ? amount : 0)
    }
    
    func brightnessIfNot(_ condition: Bool, _ amount: Double) -> some View {
        brightnessIf(!condition, amount)
    }
    
    func contrastIf(_ condition: Bool, _ amount: Double) -> some View {
        contrast(condition ? amount : 1)
    }
    
    func contrastIfNot(_ condition: Bool, _ amount: Double) -> some View {
        contrastIf(!condition, amount)
    }
      
    func grayscaleIf(_ condition: Bool, _ amount: Double) -> some View {
        grayscale(condition ? amount : 0)
    }
      
    func grayscaleIfNot(_ condition: Bool, _ amount: Double) -> some View {
        grayscaleIf(!condition, amount)
    }
}

// MARK: ----- FOREGROUND

public extension View {
    
    @ViewBuilder func foregroundColorIf(_ condition: Bool, _ color: @autoclosure () -> Color) -> some View {
        if condition {
            foregroundColor(color())
        } else {
            self
        }
    }
    
    func foregroundColorIfNot(_ condition: Bool, _ color: Color) -> some View {
        foregroundColorIf(!condition, color)
    }
    
    func foregroundColorIf(_ condition: Bool, _ colorName: String) -> some View {
        foregroundColorIf(condition, Color(colorName))
    }
    
    func foregroundColorIfNot(_ condition: Bool, _ colorName: String) -> some View {
        foregroundColorIfNot(condition, Color(colorName))
    }
}

// MARK: ----- BACKGROUND

public extension View {
    
    @ViewBuilder func backgroundIf<T: View>(_ condition: Bool, _ content: T, alignment: Alignment = .center) -> some View {
        if condition {
            self.background(content, alignment: alignment)
        } else {
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
    
    func backgroundColorIf(_ condition: Bool, _ colorName: String, alignment: Alignment = .center) -> some View {
        backgroundColorIf(condition, Color(colorName), alignment: alignment)
    }
    
    func backgroundColorIfNot(_ condition: Bool, _ colorName: String, alignment: Alignment = .center) -> some View {
        backgroundColorIfNot(condition, Color(colorName), alignment: alignment)
    }
}

// MARK: ----- OVERLAY

public extension View {
    
    @ViewBuilder func overlayIf<T: View>(_ condition: Bool, _ content: T, alignment: Alignment = .center) -> some View {
        if condition {
            self.overlay(content, alignment: alignment)
        } else {
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
        
    func overlayColorIf(_ condition: Bool, _ colorName: String, alignment: Alignment = .center) -> some View {
        overlayColorIf(condition, Color(colorName), alignment: alignment)
    }
    
    func overlayColorIfNot(_ condition: Bool, _ colorName: String, alignment: Alignment = .center) -> some View {
        overlayColorIfNot(condition, Color(colorName), alignment: alignment)
    }
}

// MARK: ----- BORDER

public extension View {
    
    @ViewBuilder func borderIf<SS: ShapeStyle>(_ condition: Bool, _ shapeStyle: SS) -> some View {
        if condition {
            self.border(shapeStyle)
        } else {
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
    
    func borderColorIf(_ condition: Bool, _ colorName: String) -> some View {
        borderColorIf(condition, Color(colorName))
    }
    
    func borderColorIfNot(_ condition: Bool, _ colorName: String) -> some View {
        borderColorIfNot(condition, Color(colorName))
    }
    
    // with width
    @ViewBuilder func borderIf<SS: ShapeStyle>(_ condition: Bool, _ shapeStyle: SS, width: CGFloat) -> some View {
        if condition {
            self.border(shapeStyle, width: width)
        } else {
            self
        }
    }
    
    func borderIfNot<SS: ShapeStyle>(_ condition: Bool, _ shapeStyle: SS, width: CGFloat) -> some View {
        borderIf(!condition, shapeStyle, width: width)
    }
    
    func borderIf(_ condition: Bool, _ color: Color, width: CGFloat) -> some View {
        border(condition ? color : Color.clear, width: width)
    }
    
    func borderIfNot(_ condition: Bool, _ color: Color, width: CGFloat) -> some View {
        borderIf(!condition, color, width: width)
    }
    
    func borderColorIf(_ condition: Bool, _ color: Color, width: CGFloat) -> some View {
        borderIf(condition, color, width: width)
    }
    
    func borderColorIfNot(_ condition: Bool, _ color: Color, width: CGFloat) -> some View {
        borderIf(!condition, color, width: width)
    }
    
    func borderColorIf(_ condition: Bool, _ colorName: String, width: CGFloat) -> some View {
        borderColorIf(condition, Color(colorName), width: width)
    }
    
    func borderColorIfNot(_ condition: Bool, _ colorName: String, width: CGFloat) -> some View {
        borderColorIfNot(condition, Color(colorName), width: width)
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

public let PS_DEFAULT_SCALE_SIZE = CGSize(1, 1)

public extension View {
    
    func scaleIf(_ condition: Bool, _ scale: CGFloat, anchor: UnitPoint = .center) -> some View {
        self.scaleEffect(condition ? scale : 1, anchor: anchor)
    }
    
    func scaleIfNot(_ condition: Bool, _ scale: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleIf(!condition, scale)
    }
    
    func scaleIf(_ condition: Bool, _ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleIf(condition, CGSize(scaleX, scaleY), anchor: anchor)
    }
    
    func scaleIfNot(_ condition: Bool, _ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleIf(!condition, scaleX, scaleY, anchor: anchor)
    }
    
    func scaleIf(_ condition: Bool, _ scale: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleEffect(condition ? scale : PS_DEFAULT_SCALE_SIZE, anchor: anchor)
    }
    
    func scaleIfNot(_ condition: Bool, _ scale: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleIf(!condition, scale, anchor: anchor)
    }
    
    func xScaleIf(_ condition: Bool, _ scaleX: CGFloat, anchor: UnitPoint = .center) -> some View {
        xScale(condition ? scaleX : 1, anchor: anchor)
    }
    
    func xScaleIfNot(_ condition: Bool, _ scaleX: CGFloat, anchor: UnitPoint = .center) -> some View {
        xScaleIf(!condition, scaleX, anchor: anchor)
    }
    
    func yScaleIf(_ condition: Bool, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        yScale(condition ? scaleY : 1, anchor: anchor)
    }

    func yScaleIfNot(_ condition: Bool, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        yScaleIf(!condition, scaleY, anchor: anchor)
    }
}

// MARK: - ----- CONDITIONAL SHADOW

public extension View {
    
    @ViewBuilder func shadowIf(_ condition: Bool, color: Color? = nil, radius: CGFloat = 0, x: CGFloat = 0, y: CGFloat = 0) -> some View {
        if color != nil {
            self.shadow(color: color!, radius: condition ? radius : 0, x: condition ? x : 0, y: condition ? y : 0)
        } else {
            self.shadow(radius: condition ? radius : 0, x: condition ? x : 0, y: condition ? y : 0)
        }
    }
    
    func shadowIfNot(_ condition: Bool, color: Color? = nil, radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> some View {
        shadowIf(!condition, color: color, radius: radius, x: x, y: y)
    }
    
    func shadowIf(_ condition: Bool, color: Color? = nil, radius: CGFloat, offset: CGPoint) -> some View {
        shadowIf(condition, color: color, radius: radius, x: offset.x, y: offset.y)
    }
    
    func shadowIfNot(_ condition: Bool, color: Color? = nil, radius: CGFloat, offset: CGPoint) -> some View {
        shadowIfNot(condition, color: color, radius: radius, x: offset.x, y: offset.y)
    }
    
    func shadowIf(_ condition: Bool, color: Color? = nil, radius: CGFloat, offset: CGFloat, angle: Angle) -> some View {
        shadowIf(condition, color: color, radius: radius, offset: .point(offset, angle))
    }
    
    func shadowIfNot(_ condition: Bool, color: Color? = nil, radius: CGFloat, offset: CGFloat, angle: Angle) -> some View {
        shadowIfNot(condition, color: color, radius: radius, offset: .point(offset, angle))
    }
}

// MARK: - ----- CONDITIONAL CONTENT SHAPE

public extension View {
    
    @ViewBuilder func contentShapeIf<S: Shape>(_ condition: Bool, _ shape: S) -> some View {
        if condition {
            self.contentShape(shape)
        } else {
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
    
    func animationIfNot(_ condition: Bool, _ theAnimation: Animation? = .default) -> some View {
        animationIf(!condition, theAnimation)
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

// MARK: ----- Z-INDEX

public extension View {
    
    func zIndexIf(_ condition: Bool, _ index: Double) -> some View {
        zIndex(condition ? index : 0)
    }
    
    func zIndexIfNot(_ condition: Bool, _ index: Double) -> some View {
        zIndexIf(!condition, index)
    }
}

// MARK: ----- ENVIRONMENT

public extension View {
    
    func envDarkModeIf(_ condition: Bool) -> some View {
        environment(\.colorScheme, condition ? .dark : .light)
    }
    
    func envDarkModeIfNot(_ condition: Bool) -> some View {
        envDarkModeIf(!condition)
    }

    func envLightModeIf(_ condition: Bool) -> some View {
        envDarkModeIf(!condition)
    }
    
    func envLightModeIfNot(_ condition: Bool) -> some View {
        envLightModeIf(!condition)
    }
    
    @ViewBuilder func envColorSchemeIf(_ condition: Bool, _ colorScheme: ColorScheme) -> some View {
        if condition {
            self.environment(\.colorScheme, colorScheme)
        } else {
            self
        }
    }
    
    func envColorSchemeIfNot(_ condition: Bool, _ colorScheme: ColorScheme) -> some View {
        envColorSchemeIf(!condition, colorScheme)
    }
}

// MARK: ----- RELATIVE OFFSET

public extension View {
    
    func relativeXOffsetIf(_ condition: Bool, _ xOffset: CGFloat) -> some View {
        modifier(RelativeOffsetViewModifier(condition: condition, relativeOffsetForSizeProvider: RelativeXOffsetProvider(relativeXOffset: xOffset)))
    }
    
    func relativeXOffsetIfNot(_ condition: Bool, _ xOffset: CGFloat) -> some View {
        relativeXOffsetIf(!condition, xOffset)
    }
    
    func relativeYOffsetIf(_ condition: Bool, _ yOffset: CGFloat) -> some View {
        modifier(RelativeOffsetViewModifier(condition: condition, relativeOffsetForSizeProvider: RelativeYOffsetProvider(relativeYOffset: yOffset)))
    }
    
    func relativeYOffsetIfNot(_ condition: Bool, _ yOffset: CGFloat) -> some View {
        relativeYOffsetIf(!condition, yOffset)
    }
    
    func relativeOffsetIf(_ condition: Bool, _ xOffset: CGFloat, _ yOffset: CGFloat) -> some View {
        modifier(RelativeOffsetViewModifier(condition: condition, relativeOffsetForSizeProvider: RelativeOffsetProvider(relativeOffset: CGPoint(xOffset, yOffset))))
    }
    
    func relativeOffsetIfNot(_ condition: Bool, _ xOffset: CGFloat, _ yOffset: CGFloat) -> some View {
        relativeOffsetIf(!condition, xOffset, yOffset)
    }
}

// MARK: ----- OFFSET TO POSITION

public extension View {
    
    func offsetToPositionIf(_ condition: Bool, _ position: CGPoint, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        modifier(OffsetToPositionViewModifier(
            condition: condition,
            relativeTo: position,
            coordinateSpace: coordinateSpace,
            anchor: anchor,
            offsetForPositionProvider: OffsetPositionProvider()))
    }

    func offsetToPositionIfNot(_ condition: Bool, _ position: CGPoint, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(!condition, position, in: coordinateSpace, anchor: anchor)
    }
    
    func offsetToPositionIf<TC: Hashable>(_ condition: Bool, _ position: CGPoint, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(condition, position, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    func offsetToPositionIfNot<TC: Hashable>(_ condition: Bool, _ position: CGPoint, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(!condition, position, in: coordinateSpaceName, anchor: anchor)
    }
    
    func offsetToPositionIf(_ condition: Bool, _ xPosition: CGFloat, _ yPosition: CGFloat, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(condition, CGPoint(xPosition, yPosition), in: coordinateSpace, anchor: anchor)
    }

    func offsetToPositionIfNot(_ condition: Bool, _ xPosition: CGFloat, _ yPosition: CGFloat, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(!condition, xPosition, yPosition, in: coordinateSpace, anchor: anchor)
    }

    func offsetToPositionIf<TC: Hashable>(_ condition: Bool, _ xPosition: CGFloat, _ yPosition: CGFloat, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(condition, xPosition, yPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    func offsetToPositionIfNot<TC: Hashable>(_ condition: Bool, _ xPosition: CGFloat, _ yPosition: CGFloat, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(!condition, xPosition, yPosition, in: coordinateSpaceName, anchor: anchor)
    }

    func xOffsetToXPositionIf(_ condition: Bool, _ xPosition: CGFloat, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        modifier(OffsetToPositionViewModifier(condition: condition, relativeTo: .init(xPosition, 0), coordinateSpace: coordinateSpace, anchor: anchor, offsetForPositionProvider: XOffsetPositionProvider()))
    }
    
    func xOffsetToXPositionIfNot(_ condition: Bool, _ xPosition: CGFloat, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        xOffsetToXPositionIf(!condition, xPosition, in: coordinateSpace, anchor: anchor)
    }
    
    func xOffsetToXPositionIf<TC: Hashable>(_ condition: Bool, _ xPosition: CGFloat, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        xOffsetToXPositionIf(condition, xPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    func xOffsetToXPositionIfNot<TC: Hashable>(_ condition: Bool, _ xPosition: CGFloat, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        xOffsetToXPositionIf(!condition, xPosition, in: coordinateSpaceName, anchor: anchor)
    }
    
    func yOffsetToYPositionIf(_ condition: Bool, _ yPosition: CGFloat, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        modifier(OffsetToPositionViewModifier(condition: condition, relativeTo: .init(0, yPosition), coordinateSpace: coordinateSpace, anchor: anchor, offsetForPositionProvider: YOffsetPositionProvider()))
    }
    
    func yOffsetToYPositionIfNot(_ condition: Bool, _ yPosition: CGFloat, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPositionIf(!condition, yPosition, in: coordinateSpace, anchor: anchor)
    }
    
    func yOffsetToYPositionIf<TC: Hashable>(_ condition: Bool, _ yPosition: CGFloat, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPositionIf(condition, yPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    func yOffsetToYPositionIfNot<TC: Hashable>(_ condition: Bool, _ yPosition: CGFloat, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPositionIf(!condition, yPosition, in: coordinateSpaceName, anchor: anchor)
    }
}
