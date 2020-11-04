//
//  CGVector+Convenience.swift
//
//  Created by Adam Fordyce on 25/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension CGVector {
    
    init(_ size: CGFloat) {
        self.init(size, size)
    }
    
    init(_ dx: CGFloat, _ dy: CGFloat) {
        self.init(dx: dx, dy: dy)
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
    
    var asUnitPoint: UnitPoint {
        UnitPoint(dx, dy)
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

    var minDimension: CGFloat {
        min(dx, dy)
    }

    var maxDimension: CGFloat {
        max(dx, dy)
    }
    
    func scaled(_ scale: CGFloat) -> CGSize {
        scaled(.square(scale))
    }
    
    func scaled(_ scale: CGSize) -> CGSize {
        .init(widthScaled(scale.width), heightScaled(scale.height))
    }

    func widthScaled(_ scale: CGFloat) -> CGFloat {
        dx * scale
    }

    func heightScaled(_ scale: CGFloat) -> CGFloat {
        dy * scale
    }

    func clamped(from: CGFloat, to: CGFloat) -> CGVector {
        .init(dx.clamped(from: from, to: to), dy.clamped(from: from, to: to))
    }
}

// MARK: ----- STATIC INITIALISERS

public extension CGVector {
    
    static func dx(_ dx: CGFloat) -> CGVector {
        .init(dx, 0)
    }
    
    static func dy(_ dy: CGFloat) -> CGVector {
        .init(0, dy)
    }
    
    static func vector(_ dx: CGFloat, _ dy: CGFloat) -> CGVector {
        .init(dx, dy)
    }
    
    static func vector(_ size: CGFloat) -> CGVector {
        .init(size)
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
