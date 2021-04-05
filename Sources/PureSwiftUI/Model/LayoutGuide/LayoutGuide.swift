//
//  LayoutGuide.swift
//
//  Created by Adam Fordyce on 31/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

public struct LayoutGuide {
    
    internal var coordinator: LayoutCoordinator
    public let rect: CGRect
    
    internal init(_ coordinator: LayoutCoordinator, rect: CGRect) {
        self.coordinator = coordinator
        self.rect = rect
    }
    
    var origin: CGPoint {
        coordinator.baseOrigin
    }
    
    public subscript(x: Int, y: Int) -> CGPoint {
        get {
            coordinator[x, y]
        }
    }
    
    public subscript(x: Int, y: Int, origin origin: CGPoint) -> CGPoint {
        get {
            offsetPoint(self[x, y], to: origin)
        }
    }

    public subscript(rel x: CGFloat, rel y: CGFloat) -> CGPoint {
        get {
            coordinator[rel: x, rel: y]
        }
    }
    
    public subscript(rel x: CGFloat, rel y: CGFloat, origin origin: CGPoint) -> CGPoint {
        get {
            offsetPoint(self[rel: x, rel: y], to: origin)
        }
    }

    public subscript(rel x: CGFloat, y: Int) -> CGPoint {
        get {
            coordinator[rel: x, y]
        }
    }

    public subscript(rel x: CGFloat, y: Int, origin origin: CGPoint) -> CGPoint {
        get {
            offsetPoint(self[rel: x, y], to: origin)
        }
    }

    public subscript(x: Int, rel y: CGFloat) -> CGPoint {
        get {
            coordinator[x, rel: y]
        }
    }

    public subscript(x: Int, rel y: CGFloat, origin origin: CGPoint) -> CGPoint {
        get {
            offsetPoint(self[x, rel: y], to: origin)
        }
    }

    public var xCount: Int {
        coordinator.xCount
    }

    public var yCount: Int {
        coordinator.yCount
    }
    
    public func radiusTo(_ x: Int, _ y: Int, from: CGPoint) -> CGFloat {
        from.radiusTo(self[x, y])
    }
    
    public func radiusTo(_ x: Int, _ y: Int) -> CGFloat {
        radiusTo(x, y, from: coordinator.baseOrigin)
    }
    
    public func angleTo(_ x: Int, _ y: Int, from: CGPoint) -> Angle {
        from.angleTo(self[x, y])
    }
    
    public func angleTo(_ x: Int, _ y: Int) -> Angle {
        angleTo(x, y, from: coordinator.baseOrigin)
    }

    internal func anchorLocation(for anchor: UnitPoint) -> CGPoint {
        coordinator.anchorLocation(for: anchor, size: rect.size)
    }
    
    private func offsetPoint(_ point: CGPoint, to origin: CGPoint) -> CGPoint {
        let delta = origin - coordinator.baseOrigin
        return point.offset(delta)
    }
}

// MARK: ----- PROPERTIES

public extension LayoutGuide {
    
    var topLeading: CGPoint {
        coordinator.topLeading
    }

    var top: CGPoint {
        coordinator.top
    }

    var topTrailing: CGPoint {
        coordinator.topTrailing
    }

    var trailing: CGPoint {
        coordinator.trailing
    }

    var bottomTrailing: CGPoint {
        coordinator.bottomTrailing
    }

    var bottom: CGPoint {
        coordinator.bottom
    }

    var bottomLeading: CGPoint {
        coordinator.bottomLeading
    }

    var leading: CGPoint {
        coordinator.leading
    }

    var center: CGPoint {
        coordinator.center
    }
}

// MARK: ----- REFRAMING

public extension LayoutGuide {
    
    func reframed(_ rect: CGRect, origin: UnitPoint? = nil) -> LayoutGuide {
        LayoutGuide(coordinator.reframed(into: rect, originalRect: self.rect, origin: origin), rect: rect)
    }
}

// MARK: ----- UTILITIES

internal func calcOrigin(in rect: CGRect, origin: UnitPoint = .topLeading) -> CGPoint {
    return rect.origin.moveOrigin(in: rect.size, origin: origin)
}

// MARK: ----- LAYOUT GUIDE OPERATIONS

// MARK: ----- ROTATED

public extension LayoutGuide {
    
    func rotated(_ angle: Angle, anchor: UnitPoint = .center) -> LayoutGuide {
        rotated(angle, anchor: anchor, factor: 1)
    }
    
    func rotated(_ angle: Angle, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        LayoutGuide(RotatedLayoutCoordinator(angle: angle * factor.asDouble, anchor: anchor, anchorPoint: anchorLocation(for: anchor), baseCoordinator: self.coordinator), rect: self.rect)
    }
}

// MARK: ----- ROTATED FROM TO

public extension LayoutGuide {
    
    func rotated(from: Angle, to: Angle, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        let delta = to - from
        return LayoutGuide(RotatedLayoutCoordinator(angle: from + delta * factor, anchor: anchor, anchorPoint: anchorLocation(for: anchor), baseCoordinator: self.coordinator), rect: self.rect)
    }
}

