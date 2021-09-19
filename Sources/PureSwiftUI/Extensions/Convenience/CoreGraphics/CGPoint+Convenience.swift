//
//  CGPoint+Convenience.swift
//  
//
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension CGPoint {
    
    init(_ size: CGFloat) {
        self.init(x: size, y: size)
    }
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
    
    var asCGRect: CGRect {
        CGRect(x, y)
    }
    
    var asCGPoint: CGPoint {
        self
    }

    var asCGVector: CGVector {
        CGVector(x, y)
    }
    
    var asCGSize: CGSize {
        CGSize(x, y)
    }
    
    var asUnitPoint: UnitPoint {
        UnitPoint(x, y)
    }
    
    var width: CGFloat {
        x
    }
    
    var height: CGFloat {
        y
    }
    
    var midX: CGFloat {
        x * 0.5
    }

    var midY: CGFloat {
        y * 0.5
    }
    
    var halfWidth: CGFloat {
        x * 0.5
    }
    
    var halfHeight: CGFloat {
        y * 0.5
    }

    var minDimension: CGFloat {
        min(x, y)
    }

    var maxDimension: CGFloat {
        max(x, y)
    }
    
    func scaled(_ scale: CGFloat) -> CGPoint {
        scaled(.square(scale))
    }
    
    func scaled(_ xScale: CGFloat, _ yScale: CGFloat) -> CGPoint {
        CGPoint(xScaled(xScale), yScaled(yScale))
    }
    
    func scaled(_ scale: CGSize) -> CGPoint {
        scaled(scale.width, scale.height)
    }
    
    func xScaled(_ scale: CGFloat) -> CGFloat {
        x * scale
    }
    
    func yScaled(_ scale: CGFloat) -> CGFloat {
        y * scale
    }
    
    func clamped(min: CGFloat, max: CGFloat) -> CGPoint {
        .init(self.x.clamped(min: min, max: max), self.y.clamped(min: min, max: max))
    }
    
    @available(*, deprecated, renamed: "clamped(min:max:)")
    func clamped(from: CGFloat, to: CGFloat) -> CGPoint {
        .init(self.x.clamped(min: from, max: to), self.y.clamped(min: from, max: to))
    }
}

// MARK: ----- STATIC INITIALISERS

public extension CGPoint {
    
    static func x(_ x: CGFloat) -> CGPoint {
        .init(x, 0)
    }
    
    static func y(_ y: CGFloat) -> CGPoint {
        .init(0, y)
    }
    
    static func point(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        .init(x, y)
    }
    
    static func point(_ size: CGFloat) -> CGPoint {
        .init(size)
    }
    
    static func point(_ radius: CGFloat, _ angle: Angle) -> CGPoint {
        calcOffset(radius: radius, angle: angle)
    }
}

// MARK: ----- OPERATOR OVERLOADS

public extension CGPoint {
    
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(lhs.x - rhs.x, lhs.y - rhs.y)
    }
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(lhs.x + rhs.x, lhs.y + rhs.y)
    }
}

// MARK: ----- OFFSET

public extension CGPoint {
    
    func offset(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        CGPoint(self.x + x, self.y + y)
    }
    
    func offset(_ offset: CGPoint) -> CGPoint {
        self.offset(offset.x, offset.y)
    }
    
    func offset(_ offset: CGVector) -> CGPoint {
        self.offset(offset.dx, offset.dy)
    }
    
    func offset(_ offset: CGSize) -> CGPoint {
        self.offset(offset.width, offset.height)
    }
    
    func xOffset(_ xOffset: CGFloat) -> CGPoint {
        offset(xOffset, 0)
    }
    
    func yOffset(_ yOffset: CGFloat) -> CGPoint {
        offset(0, yOffset)
    }
    
    func offset(radius: CGFloat, angle: Angle) -> CGPoint {
        return offset(calcOffset(radius: radius, angle: angle))
    }
}

// MARK: ----- OFFSET WITH FACTOR
public extension CGPoint {
    
    func offset(_ x: CGFloat, _ y: CGFloat, factor: CGFloat) -> CGPoint {
        return CGPoint(self.x + x * factor, self.y + y * factor)
    }
    
    func offset(_ offset: CGPoint, factor: CGFloat) -> CGPoint {
        self.offset(offset.x, offset.y, factor: factor)
    }
    
