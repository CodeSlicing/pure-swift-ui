//
//  CGSize+Convenience.swift
//
//  Created by Adam Fordyce on 25/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    
    init(_ size: CGFloat) {
        self.init(size, size)
    }
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }

    var asCGRect: CGRect {
        CGRect(width, height)
    }
    
    var asCGPoint: CGPoint {
        CGPoint(width, height)
    }

    var asCGVector: CGVector {
        CGVector(width, height)
    }
    
    var asUnitPoint: UnitPoint {
        UnitPoint(width, height)
    }
    
    var x: CGFloat {
        width
    }
    
    var y: CGFloat {
        height
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
        min(width, height)
    }

    var maxDimension: CGFloat {
        max(width, height)
    }
    
    func scaled(_ scale: CGFloat) -> CGSize {
        scaled(.square(scale))
    }
    
    func scaled(_ scale: CGSize) -> CGSize {
        scaled(scale.width, scale.height)
    }
    
    func scaled(_ widthScale: CGFloat, _ heightScale: CGFloat) -> CGSize {
        .init(widthScaled(widthScale), heightScaled(heightScale))
    }
    
    func widthScaled(_ scale: CGFloat) -> CGFloat {
        width * scale.asCGFloat
    }
    
    func heightScaled(_ scale: CGFloat) -> CGFloat {
        height * scale.asCGFloat
    }
    
    func clamped(from: CGFloat, to: CGFloat) -> CGSize {
        .init(self.width.clamped(from: from, to: to), self.height.clamped(from: from, to: to))
    }
}

// MARK: ----- OPERATOR OVERLOADS

public extension CGSize {
    
    static func -(lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(lhs.width - rhs.width, lhs.height - rhs.height)
    }
    
    static func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(lhs.width + rhs.width, lhs.height + rhs.height)
    }
}

// MARK: ----- STATIC INITIALISERS

public extension CGSize {
    
    static func square(_ size: CGFloat) -> CGSize {
        .init(size)
    }
    
    static func width(_ width: CGFloat) -> CGSize {
        .init(width, 0)
    }
    
    static func height(_ height: CGFloat) -> CGSize {
        .init(0, height)
    }
    
    static func size(_ width: CGFloat, _ height: CGFloat) -> CGSize {
        .init(width, height)
    }
    
    static func size(_ size: CGFloat) -> CGSize {
        .square(size)
    }
}

// MARK: ----- MAP FROM ONE RECT TO ANOTHER

public extension CGSize {
    
    func map(from: CGRect, to: CGRect) -> CGSize {
        let relativeOffsetWidth = from.width == 0 ? width : width / from.width
        let relativeOffsetHeight = from.height == 0 ? height : height / from.height
        
        return CGSize(relativeOffsetWidth * to.width, relativeOffsetHeight * to.height)
    }
}

// MARK: ----- TO WITH FACTOR

public extension CGSize {

    func to(_ destination: CGSize, _ factor: CGFloat) -> CGSize {
        to(destination, .square(factor))
    }
    
    func to(_ destination: CGSize, _ factor: CGSize) -> CGSize {
        let deltaX = destination.x - self.x
        let deltaY = destination.y - self.y
        return CGSize(self.x + deltaX * factor.x, self.y + deltaY * factor.y)
    }
}
