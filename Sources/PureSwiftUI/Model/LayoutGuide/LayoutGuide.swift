//
//  LayoutGuide.swift
//
//  Created by Adam Fordyce on 31/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

public struct LayoutGuide {
    
    private var coordinator: LayoutCoordinator
    private var points: [LayoutKey: CGPoint] = [:]
    private let rect: CGRect
    var origin: CGPoint
    
    init(_ coordinator: LayoutCoordinator, rect: CGRect, origin: CGPoint) {
        self.coordinator = coordinator
        self.origin = origin
        self.rect = rect
    }

    public subscript(x: Int, y: Int, origin origin: CGPoint) -> CGPoint {
        mutating get {
            let key = LayoutKey.from(origin, x, y)
            if let point = points[key] {
                return point
            } else {
                let point = self.coordinator[origin, x, y]
                points[key] = point
                return point
            }
        }
    }

    public subscript(x: Int, y: Int) -> CGPoint {
        mutating get {
            self[x, y, origin: self.origin]
        }
    }
    
    public var xCount: Int {
        coordinator.xCount
    }

    public var yCount: Int {
        coordinator.yCount
    }
    
    public mutating func radius(_ x: Int, _ y: Int, origin: CGPoint) -> CGFloat {
        self.origin.calcRadiusTo(self[x, y])
    }
    
    public mutating func angle(_ x: Int, _ y: Int, origin: CGPoint) -> Angle {
        self.origin.calcAngleTo(self[x, y])
    }
    
    public mutating func radius(_ x: Int, _ y: Int) -> CGFloat {
        radius(x, y, origin: self.origin)
    }
    
    public mutating func angle(_ x: Int, _ y: Int) -> Angle {
        angle(x, y, origin: self.origin)
    }
}

// MARK: ----- GRID PROTOCOL

protocol LayoutCoordinator {
    
    subscript(origin: CGPoint, x: Int, y: Int) -> CGPoint {get}
    func reframed(_ rect: CGRect) -> LayoutCoordinator
    var xCount: Int {get}
    var yCount: Int {get}
}

private struct LayoutKey: Hashable {
    
    private let values: (origin: CGPoint, x: Int, y: Int)
    
    private init(_ origin: CGPoint, _ x: Int, _ y: Int) {
        values = (origin, x, y)
    }
    
    static func == (lhs: LayoutKey, rhs: LayoutKey) -> Bool {
        lhs.values == rhs.values
    }

    static func from(_ origin: CGPoint, _ x: Int, _ y: Int) -> LayoutKey {
        return LayoutKey(origin, x, y)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(values.origin.x)
        hasher.combine(values.origin.y)
        hasher.combine(values.x)
        hasher.combine(values.y)
    }
}

// MARK: ----- REFRAMING

public extension LayoutGuide {
    
    func reframed(_ rect: CGRect, origin: UnitPoint) -> LayoutGuide {
        LayoutGuide(coordinator.reframed(rect), rect: rect, origin: calcOrigin(in: rect, origin: origin))
    }
    
    func reframed(offset: CGPoint) -> LayoutGuide {
        let offsetRect = self.rect.offsetBy(dx: offset.x, dy: offset.y)
        return LayoutGuide(coordinator.reframed(offsetRect), rect: offsetRect, origin: origin.offset(offset))
    }

    func reframed(offset: CGSize) -> LayoutGuide {
        reframed(offset: offset.asCGPoint)
    }
    
    func reframed(offset: CGVector) -> LayoutGuide {
        reframed(offset: offset.asCGPoint)
    }
}

// MARK: ----- UTILITIES

internal func calcOrigin(in rect: CGRect, origin: UnitPoint = .topLeading) -> CGPoint {
    return rect.origin.moveOrigin(in: rect.size, origin: origin)
}