    func offset(_ offset: CGVector, factor: CGFloat) -> CGPoint {
        self.offset(offset.dx, offset.dy, factor: factor)
    }
    
    func offset(_ offset: CGSize, factor: CGFloat) -> CGPoint {
        self.offset(offset.width, offset.height, factor: factor)
    }
    
    func xOffset(_ xOffset: CGFloat, factor: CGFloat) -> CGPoint {
        offset(xOffset, 0, factor: factor)
    }
    
    func yOffset(_ yOffset: CGFloat, factor: CGFloat) -> CGPoint {
        offset(0, yOffset, factor: factor)
    }
    
    func offset(radius: CGFloat, angle: Angle, factor: CGFloat) -> CGPoint {
        return offset(calcOffset(radius: radius, angle: angle), factor: factor)
    }
}

// MARK: ----- TO WITH FACTOR

public extension CGPoint {

    func to(_ destination: CGPoint, _ factor: CGFloat) -> CGPoint {
        to(destination, .square(factor))
    }
    
    func to(_ destination: CGPoint, _ factor: CGSize) -> CGPoint {
        let deltaX = destination.x - self.x
        let deltaY = destination.y - self.y
        return CGPoint(self.x + deltaX * factor.x, self.y + deltaY * factor.y)
    }
}

// MARK: ----- UTILITIES

// MARK: ----- OFFSET ANCHOR

public extension CGPoint {

    private func getOffset(in size: CGSize, anchor: UnitPoint) -> CGPoint {
        switch anchor {
        case .topLeading, .zero:
            return CGPoint(0, 0)
        case .top:
            return CGPoint(-size.halfWidth, 0)
        case .topTrailing:
            return CGPoint(-size.width, 0)
        case .leading:
            return CGPoint(0, -size.halfHeight)
        case .center:
            return CGPoint(-size.halfWidth, -size.halfHeight)
        case .trailing:
            return CGPoint(-size.width, -size.halfHeight)
        case .bottomLeading:
            return CGPoint(0, -size.height)
        case .bottom:
            return CGPoint(-size.halfWidth, -size.height)
        case .bottomTrailing:
            return CGPoint(-size.width, -size.height)
        default:
            return CGPoint(-(anchor.x * size.width), -(anchor.y * size.height))
        }
    }
    
    func offset(in size: CGSize, anchor: UnitPoint) -> CGPoint {
        self.offset(getOffset(in: size, anchor: anchor))
    }
    
    func offset(in point: CGPoint, anchor: UnitPoint) -> CGPoint {
        self.offset(in: point.asCGSize, anchor: anchor)
    }
    
    func offset(in vector: CGVector, anchor: UnitPoint) -> CGPoint {
        self.offset(in: vector.asCGSize, anchor: anchor)
    }
    
    func calcPoint(length: CGFloat, angle: Angle) -> CGPoint {
        let offset = calcOffset(radius: length, angle: angle)
        return CGPoint(self.x + offset.x, self.y + offset.y)
    }
}

// MARK: ----- OFFSET ANCHOR WITH FACTOR

public extension CGPoint {
    
    func offset(in size: CGSize, anchor: UnitPoint, factor: CGFloat) -> CGPoint {
        self.offset(getOffset(in: size, anchor: anchor).scaled(factor))
    }
    
    func offset(in offset: CGPoint, anchor: UnitPoint, factor: CGFloat) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor, factor: factor)
    }
    
    func offset(in offset: CGVector, anchor: UnitPoint, factor: CGFloat) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor, factor: factor)
    }
    
    func calcPoint(length: CGFloat, angle: Angle, factor: CGFloat) -> CGPoint {
        calcPoint(length: length, angle: angle, factor: .square(factor))
    }
    
    func offset(in offset: CGSize, anchor: UnitPoint, factor: CGSize) -> CGPoint {
        self.offset(in: offset.scaled(factor), anchor: anchor)
    }
    
    func offset(in offset: CGPoint, anchor: UnitPoint, factor: CGSize) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor, factor: factor)
    }
    
    func offset(in offset: CGVector, anchor: UnitPoint, factor: CGSize) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor, factor: factor)
    }
    
    func calcPoint(length: CGFloat, angle: Angle, factor: CGSize) -> CGPoint {
        let offset = calcOffset(radius: length, angle: angle)
        return CGPoint(self.x + offset.x * factor.width, self.y + offset.y * factor.height)
    }
}

