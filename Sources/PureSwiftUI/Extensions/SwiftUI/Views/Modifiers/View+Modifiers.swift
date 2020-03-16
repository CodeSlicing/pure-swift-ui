//
//  View+.swift
//
//
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: - ----- TYPE ERASURE

public extension View {

    var asAnyView: AnyView {
        AnyView(self)
    }
}

// MARK: ----- FOREGROUND

public extension View {
    
    func foregroundColor(_ colorName: String) -> some View {
        foregroundColor(Color(colorName))
    }
}

// MARK: - ----- BACKGROUND

public extension View {
    
    func backgroundColor(_ color: Color,  alignment: Alignment = .center) -> some View {
        background(color, alignment: alignment)
    }
    
    func backgroundColor(_ colorName: String,  alignment: Alignment = .center) -> some View {
        background(Color(colorName), alignment: alignment)
    }
}

// MARK: ----- OVERLAY

public extension View {
    
    func overlayColor(_ colorName: String, alignment: Alignment = .center) -> some View {
        overlay(Color(colorName), alignment: alignment)
    }
    
    func overlayColor(_ color: Color, alignment: Alignment = .center) -> some View {
        overlay(color, alignment: alignment)
    }
}

// MARK: - ----- BORDER

public extension View {
    
    func borderColor(_ color: Color) -> some View {
        border(color)
    }
    
    func borderColor(_ colorName: String) -> some View {
        borderColor(Color(colorName))
    }
    
    func borderColor<T: UINumericType>(_ color: Color, width: T) -> some View {
        border(color, width: width.asCGFloat)
    }
    
    func borderColor<T: UINumericType>(_ colorName: String, width: T) -> some View {
        borderColor(Color(colorName), width: width)
    }
}

// MARK: - ----- FONT

public extension View {
    
    func fontSize<T: UINumericType>(_ size: T, weight: Font.Weight? = nil, withScaling: Bool = true) -> some View {
        fontSize(size, name: nil, weight: weight, withScaling: withScaling)
    }
    
    func fontSize<T: UINumericType>(_ size: T, name: String? = nil, weight: Font.Weight? = nil, withScaling: Bool = true) -> some View {
        RenderIf(withScaling) {
            self.scalingFont(size: size, name: name, weight: weight)
        }.elseRender {
            self.font(self.createFont(name: name, size: size.asCGFloat, weight: weight))
        }
    }
    
    private func createFont(name: String?, size: CGFloat, weight: Font.Weight?) -> Font {
        if let name = name {
            if let weight = weight {
                return Font.custom(name, size: size).weight(weight)
            } else {
                return Font.custom(name, size: size)
            }
        } else {
            if let weight = weight {
                return Font.system(size: size).weight(weight)
            } else {
                return Font.system(size: size)
            }
        }
    }
  
    private func applyInternalFont(_ theFont: Font, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        RenderIf(weight != nil) {
            self.font(theFont.weight(weight!))
        }.elseRender {
            self.font(theFont)
        }
        .foregroundColor(color)
    }
    
    // BODY
    
    func bodyFont() -> some View {
        bodyFont(nil, nil)
    }
    
    func bodyFont(_ weight: Font.Weight? = nil) -> some View {
        bodyFont(nil, weight)
    }

    func bodyFont(_ color: Color? = nil) -> some View {
        bodyFont(color, nil)
    }