// MARK: ----- OFFSET

public extension LayoutGuide {
    
    func offset(_ offset: CGPoint) -> LayoutGuide {
        self.offset(offset, factor: 1)
    }
    
    func offset(_ offset: CGFloat) -> LayoutGuide {
        self.offset(.point(offset))
    }
    
    func offset(_ offset: CGPoint, factor: CGFloat) -> LayoutGuide {
        LayoutGuide(OffsetLayoutCoordinator(offset: offset.scaled(factor.asCGFloat), baseCoordinator: self.coordinator), rect: self.rect)
    }
    
    func offset(_ offset: CGFloat, factor: CGFloat) -> LayoutGuide {
        self.offset(.point(offset), factor: factor)
    }
}

// MARK: ----- OFFSET FROM TO

public extension LayoutGuide {
    
    func offset(from: CGPoint, to: CGPoint, factor: CGFloat) -> LayoutGuide {
        let delta = to - from
        return LayoutGuide(OffsetLayoutCoordinator(offset: from + delta.scaled(factor.asCGFloat), baseCoordinator: self.coordinator), rect: self.rect)
    }
    
    func offset(from: CGSize, to: CGSize, factor: CGFloat) -> LayoutGuide {
        offset(from: from.asCGPoint, to: to.asCGPoint, factor: factor)
    }
}

// MARK: ----- OFFSET IN X

public extension LayoutGuide {
    
    func xOffset(_ x: CGFloat) -> LayoutGuide {
        xOffset(x, factor: 1)
    }
    
    func xOffset(_ x: CGFloat, factor: CGFloat) -> LayoutGuide {
        offset(.x(x), factor: factor)
    }
}

// MARK: ----- OFFSET IN X FROM TO

public extension LayoutGuide {
    
    func xOffset(from: CGFloat, to: CGFloat, factor: CGFloat) -> LayoutGuide {
        let delta = to - from
        return offset(.x(from + delta * factor.asCGFloat))
    }
}

// MARK: ----- OFFSET IN Y

public extension LayoutGuide {
    
    func yOffset(_ y: CGFloat) -> LayoutGuide {
        yOffset(y, factor: 1)
    }
    
    func yOffset(_ y: CGFloat, factor: CGFloat) -> LayoutGuide {
        offset(.y(y), factor: factor)
    }
}

// MARK: ----- OFFSET IN Y FROM TO

public extension LayoutGuide {
    
    func yOffset(from: CGFloat, to: CGFloat, factor: CGFloat) -> LayoutGuide {
        let delta = to - from
        return offset(.y(from + delta * factor.asCGFloat))
    }
}

// MARK: ----- SCALED

public extension LayoutGuide {
        
    func scaled(_ scale: CGSize, anchor: UnitPoint = .center) -> LayoutGuide {
        scaled(scale, anchor: anchor, factor: 1)
    }
    
    func scaled(_ scale: CGFloat, anchor: UnitPoint = .center) -> LayoutGuide {
        scaled(.square(scale), anchor: anchor)
    }
    
    func scaled(_ scale: CGSize, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        let effectiveScale = scale - .square(1)
        return LayoutGuide(ScaledLayoutCoordinator(scale: .square(1) + effectiveScale.scaled(factor.asCGFloat), anchor: anchor, anchorPoint: anchorLocation(for: anchor), baseCoordinator: self.coordinator), rect: self.rect)
    }
    
    func scaled(_ scale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        scaled(.square(scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- SCALED FROM TO

public extension LayoutGuide {
        
    func scaled(from fromScale: CGSize, to toScale: CGSize, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        let deltaScale = toScale - fromScale
        return scaled(fromScale + deltaScale.scaled(factor.asCGFloat), anchor: anchor)
    }
    
    func scaled(from fromScale: CGFloat, to toScale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        scaled(from: .square(fromScale), to: .square(toScale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- XSCALED

public extension LayoutGuide {
        
    func xScaled(_ scale: CGFloat, anchor: UnitPoint = .center) -> LayoutGuide {
        xScaled(scale, anchor: anchor, factor: 1)
    }
    
    func xScaled(_ scale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        scaled(.size(scale, 1), anchor: anchor, factor: factor)
    }
}

// MARK: ----- XSCALED FROM TO

public extension LayoutGuide {
        
    func xScaled(from fromScale: CGFloat, to toScale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        xScaled(fromScale.to(toScale, factor), anchor: anchor)
    }
}

// MARK: ----- YSCALED

public extension LayoutGuide {
    
    func yScaled(_ scale: CGFloat, anchor: UnitPoint = .center) -> LayoutGuide {
        yScaled(scale, anchor: anchor, factor: 1)
    }
    
    func yScaled(_ scale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        scaled(.size(1, scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- YSCALED FROM TO

public extension LayoutGuide {
        
    func yScaled(from fromScale: CGFloat, to toScale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuide {
        return yScaled(fromScale.to(toScale, factor), anchor: anchor)
    }
}