// MARK: ----- MOVE ORIGIN

public extension CGPoint {
    
    func moveOrigin(in size: CGSize, origin: UnitPoint = .topLeading) -> CGPoint {
        switch origin {
        case .topLeading, .zero:
            return self
        case .top:
            return CGPoint(x + size.halfWidth, y)
        case .topTrailing:
            return CGPoint(x + size.width, y)
        case .leading:
            return CGPoint(x, y + size.halfHeight)
        case .center:
            return CGPoint(x + size.halfWidth, y + size.halfHeight)
        case .trailing:
            return CGPoint(x + size.width, y + size.halfHeight)
        case .bottomLeading:
            return CGPoint(x, y + size.height)
        case .bottom:
            return CGPoint(x + size.halfWidth, y + size.height)
        case .bottomTrailing:
            return CGPoint(x + size.width, y + size.height)
        default:
            return CGPoint(x + (origin.x * size.width), y + (origin.y * size.height))
        }
    }
    
    func moveOrigin(in size: CGPoint, origin: UnitPoint = .topLeading) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin)
    }

    func moveOrigin(in size: CGVector, origin: UnitPoint = .topLeading) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin)
    }
}

// MARK: ----- MOVE ORIGIN WITH FACTOR

public extension CGPoint {
    
    func moveOrigin(in size: CGSize, origin: UnitPoint = .topLeading, factor: CGFloat) -> CGPoint {
        moveOrigin(in: size.scaled(factor), origin: origin)
    }
    
    func moveOrigin(in size: CGPoint, origin: UnitPoint = .topLeading, factor: CGFloat) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin, factor: factor)
    }

    func moveOrigin(in size: CGVector, origin: UnitPoint = .topLeading, factor: CGFloat) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin, factor: factor)
    }
    
    func moveOrigin(in size: CGSize, origin: UnitPoint = .topLeading, factor: CGSize) -> CGPoint {
        moveOrigin(in: size.scaled(factor), origin: origin)
    }
    
    func moveOrigin(in size: CGPoint, origin: UnitPoint = .topLeading, factor: CGSize) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin, factor: factor)
    }

    func moveOrigin(in size: CGVector, origin: UnitPoint = .topLeading, factor: CGSize) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin, factor: factor)
    }
}

// MARK: ----- CALC RADIUS AND ANGLE

public extension CGPoint {
    
    func calcAngleTo(_ x: CGFloat, _ y: CGFloat) -> Angle {
        angleTo(CGPoint(x, y))
    }
    
    /**
     This is an expensive calculation so use with care
     */
    func radiusTo(_ point: CGPoint) -> CGFloat {
        sqrt(squaredRadiusTo(point))
    }

    func radiusTo(_ x: CGFloat, _ y: CGFloat) -> CGFloat {
        radiusTo(CGPoint(x, y))
    }
    
    func squaredRadiusTo(_ point: CGPoint) -> CGFloat {
        let delta = point - self
        return ((delta.x ** 2) + (delta.y ** 2))
    }
    
    func squaredRadiusTo(_ x: CGFloat, _ y: CGFloat) -> CGFloat {
        squaredRadiusTo(CGPoint(x, y))
    }
    
    func angleTo(_ point: CGPoint) -> Angle {
        let delta = point - self
        let angle = atan2(delta.y, delta.x).radians
        return angle + 90.degrees
    }
    
    func angleTo(_ x: CGFloat, _ y: CGFloat) -> Angle {
        angleTo(CGPoint(x, y))
    }
}

// MARK: ----- CONVERT TO RECT

public extension CGPoint {
    
    func rect(to point: CGPoint) -> CGRect {
        return CGRect(from: self, to: point)
    }
}

// MARK: ----- MAP FROM ONE RECT TO ANOTHER

public extension CGPoint {
    
    func map(from: CGRect, to: CGRect) -> CGPoint {
        
        let xScale = from.width == 0 ? 0 : (x - from.origin.x) / from.width
        let yScale = from.height == 0 ? 0 : (y - from.origin.y) / from.height
        
        return CGPoint(to.relativeX(xScale), to.relativeY(yScale))
    }
}
