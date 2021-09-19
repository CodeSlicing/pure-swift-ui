//
//  CGRect+Convenience.swift
//  
//
//  Created by Adam Fordyce on 11/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

// MARK: ----- INIT

public extension CGRect {
    
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(origin: CGPoint(x, y), size: CGSize(width, height))
    }
    
    init(_ size: CGSize) {
        self.init(size.width, size.height)
    }
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(0, 0, width, height)
    }

    init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin.x, origin.y, size.width, size.height)
    }
}

// MARK: ----- INIT WITH ANCHOR

public extension CGRect {
    
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat, anchor: UnitPoint) {
        let size = CGSize(width, height)
        self.init(origin: CGPoint(x, y).offset(in: size, anchor: anchor), size: CGSize(width, height))
    }
    
    init(_ size: CGSize, anchor: UnitPoint) {
        self.init(size.width, size.height, anchor: anchor)
    }
    
    init(_ width: CGFloat, _ height: CGFloat, anchor: UnitPoint) {
        self.init(0, 0, width, height, anchor: anchor)
    }

    init(_ origin: CGPoint, _ size: CGSize, anchor: UnitPoint) {
        self.init(origin.x, origin.y, size.width, size.height, anchor: anchor)
    }
}

// MARK: ----- INIT FROM POINT TO POINT

public extension CGRect {
    
    init(from: CGPoint, to: CGPoint) {
        let origin = CGPoint(min(from.x, to.x), min(from.y, to.y))
        let size = CGSize(abs(from.x - to.x), abs(from.y - to.y))
        self.init(origin, size)
    }
}

// MARK: ----- STATIC INITIALISER

public extension CGRect {
    
    static func rect(from: CGPoint, to: CGPoint) -> CGRect {
        .init(from: from, to: to)
    }
    
    static func rect(_ size: CGSize) -> CGRect {
        .init(.zero, size)
    }
    
    static func rect(_ origin: CGPoint, _ size: CGSize) -> CGRect {
        .init(origin, size)
    }

    static func rect(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        .init(x, y, width, height)
    }
}

// MARK: ----- PROPERTIES

public extension CGRect {

    var center: CGPoint {
        .init(halfWidth + origin.x, halfHeight + origin.y)
    }
    
    var topLeading: CGPoint {
        origin
    }
    
    var top: CGPoint {
        CGPoint(midX, minY)
    }
    
    var topTrailing: CGPoint {
        CGPoint(maxX, minY)
    }

    var leading: CGPoint {
        CGPoint(minX, midY)
    }
    
    var trailing: CGPoint {
        CGPoint(maxX, midY)
    }
    
    var bottomLeading: CGPoint {
        CGPoint(minX, maxY)
    }
    
    var bottom: CGPoint {
        CGPoint(midX, maxY)
    }
    
    var bottomTrailing: CGPoint {
        CGPoint(maxX, maxY)
    }

    /**
     alias for bottomTrailing
     */
    var extent: CGPoint {
        bottomTrailing
    }
    
    var halfWidth: CGFloat {
        size.halfWidth
    }
    
    var halfHeight: CGFloat {
        size.halfHeight
    }
    
    var minDimension: CGFloat {
        size.minDimension
    }

    var maxDimension: CGFloat {
        size.maxDimension
    }
    
    func clampedSize(min: CGFloat, max: CGFloat) -> CGSize {
        .init(self.width.clamped(min: min, max: max), self.height.clamped(min: min, max: max))
    }
    
    @available(*, deprecated, renamed: "clampedSize(min:max:)")
    func clampedSize(from: CGFloat, to: CGFloat) -> CGSize {
        .init(self.width.clamped(min: from, max: to), self.height.clamped(min: from, max: to))
    }
    
    func widthScaled(_ scale: CGFloat) -> CGFloat {
        width * scale
    }
    
    func heightScaled(_ scale: CGFloat) -> CGFloat {
        height * scale
    }
}

// MARK: ----- SCALED

public extension CGRect {

    func sizeScaled(_ scale: CGPoint) -> CGSize {
        CGSize(widthScaled(scale.x), heightScaled(scale.y))
    }
    
    func sizeScaled(_ scale: CGVector) -> CGSize {
        CGSize(widthScaled(scale.dx), heightScaled(scale.dy))
    }
    
    func sizeScaled(_ scale: CGSize) -> CGSize {
        CGSize(widthScaled(scale.width), heightScaled(scale.height))
    }
    
    func sizeScaled(_ scale: CGFloat) -> CGSize {
        CGSize(widthScaled(scale), heightScaled(scale))
    }
    
    func sizeScaled(_ xScale: CGFloat, _ yScale: CGFloat) -> CGSize {
        CGSize(widthScaled(xScale), heightScaled(yScale))
    }
}

// MARK: ----- RELATIVE

public extension CGRect {
    
    @available(*, deprecated, renamed: "relativeX")
    func xScaled(_ scale: CGFloat) -> CGFloat {
        minX + widthScaled(scale)
    }

    @available(*, deprecated, renamed: "relativeY")
    func yScaled(_ scale: CGFloat) -> CGFloat {
        minY + heightScaled(scale)
    }
    
    /**
     Creates a `CGFloat` relative to the x-coordinate space of the `CGRect` on which
     it is invoked.
     
     To be specific, for a `relativeX` parameter value of 0.5, the resulting value
     will be `rect.minX + 0.5 * rect.width`
     
     - Parameter relativeX: The relative x-coordinate of the required value
     */
    func relativeX(_ relativeX: CGFloat) -> CGFloat {
        minX + widthScaled(relativeX)
    }

