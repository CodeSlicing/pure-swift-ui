//
//  LayoutCoordinator.swift
//  
//  Created by Adam Fordyce on 11/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- LAYOUT COORDINATORS

internal protocol LayoutCoordinator {
    
    subscript(x: Int, y: Int) -> CGPoint {get}
    subscript(rel x: CGFloat, y: Int) -> CGPoint {get}
    subscript(x: Int, rel y: CGFloat) -> CGPoint {get}
    subscript(rel x: CGFloat, rel y: CGFloat) -> CGPoint {get}
    func reframed(into rect: CGRect, originalRect: CGRect, origin: UnitPoint?) -> LayoutCoordinator
    var xCount: Int {get}
    var yCount: Int {get}
    var baseOrigin: CGPoint {get}
    var baseRect: CGRect {get}
    func anchorLocation(for anchor: UnitPoint, size: CGSize) -> CGPoint
    var topLeading: CGPoint {get}
    var top: CGPoint {get}
    var topTrailing: CGPoint {get}
    var trailing: CGPoint {get}
    var bottomTrailing: CGPoint {get}
    var bottom: CGPoint {get}
    var bottomLeading: CGPoint {get}
    var leading: CGPoint {get}
    var center: CGPoint {get}
}

// MARK: ----- DECORATING LAYOUT COORDINATOR

internal protocol DecoratingLayoutCoordinator: LayoutCoordinator {
    var baseCoordinator: LayoutCoordinator {get}
    func transform(_ point: CGPoint) -> CGPoint
}

internal extension DecoratingLayoutCoordinator {
    
    var baseRect: CGRect {
        baseCoordinator.baseRect
    }
        
    var baseOrigin: CGPoint {
        baseCoordinator.baseOrigin
    }

    var topLeading: CGPoint {
        transform(baseCoordinator.topLeading)
    }
    
    var top: CGPoint {
        transform(baseCoordinator.top)
    }
    
    var topTrailing: CGPoint {
        transform(baseCoordinator.topTrailing)
    }
    
    var trailing: CGPoint {
        transform(baseCoordinator.trailing)
    }
    
    var bottomTrailing: CGPoint {
        transform(baseCoordinator.bottomTrailing)
    }
    
    var bottom: CGPoint {
        transform(baseCoordinator.bottom)
    }
    
    var bottomLeading: CGPoint {
        transform(baseCoordinator.bottomLeading)
    }
    
    var leading: CGPoint {
        transform(baseCoordinator.leading)
    }
    
    var center: CGPoint {
        transform(baseCoordinator.center)
    }

    func anchorLocation(for anchor: UnitPoint, size: CGSize) -> CGPoint {
        baseCoordinator.anchorLocation(for: anchor, size: size)
    }
    
    var xCount: Int {
        baseCoordinator.xCount
    }
    
    var yCount: Int {
        baseCoordinator.yCount
    }
    
    subscript(x: Int, y: Int) -> CGPoint {
        transform(self.baseCoordinator[x, y])
    }
    
    subscript(rel x: CGFloat, y: Int) -> CGPoint {
        transform(self.baseCoordinator[rel: x, y])
    }

    subscript(x: Int, rel y: CGFloat) -> CGPoint {
        transform(self.baseCoordinator[x, rel: y])
    }

    subscript(rel x: CGFloat, rel y: CGFloat) -> CGPoint {
        transform(self.baseCoordinator[rel: x, rel: y])
    }
}

// MARK: ----- ROTATED LAYOUT COORDINATOR

internal struct RotatedLayoutCoordinator: DecoratingLayoutCoordinator {

    let angle: Angle
    let anchor: UnitPoint
    let anchorPoint: CGPoint
    let baseCoordinator: LayoutCoordinator
    
    init(angle: Angle, anchor: UnitPoint, anchorPoint: CGPoint, baseCoordinator: LayoutCoordinator) {
        self.angle = angle
        self.anchor = anchor
        self.anchorPoint = anchorPoint
        self.baseCoordinator = baseCoordinator
    }
    
    func transform(_ point: CGPoint) -> CGPoint {
        let radiusToPoint = anchorPoint.radiusTo(point)
        let angleToPoint = anchorPoint.angleTo(point)
        let resultAngle = angleToPoint + angle
        return anchorPoint.offset(radius: radiusToPoint, angle: resultAngle)
    }
    
    func reframed(into rect: CGRect, originalRect: CGRect, origin: UnitPoint?) -> LayoutCoordinator {
        
        let reframedBaseCoordinator = baseCoordinator.reframed(into: rect, originalRect: originalRect, origin: origin)
        
        let reframedRect = reframedBaseCoordinator.baseRect
        
        let anchorPoint = reframedRect.origin.moveOrigin(in: reframedRect.size, origin: anchor)
        
        return RotatedLayoutCoordinator(angle: angle, anchor: anchor, anchorPoint: anchorPoint, baseCoordinator: reframedBaseCoordinator)
    }
}

// MARK: ----- OFFSET LAYOUT COORDINATOR

internal struct OffsetLayoutCoordinator: DecoratingLayoutCoordinator {
    
    let offset: CGPoint
    let baseCoordinator: LayoutCoordinator
    
    init(offset: CGPoint, baseCoordinator: LayoutCoordinator) {
        self.offset = offset
        self.baseCoordinator = baseCoordinator
    }
    
    func transform(_ point: CGPoint) -> CGPoint {
        point.offset(offset)
    }
    
    func reframed(into rect: CGRect, originalRect: CGRect, origin: UnitPoint? = nil) -> LayoutCoordinator {
        return OffsetLayoutCoordinator(offset: offset, baseCoordinator: baseCoordinator.reframed(into: rect, originalRect: originalRect, origin: origin))
    }
}

// MARK: ----- SCALED LAYOUT COORDINATOR

internal struct ScaledLayoutCoordinator: DecoratingLayoutCoordinator {
    
    let scale: CGSize
    let anchor: UnitPoint
    let anchorPoint: CGPoint
    let baseCoordinator: LayoutCoordinator
    
    init(scale: CGSize, anchor: UnitPoint, anchorPoint: CGPoint, baseCoordinator: LayoutCoordinator) {
        self.scale = scale
        self.anchor = anchor
        self.anchorPoint = anchorPoint
        self.baseCoordinator = baseCoordinator
    }
    
    func transform(_ point: CGPoint) -> CGPoint {
        let offset = point - anchorPoint
        return anchorPoint + offset.scaled(scale)
    }
    
    func reframed(into rect: CGRect, originalRect: CGRect, origin: UnitPoint? = nil) -> LayoutCoordinator {
        
        let reframedBaseCoordinator = baseCoordinator.reframed(into: rect, originalRect: originalRect, origin: origin)
        let reframedRect = reframedBaseCoordinator.baseRect
        let anchorPoint = reframedRect.origin.moveOrigin(in: reframedRect.size, origin: anchor)
        
        return ScaledLayoutCoordinator(scale: scale, anchor: anchor, anchorPoint: anchorPoint, baseCoordinator: reframedBaseCoordinator)
    }
}