    func bodyFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.body, color, weight)
    }
    
    // CAPTION
    
    func captionFont() -> some View {
        captionFont(nil, nil)
    }
    
    func captionFont(_ weight: Font.Weight? = nil) -> some View {
        captionFont(nil, weight)
    }

    func captionFont(_ color: Color? = nil) -> some View {
        captionFont(color, nil)
    }

    func captionFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.caption, color, weight)
    }
    
    // CALLOUT
    
    func calloutFont() -> some View {
        calloutFont(nil, nil)
    }
    
    func calloutFont(_ weight: Font.Weight? = nil) -> some View {
        calloutFont(nil, weight)
    }

    func calloutFont(_ color: Color? = nil) -> some View {
        calloutFont(color, nil)
    }

    func calloutFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.callout, color, weight)
    }
    
    // CUSTOM
    
    func customFont<T: UINumericType>(_ name: String, _ size: T) -> some View {
        customFont(name, size, nil, nil)
    }
    
    func customFont<T: UINumericType>(_ name: String, _ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFont(name, size, nil, weight)
    }

    func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil) -> some View {
        customFont(name, size, color, nil)
    }

    func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.custom(name, size: size.asCGFloat), color, weight)
    }
    
    // CUSTOM WITH JUST SIZE
    
    func customFont<T: UINumericType>(_ size: T) -> some View {
        customFont(size, nil, nil)
    }
    
    func customFont<T: UINumericType>(_ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFont(size, nil, weight)
    }

    func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil) -> some View {
        customFont(size, color, nil)
    }

    func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.system(size: size.asCGFloat), color, weight)
    }
    
    // CUSTOM FONT THAT SCALES
    
    func customFontThatScales<T: UINumericType>(_ name: String, _ size: T) -> some View {
        customFontThatScales(name, size, nil, nil)
    }
    
    func customFontThatScales<T: UINumericType>(_ name: String, _ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFontThatScales(name, size, nil, weight)
    }

    func customFontThatScales<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil) -> some View {
        customFontThatScales(name, size, color, nil)
    }

    func customFontThatScales<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        fontSize(size, name: name, weight: weight)
            .foregroundColor(color)
    }
    
    // CUSTOM WITH JUST SIZE
    
    func customFontThatScales<T: UINumericType>(_ size: T) -> some View {
        customFontThatScales(size, nil, nil)
    }
    
    func customFontThatScales<T: UINumericType>(_ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFontThatScales(size, nil, weight)
    }

    func customFontThatScales<T: UINumericType>(_ size: T, _ color: Color? = nil) -> some View {
        customFontThatScales(size, color, nil)
    }

    func customFontThatScales<T: UINumericType>(_ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        fontSize(size, weight: weight)
            .foregroundColor(color)
    }
    
    // FOOTNOTE
    
    func footnoteFont() -> some View {
        footnoteFont(nil, nil)
    }
    
    func footnoteFont(_ weight: Font.Weight? = nil) -> some View {
        footnoteFont(nil, weight)
    }

    func footnoteFont(_ color: Color? = nil) -> some View {
        footnoteFont(color, nil)
    }

    func footnoteFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.footnote, color, weight)
    }
    
    // HEADLINE
    
    func headlineFont() -> some View {
        headlineFont(nil, nil)
    }
    
    func headlineFont(_ weight: Font.Weight? = nil) -> some View {
        headlineFont(nil, weight)
    }

    func headlineFont(_ color: Color? = nil) -> some View {
        headlineFont(color, nil)
    }

    func headlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.headline, color, weight)
    }
    
    // LARGETITLE
    
    func largeTitleFont() -> some View {
        largeTitleFont(nil, nil)
    }
    
    func largeTitleFont(_ weight: Font.Weight? = nil) -> some View {
        largeTitleFont(nil, weight)
    }

    func largeTitleFont(_ color: Color? = nil) -> some View {
        largeTitleFont(color, nil)
    }

    func largeTitleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.largeTitle, color, weight)
    }
    
    // SUBHEADLINE
    
    func subheadlineFont() -> some View {
        subheadlineFont(nil, nil)
    }
    
    func subheadlineFont(_ weight: Font.Weight? = nil) -> some View {
        subheadlineFont(nil, weight)
    }

    func subheadlineFont(_ color: Color? = nil) -> some View {
        subheadlineFont(color, nil)
    }

    func subheadlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.subheadline, color, weight)
    }

    // TITLE
    
    func titleFont() -> some View {
        titleFont(nil, nil)
    }
    
    func titleFont(_ weight: Font.Weight? = nil) -> some View {
        titleFont(nil, weight)
    }

    func titleFont(_ color: Color? = nil) -> some View {
        titleFont(color, nil)
    }

    func titleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.title, color, weight)
    }
}

// MARK: - ----- FRAME

public extension View {

    func width<T: UINumericType>(_ width: T, _ alignment: Alignment = .center) -> some View {
        frame(width: width.asCGFloat, alignment: alignment)
    }
  
