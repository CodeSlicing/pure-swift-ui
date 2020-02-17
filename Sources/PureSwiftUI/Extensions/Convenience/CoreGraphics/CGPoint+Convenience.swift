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
    
    init<T: UINumericType>(_ size: T) {
        self.init(size.asCGFloat)
    }
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
    
    init<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        self.init(x: x.asCGFloat, y: y.asCGFloat)
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
    
    func scaled<T: UINumericType>(_ scale: T) -> CGPoint {
        scaled(.square(scale))
    }
    
    func scaled<TX: UINumericType, TY: UINumericType>(_ xScale: TX, _ yScale: TY) -> CGPoint {
        CGPoint(xScaled(xScale), yScaled(yScale))
    }
    
    func scaled(_ scale: CGSize) -> CGPoint {
        scaled(scale.width, scale.height)
    }
    
    func xScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        x * scale.asCGFloat
    }
    
    func yScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        y * scale.asCGFloat
    }
    
    func clamped<T_FROM: UINumericType, T_TO: UINumericType>(from: T_FROM, to: T_TO) -> CGPoint {
        clamped(from: from.asCGFloat, to: to.asCGFloat)
    }
    
    func clamped(from: CGFloat, to: CGFloat) -> CGPoint {
        .init(self.x.clamped(from: from, to: to), self.y.clamped(from: from, to: to))
    }
}

// MARK: ----- STATIC INITIALISERS

public extension CGPoint {
    
    static func x<T: UINumericType>(_ x: T) -> CGPoint {
        .init(x, 0)
    }
    
    static func y<T: UINumericType>(_ y: T) -> CGPoint {
        .init(0, y)
    }
    
    static func point<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGPoint {
        .init(x, y)
    }
    
    static func point<T: UINumericType>(_ size: T) -> CGPoint {
        .init(size)
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
    
    func offset<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGPoint {
        offset(x.asCGFloat, y.asCGFloat)
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
    
    func xOffset<T: UINumericType>(_ xOffset: T) -> CGPoint {
        offset(xOffset, 0)
    }
    
    func yOffset<T: UINumericType>(_ yOffset: T) -> CGPoint {
        offset(0, yOffset)
    }
    
    func offset<T: UINumericType>(radius: T, angle: Angle) -> CGPoint {
        return offset(calcOffset(radius: radius, angle: angle))
    }
}

// MARK: ----- OFFSET WITH FACTOR
/**
 Separate extensions so as not to incur performance penalties with a default case of scale == 1
 */
public extension CGPoint {
    
    func offset(_ x: CGFloat, _ y: CGFloat, factor: CGFloat) -> CGPoint {
        return CGPoint(self.x + x * factor, self.y + y * factor)
    }
    
    func offset<TX: UINumericType, TY: UINumericType, TS: UINumericType>(_ x: TX, _ y: TY, factor: TS) -> CGPoint {
        offset(x.asCGFloat, y.asCGFloat, factor: factor.asCGFloat)
    }

    func offset<T: UINumericType>(_ offset: CGPoint, factor: T) -> CGPoint {
        self.offset(offset.x, offset.y, factor: factor.asCGFloat)
    }
    
    func offset<T: UINumericType>(_ offset: CGVector, factor: T) -> CGPoint {
        self.offset(offset.dx, offset.dy, factor: factor.asCGFloat)
    }
    
    func offset<T: UINumericType>(_ offset: CGSize, factor: T) -> CGPoint {
        self.offset(offset.width, offset.height, factor: factor.asCGFloat)
    }
    
    func xOffset<T: UINumericType, TS: UINumericType>(_ xOffset: T, factor: TS) -> CGPoint {
        offset(xOffset, 0, factor: factor)
    }
    
    func yOffset<T: UINumericType, TS: UINumericType>(_ yOffset: T, factor: TS) -> CGPoint {
        offset(0, yOffset, factor: factor)
    }
    
    func offset<T: UINumericType, TS: UINumericType>(radius: T, angle: Angle, factor: TS) -> CGPoint {
        return offset(calcOffset(radius: radius, angle: angle), factor: factor)
    }
}

// MARK: ----- TO WITH FACTOR

public extension CGPoint {

    func to<T: UINumericType>(_ destination: CGPoint, _ factor: T) -> CGPoint {
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
    
    func calcPoint<T: UINumericType>(length: T, angle: Angle) -> CGPoint {
        let offset = calcOffset(radius: length, angle: angle)
        return CGPoint(self.x + offset.x, self.y + offset.y)
    }
}

// MARK: ----- OFFSET ANCHOR WITH FACTOR

public extension CGPoint {
    
    func offset<T: UINumericType>(in size: CGSize, anchor: UnitPoint, factor: T) -> CGPoint {
        self.offset(getOffset(in: size, anchor: anchor).scaled(factor))
    }
    
    func offset<T: UINumericType>(in offset: CGPoint, anchor: UnitPoint, factor: T) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor, factor: factor)
    }
    
    func offset<T: UINumericType>(in offset: CGVector, anchor: UnitPoint, factor: T) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor, factor: factor)
    }
    
    func calcPoint<T: UINumericType, TS: UINumericType>(length: T, angle: Angle, factor: TS) -> CGPoint {
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
    
    func calcPoint<T: UINumericType>(length: T, angle: Angle, factor: CGSize) -> CGPoint {
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
    
    func moveOrigin<T: UINumericType>(in size: CGSize, origin: UnitPoint = .topLeading, factor: T) -> CGPoint {
        moveOrigin(in: size.scaled(factor), origin: origin)
    }
    
    func moveOrigin<T: UINumericType>(in size: CGPoint, origin: UnitPoint = .topLeading, factor: T) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin, factor: factor)
    }

    func moveOrigin<T: UINumericType>(in size: CGVector, origin: UnitPoint = .topLeading, factor: T) -> CGPoint {
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
    
    /**
     This is an expensive calculation so use with care
     */
    func calcRadiusTo(_ point: CGPoint) -> CGFloat {
        sqrt(calcSquaredRadiusTo(point))
    }

    func calcRadiusTo<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGFloat {
        calcRadiusTo(CGPoint(x, y))
    }
    
    func calcSquaredRadiusTo(_ point: CGPoint) -> CGFloat {
        let delta = point - self
        return ((delta.x ** 2) + (delta.y ** 2)).asCGFloat
    }
    
    func calcSquaredRadiusTo<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGFloat {
        calcSquaredRadiusTo(CGPoint(x, y))
    }
    
    func calcAngleTo(_ point: CGPoint) -> Angle {
        let delta = point - self
        let angle = atan2(delta.y, delta.x).radians
        return angle + 90.degrees
    }
    
    func calcAngleTo<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> Angle {
        calcAngleTo(CGPoint(x, y))
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
        
        let xScale = from.width == 0 ? x : (x - from.origin.x) / from.width
        let yScale = from.height == 0 ? y : (y - from.origin.y) / from.height
        
        return CGPoint(to.xScaled(xScale), to.yScaled(yScale))
    }
}
