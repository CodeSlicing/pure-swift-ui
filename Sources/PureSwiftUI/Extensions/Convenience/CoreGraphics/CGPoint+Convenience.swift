//
//  CGPoint+Convenience.swift
//  
//
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension CGPoint {
    
    init<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        self.init(x.asCGFloat, y.asCGFloat)
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

    func scaled<T: UINumericType>(_ scale: T) -> CGPoint {
        CGPoint(xScaled(scale), yScaled(scale))
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

// MARK: ----- TO WITH SCALE

public extension CGPoint {

    func to<T: UINumericType>(_ destination: CGPoint, _ scale: T) -> CGPoint {
        let deltaX = destination.x - self.x
        let deltaY = destination.y - self.y
        return CGPoint(self.x + deltaX * scale, self.y + deltaY * scale)
    }
}

// MARK: ----- UTILITIES

// MARK: ----- OFFSET ANCHOR

public extension CGPoint {
    
    func offset(in offset: CGSize, anchor: UnitPoint) -> CGPoint {
        switch anchor {
        case .topLeading, .zero:
            return self
        case .top:
            return CGPoint(x - offset.halfWidth, y)
        case .topTrailing:
            return CGPoint(x - offset.width, y)
        case .leading:
            return CGPoint(x, y - offset.halfHeight)
        case .center:
            return CGPoint(x - offset.halfWidth, y - offset.halfHeight)
        case .trailing:
            return CGPoint(x - offset.width, y - offset.halfHeight)
        case .bottomLeading:
            return CGPoint(x, y - offset.height)
        case .bottom:
            return CGPoint(x - offset.halfWidth, y - offset.height)
        case .bottomTrailing:
            return CGPoint(x - offset.width, y - offset.height)
        default:
            return CGPoint(x - anchor.x, y - anchor.y)
        }
    }
    
    func offset(in offset: CGPoint, anchor: UnitPoint) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor)
    }
    
    func offset(in offset: CGVector, anchor: UnitPoint) -> CGPoint {
        self.offset(in: offset.asCGSize, anchor: anchor)
    }
    
    func calcPoint<T: UINumericType>(length: T, angle: Angle) -> CGPoint {
        let y = length * -angle.cos
        let x = length * angle.sin
        return CGPoint(self.x + x, self.y + y)
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
            return CGPoint(x + origin.x, y + origin.y)
        }
    }
    
    func moveOrigin(in size: CGPoint, origin: UnitPoint = .topLeading) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin)
    }

    func moveOrigin(in size: CGVector, origin: UnitPoint = .topLeading) -> CGPoint {
        moveOrigin(in: size.asCGSize, origin: origin)
    }
}

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


