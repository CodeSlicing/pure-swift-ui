//
//  CGVector+Convenience.swift
//
//  Created by Adam Fordyce on 25/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension CGVector {
    
    init(_ dx: CGFloat, _ dy: CGFloat) {
        self.init(dx: dx, dy: dy)
    }

    init<TX: UINumericType, TY: UINumericType>(_ dx: TX, _ dy: TY) {
        self.init(dx: dx.asCGFloat, dy: dy.asCGFloat)
    }

    var asCGRect: CGRect {
        CGRect(dx, dy)
    }
    
    var asCGPoint: CGPoint {
        CGPoint(dx, dy)
    }

    var asCGSize: CGSize {
        CGSize(dx, dy)
    }
    
    var width: CGFloat {
        dx
    }

    var height: CGFloat {
        dy
    }

    var midX: CGFloat {
        width * 0.5
    }

    var midY: CGFloat {
        height * 0.5
    }
    
    var halfWidth: CGFloat {
        midX
    }
    
    var halfHeight: CGFloat {
        midY
    }

    func scaled<T: UINumericType>(_ scale: T) -> CGSize {
        .init(widthScaled(scale), heightScaled(scale))
    }

    func widthScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        dx * scale.asCGFloat
    }

    func heightScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        dy * scale.asCGFloat
    }

    func clamped(from: CGFloat, to: CGFloat) -> CGVector {
        .init(dx.clamped(from: from, to: to), dy.clamped(from: from, to: to))
    }
}

// MARK: ----- OPERATOR OVERLOADS

public extension CGVector {
    
    static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(lhs.dx - rhs.dx, lhs.dy - rhs.dy)
    }

    static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(lhs.dx + rhs.dx, lhs.dy + rhs.dy)
    }
}