    func height<T: UINumericType>(_ height: T, _ alignment: Alignment = .center) -> some View {
        frame(height: height.asCGFloat, alignment: alignment)
    }
    
    func frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ alignment: Alignment = .center) -> some View {
        frame(width: width.asCGFloat, height: height.asCGFloat, alignment: alignment)
    }
    
    func frame<T: UINumericType>(_ size: T, _ alignment: Alignment = .center) -> some View {
        frame(width: size.asCGFloat, height: size.asCGFloat, alignment: alignment)
    }
    
    // native type
    func frame(_ size: CGSize, _ alignment: Alignment = .center) -> some View {
        frame(width: size.width, height: size.height, alignment: alignment)
    }
    
    func width(_ width: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: width, alignment: alignment)
    }

    func height(_ height: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(height: height, alignment: alignment)
    }

    func frame(_ width: CGFloat, _ height: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: width, height: height, alignment: alignment)
    }

    func frame(_ size: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: size, height: size, alignment: alignment)
    }
    
    //other
    func greedyWidth(_ alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func greedyHeight(_ alignment: Alignment = .center) -> some View {
        frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func greedyFrame(_ alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

// MARK: - ----- OFFSET

public extension View {
    
    func offset<T_LHS: UINumericType, T_RHS: UINumericType>(_ x: T_LHS, _ y: T_RHS) -> some View {
        offset(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    func xOffset<T: UINumericType>(_ x: T) -> some View {
        offset(x: x.asCGFloat)
    }

    func yOffset<T: UINumericType>(_ y: T) -> some View {
        offset(y: y.asCGFloat)
    }
    
    //native
    func offset(_ x: CGFloat, _ y: CGFloat) -> some View {
        offset(x: x, y: y)
    }

    func xOffset(_ x: CGFloat) -> some View {
        offset(x: x)
    }

    func yOffset(_ y: CGFloat) -> some View {
        offset(y: y)
    }
    
    func offset(_ point: CGPoint) -> some View {
        offset(x: point.x, y: point.y)
    }
}

// MARK: ----- POSITION

public extension View {
    
    func position<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> some View {
        position(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "position", message: "Can't set x or y positions individually since the underlying implementation defaults to 0 for the other dimension")
    func xPosition<T: UINumericType>(_ x: T) -> some View {
        position(x: x.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "position", message: "Can't set x or y positions individually since the underlying implementation defaults to 0 for the other dimension")
    func yPosition<T: UINumericType>(_ y: T) -> some View {
        position(y: y.asCGFloat)
    }
}

// MARK: - ----- OPACITY

public extension View {

    func opacity<T: UINumericType>(_ theOpacity: T) -> some View {
        opacity(theOpacity.asDouble)
    }
}

// MARK: ----- BLUR

public extension View {

    func blur<T: UINumericType>(_ radius: T, opaque: Bool = false) -> some View {
        blur(radius: radius.asCGFloat, opaque: opaque)
    }
}

// MARK: ----- IMAGE PROCESSING

public extension View {
 
    func saturation<T: UINumericType>(_ amount: T) -> some View {
        saturation(amount.asDouble)
    }
    
    func brightness<T: UINumericType>(_ amount: T) -> some View {
        brightness(amount.asDouble)
    }
    
    func contrast<T: UINumericType>(_ amount: T) -> some View {
        contrast(amount.asDouble)
    }
    
    func grayscale<T: UINumericType>(_ amount: T) -> some View {
        grayscale(amount.asDouble)
    }
}

// MARK: ----- SHADOW

public extension View {
    
    func shadow<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ radius: T, x: TX, y: TY) -> some View {
        shadow(radius: radius.asCGFloat, x: x.asCGFloat, y: y.asCGFloat)
    }
    
    func shadow<T: UINumericType>(_ radius: T) -> some View {
        shadow(radius, x: 0, y: 0)
    }
    
    func shadow<T: UINumericType, TX: UINumericType>(_ radius: T, x: TX) -> some View {
        shadow(radius, x: x, y: 0)
    }
    
    func shadow<T: UINumericType, TY: UINumericType>(_ radius: T, y: TY) -> some View {
        shadow(radius, x: 0, y: y)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    func shadow<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, x: TX, y: TY) -> some View {
        shadow(color: color, radius: radius.asCGFloat, x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    func shadow<T: UINumericType>(_ color: Color, _ radius: T) -> some View {
        shadow(color, radius, x: 0, y: 0)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    func shadow<T: UINumericType, TX: UINumericType>(_ color: Color, _ radius: T, x: TX) -> some View {
        shadow(color, radius, x: x, y: 0)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    func shadow<T: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, y: TY) -> some View {
        shadow(color, radius, x: 0, y: y)
    }
    
    func shadowColor<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, x: TX, y: TY) -> some View {
        shadow(color: color, radius: radius.asCGFloat, x: x.asCGFloat, y: y.asCGFloat)
    }
    
    func shadowColor<T: UINumericType>(_ color: Color, _ radius: T) -> some View {
        shadowColor(color, radius, x: 0, y: 0)
    }
    
    func shadowColor<T: UINumericType, TX: UINumericType>(_ color: Color, _ radius: T, x: TX) -> some View {
        shadowColor(color, radius, x: x, y: 0)
    }
    
    func shadowColor<T: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, y: TY) -> some View {
        shadowColor(color, radius, x: 0, y: y)
    }
    
    func shadowColor<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ colorName: String, _ radius: T, x: TX, y: TY) -> some View {
        shadowColor(Color(colorName), radius, x: x, y: y)
    }
    
    func shadowColor<T: UINumericType>(_ colorName: String, _ radius: T) -> some View {
        shadowColor(colorName, radius, x: 0, y: 0)
    }
    
    func shadowColor<T: UINumericType, TX: UINumericType>(_ colorName: String, _ radius: T, x: TX) -> some View {
        shadowColor(colorName, radius, x: x, y: 0)
    }
    
    func shadowColor<T: UINumericType, TY: UINumericType>(_ colorName: String, _ radius: T, y: TY) -> some View {
        shadowColor(colorName, radius, x: 0, y: y)
    }}

// MARK: ------ PADDING

public extension View {

    func hPadding() -> some View {
        padding(.horizontal)
    }

    func vPadding() -> some View {
        padding(.vertical)
    }

    func hPadding<T: UINumericType>(_ horizontalPadding: T) -> some View {
        padding(.horizontal, horizontalPadding.asCGFloat)
    }
    
    func vPadding<T: UINumericType>(_ verticalPadding: T) -> some View {
        padding(.vertical, verticalPadding.asCGFloat)
    }
    
    //native
    func hPadding(_ horizontalPadding: CGFloat) -> some View {
        padding(.horizontal, horizontalPadding)
    }
    
    func vPadding(_ verticalPadding: CGFloat) -> some View {
        padding(.vertical, verticalPadding)
    }
}

// MARK: - ----- ROTATION

public extension View {

    func rotate(_ angle: Angle, anchor: UnitPoint = .center) -> some View {
        rotationEffect(angle, anchor: anchor)
    }
    
    func rotate3D(_ angle: Angle, _ axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        rotation3DEffect(angle, axis: axis, anchor: anchor, anchorZ: anchorZ, perspective: perspective)
    }
}

// MARK: - ----- SCALE

public extension View {

    func scale<T: UINumericType>(_ scaleFactor: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleFactor.asCGFloat, anchor: anchor)
    }
    
    func scale<TX: UINumericType, TY: UINumericType>(_ scaleX: TX, _ scaleY: TY, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX.asCGFloat, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    func xScale<T: UINumericType>(_ scaleX: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX.asCGFloat, y: 1, anchor: anchor)
    }
    
    func yScale<T: UINumericType>(_ scaleY: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: 1, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    //native
    func scale(_ scaleFactor: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleFactor, anchor: anchor)
    }
    
    func scale(_ scaleSize: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleSize, anchor: anchor)
    }
    
    func scale(_ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX, y: scaleY, anchor: anchor)
    }
    
    func xScale(_ scaleX: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX, y: 1, anchor: anchor)
    }
    
    func yScale(_ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: 1, y: scaleY, anchor: anchor)
    }
}

// MARK: ----- Z-INDEX

public extension View {
    
    func zIndex<T: UINumericType>(_ index: T) -> some View {
        zIndex(index.asDouble)
    }
}

// MARK: ----- ENVIRONMENT

public extension View {
    
    func envDarkMode() -> some View {
        environment(\.colorScheme, .dark)
    }

    func envLightMode() -> some View {
        environment(\.colorScheme, .light)
    }
    
    func envColorScheme(_ scheme: ColorScheme) -> some View {
        environment(\.colorScheme, scheme)
    }
}

// MARK: ----- GEOMETRY READER

public extension View {
    
    func geometryReader(_ geoCallback: @escaping (GeometryProxy) -> ()) -> some View {
        geometryReader(id: 1, geoCallback)
    }
    
    func geometryReader<T: Hashable>(id: T, _ geoCallback: @escaping (GeometryProxy) -> ()) -> some View {
        overlay(GeometryReader { (geo: GeometryProxy) in
            Color.clear.onAppear {
                geoCallback(geo)
            }
            .id(id)
        })
    }
}

// MARK: ----- RELATIVE OFFSET

public extension View {
    
    func relativeXOffset<T: UINumericType>(_ xOffset: T) -> some View {
        relativeXOffsetIf(true, xOffset)
    }
    
    func relativeYOffset<T: UINumericType>(_ yOffset: T) -> some View {
        relativeYOffsetIf(true, yOffset)
    }
    
    func relativeOffset<TX: UINumericType, TY: UINumericType>(_ xOffset: TX, _ yOffset: TY) -> some View {
        relativeOffsetIf(true, xOffset, yOffset)
    }
}

// MARK: ----- OFFSET TO POSITION

public extension View {

    /**
    Offsets the view to an absolute position within the specified coordinate space.
     - Parameters:
       - xPosition: required xPosition within coordinate space
       - yPosition: required yPosition within coordinate space
       - coordinateSpace: Coordinate space in which to perform the offset
       - anchor: where to anchor the view being offset
     - Warning:
     If you need to specify a named CoordinateSpace, use the method that takes
     coordinateSpaceName as a String parameter rather than passing .named(...). There is a runtime
     issue if you try to use .named(coordinateSpace) at the call-site.
    */
    func offsetToPosition<TX: UINumericType, TY: UINumericType>(_ xPosition: TX, _ yPosition: TY, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(true, xPosition, yPosition, in: coordinateSpace,
        anchor: anchor)
    }
    
    func offsetToPosition<TX: UINumericType, TY: UINumericType, TC: Hashable>(_ xPosition: TX, _ yPosition: TY, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPosition(xPosition, yPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }

    func offsetToPosition(_ position: CGPoint, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(true, position, in: coordinateSpace,
        anchor: anchor)
    }
    
    func offsetToPosition<TC: Hashable>(_ position: CGPoint, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPosition(position, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    func xOffsetToXPosition<T: UINumericType>(_ xPosition: T, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        xOffsetToXPositionIf(true, xPosition, in: coordinateSpace, anchor: anchor)
    }

    func xOffsetToXPosition<T: UINumericType, TC: Hashable>(_ xPosition: T, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
         xOffsetToXPosition(xPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    func yOffsetToYPosition<T: UINumericType>(_ yPosition: T, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPositionIf(true, yPosition, in: coordinateSpace,
        anchor: anchor)
    }
    
    func yOffsetToYPosition<T: UINumericType, TC: Hashable>(_ yPosition: T, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPosition(yPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
}

// MARK: ----- OFFSET WITH ANGLE

public extension View {
    
    func offsetFromAngle(baseRotation: Angle, offsetAngle: Angle, forRadius radius: Double) -> some View {
        offset(x: calcXOffset(radius: radius, angle: baseRotation + offsetAngle), y: -calcYOffset(radius: radius, angle: baseRotation + offsetAngle))
    }
    
    func offset<T: UINumericType>(radius: T, angle: Angle) -> some View {
        offset(calcOffset(radius: radius, angle: angle))
    }
}