    /**
     Creates a `CGFloat` relative to the y-coordinate space of the `CGRect` on which
     it is invoked.
     
     To be specific, for a `relativeY` parameter value of 0.5, the resulting value
     will be `rect.minY + 0.5 * rect.height`
     
     - Parameter relativeY: The relative y-coordinate of the required value
     */
    func relativeY(_ relativeY: CGFloat) -> CGFloat {
        minY + heightScaled(relativeY)
    }
    
    /**
     Obtains a `CGPoint` from a `CGRect` relative to the `CGRect` itself taking
     into account the origin.
     
     To be specific, for a `relativeX` paremeter value of 0.5, the resulting x-coordinate
     of the `CGPoint` will be `rect.minX + 0.5 * rect.width`.
     
     - Parameter relativeX: The relative position of the x-coordinate
     - Parameter relativeY: The relative position of the y-coordinate
     */
    subscript(relativeX: CGFloat, relativeY: CGFloat) -> CGPoint {
        CGPoint(self.relativeX(relativeX), self.relativeY(relativeY))
    }
}

// MARK: ----- INSET

public extension CGRect {
    
    func inset(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) -> CGRect {
        inset(by: UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing))
    }

    func inset(_ edges: Edge.Set, _ size: CGFloat) -> CGRect {
        inset(edges.inset(.top, size), edges.inset(.leading, size), edges.inset(.bottom, size), edges.inset(.trailing, size))
    }

    func insetTop(_ size: CGFloat) -> CGRect {
        inset(size, 0, 0, 0)
    }
    
    func insetLeading(_ size: CGFloat) -> CGRect {
        inset(0, size, 0, 0)
    }

    func insetBottom(_ size: CGFloat) -> CGRect {
        inset(0, 0, size, 0)
    }

    func insetTrailing(_ size: CGFloat) -> CGRect {
        inset(0, 0, 0, size)
    }

    func hInset(_ size: CGFloat) -> CGRect {
        inset(0, size, 0, size)
    }
    
    func vInset(_ size: CGFloat) -> CGRect {
        inset(size, 0, size, 0)
    }
    
    func inset(_ size: CGFloat) -> CGRect {
        inset(size, size, size, size)
    }
}

// MARK: ----- REGION

public extension CGRect {

    func scaled(_ scale: CGSize, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        CGRect(location, sizeScaled(scale), anchor: anchor)
    }

    func scaled(_ scale: CGFloat, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        scaled(.square(scale), at: location, anchor: anchor)
    }

    func xScaled(_ scale: CGFloat, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        scaled(CGSize(scale, 1), at: location, anchor: anchor)
    }

    func yScaled(_ scale:CGFloat, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        scaled(CGSize(1, scale), at: location, anchor: anchor)
    }
}

// MARK: ----- OFFSET

public extension CGRect {
    
    func offset(anchor: UnitPoint) -> CGRect {
        CGRect(self.origin.offset(in: size, anchor: anchor), size)
    }
    
    func offset(_ x: CGFloat, _ y: CGFloat) -> CGRect {
        offsetBy(dx: x, dy: y)
    }
    
    func offset(_ point: CGPoint) -> CGRect {
        offset(point.x, point.y)
    }
    
    func offset(_ point: CGSize) -> CGRect {
        offset(point.width, point.height)
    }
    
    func offset(_ point: CGVector) -> CGRect {
        offset(point.dx, point.dy)
    }

    func xOffset(_ x: CGFloat) -> CGRect {
        offset(x, 0)
    }

    func yOffset(_ y: CGFloat) -> CGRect {
        offset(0, y)
    }
}

// MARK: ----- OFFSET SCALED

public extension CGRect {
    
    func offset(anchor: UnitPoint, factor: CGFloat) -> CGRect {
        CGRect(self.origin.offset(in: size, anchor: anchor, factor: factor), size)
    }
    
    func offset(anchor: UnitPoint, factor: CGSize) -> CGRect {
        CGRect(self.origin.offset(in: size, anchor: anchor, factor: factor), size)
    }
    
    func offset(_ x: CGFloat, _ y: CGFloat, factor: CGFloat) -> CGRect {
        offset(x * factor, y * factor)
    }
    
    func offset(_ x: CGFloat, _ y: CGFloat, factor: CGSize) -> CGRect {
        offset(x * factor.x, y * factor.y)
    }
    
    func offset(_ point: CGPoint, factor: CGFloat) -> CGRect {
        offset(point.x, point.y, factor: factor)
    }
    
    func offset(_ point: CGPoint, factor: CGSize) -> CGRect {
        offset(point.x, point.y, factor: factor)
    }
    
    func offset(_ point: CGSize, factor: CGFloat) -> CGRect {
        offset(point.width, point.height, factor: factor)
    }
    
    func offset(_ point: CGSize, factor: CGSize) -> CGRect {
        offset(point.width, point.height, factor: factor)
    }
    
    func offset(_ point: CGVector, factor: CGFloat) -> CGRect {
        offset(point.dx, point.dy, factor: factor)
    }
    
    func offset(_ point: CGVector, factor: CGSize) -> CGRect {
        offset(point.dx, point.dy, factor: factor)
    }

    func xOffset(_ x: CGFloat, factor: CGFloat) -> CGRect {
        offset(x, 0, factor: factor)
    }

    func yOffset(_ y: CGFloat, factor: CGFloat) -> CGRect {
        offset(0, y, factor: factor)
    }
}

// MARK: ----- TO WITH FACTOR

public extension CGRect {

    func to(_ destination: CGRect, _ factor: CGFloat) -> CGRect {
        to(destination, .square(factor))
    }
    
    func to(_ destination: CGRect, _ factor: CGSize) -> CGRect {
        CGRect(
            from: origin.to(destination.origin, factor),
            to: bottomTrailing.to(destination.bottomTrailing, factor)
        )
    }
}
