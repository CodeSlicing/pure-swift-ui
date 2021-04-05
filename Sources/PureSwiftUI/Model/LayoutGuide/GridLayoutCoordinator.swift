//
//  GridLayoutCoordinator.swift
//
//  Created by Adam Fordyce on 03/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

private struct GridLayoutCoordinator: LayoutCoordinator {
    
    let baseOrigin: CGPoint
    let baseRect: CGRect
    let xOffsetCalculator: OffsetForIndexCalculator
    let yOffsetCalculator: OffsetForIndexCalculator
    
    var xCount: Int {
        xOffsetCalculator.indexCount
    }
    
    var yCount: Int {
        yOffsetCalculator.indexCount
    }
    
    subscript(x: Int, y: Int) -> CGPoint {
        baseOrigin.offset(CGPoint(x: xOffsetCalculator.offsetFor(index: x), y: yOffsetCalculator.offsetFor(index: y)))
    }

    subscript(rel x: CGFloat, y: Int) -> CGPoint {
        baseOrigin.offset(CGPoint(x: xOffsetCalculator.offsetFor(relativeOffset: x), y: yOffsetCalculator.offsetFor(index: y)))
    }

    subscript(x: Int, rel y: CGFloat) -> CGPoint {
        baseOrigin.offset(CGPoint(x: xOffsetCalculator.offsetFor(index: x), y: yOffsetCalculator.offsetFor(relativeOffset: y)))
    }

    subscript(rel x: CGFloat, rel y: CGFloat) -> CGPoint {
        baseOrigin.offset(CGPoint(x: xOffsetCalculator.offsetFor(relativeOffset: x), y: yOffsetCalculator.offsetFor(relativeOffset: y)))
    }
    
    func reframed(into rect: CGRect, originalRect: CGRect, origin: UnitPoint? = nil) -> LayoutCoordinator {
        
//        let newOrigin = origin == nil ? rect.origin.map(from: originalRect, to: rect) : calcOrigin(in: rect, origin: origin!)
        let newOrigin = calcOrigin(in: rect, origin: origin ?? .topLeading)

        let actualRect = CGRect(newOrigin, rect.size)
        return GridLayoutCoordinator(
            baseOrigin: newOrigin,
            baseRect: actualRect,
            xOffsetCalculator: xOffsetCalculator.reframed(rect.width),
            yOffsetCalculator: yOffsetCalculator.reframed(rect.height))
    }
    
    func anchorLocation(for anchor: UnitPoint, size: CGSize) -> CGPoint {
        if anchor == .topLeading {
            return baseOrigin
        } else {
            return baseOrigin.moveOrigin(in: size, origin: anchor)
        }
    }
}

private extension GridLayoutCoordinator {
    
    var topLeading: CGPoint {
        baseRect.topLeading
    }
    
    var top: CGPoint {
        baseRect.top
    }
    
    var topTrailing: CGPoint {
        baseRect.topTrailing
    }
    
    var trailing: CGPoint {
        baseRect.trailing
    }
    
    var bottomTrailing: CGPoint {
        baseRect.bottomTrailing
    }
    
    var bottom: CGPoint {
        baseRect.bottom
    }
    
    var bottomLeading: CGPoint {
        baseRect.bottomLeading
    }
    
    var leading: CGPoint {
        baseRect.leading
    }
    
    var center: CGPoint {
        baseRect.center
    }
}

// MARK: ----- GRID CALCULATOR PROTOCOLS

private protocol OffsetForIndexCalculator {
    
    var size: CGFloat {get}
    var indexCount: Int {get}
    func offsetFor(index: Int) -> CGFloat
    func reframed(_ size: CGFloat) -> OffsetForIndexCalculator
}

private extension OffsetForIndexCalculator {
    
    func offsetFor(relativeOffset: CGFloat) -> CGFloat {
        size * relativeOffset
    }
}

// MARK: ----- EQUIDISTANT OFFSET FOR INDEX

private struct EquidistantOffsetForIndexCalculator: OffsetForIndexCalculator {
    
    private let numSlices: Int
    private let offsetPerIndex: CGFloat
    fileprivate let size: CGFloat
    
    init(_ size: CGFloat, numSlices: Int) {
        self.numSlices = numSlices > 0 ? numSlices : 1
        self.offsetPerIndex = size / numSlices.asCGFloat
        self.size = size
    }
    
    var indexCount: Int {
        numSlices
    }
    
    func offsetFor(index: Int) -> CGFloat {
        offsetPerIndex * index.asCGFloat
    }
    
    func reframed(_ size: CGFloat) -> OffsetForIndexCalculator {
        EquidistantOffsetForIndexCalculator(size, numSlices: numSlices)
    }
}

// MARK: ----- RELATIVE OFFSET FOR INDEX

private struct RelativeOffsetForIndexCalculator: OffsetForIndexCalculator {
    
    private let slices: [CGFloat]
    private let offsetSteps: [CGFloat]
    fileprivate let size: CGFloat
    
    init(_ size: CGFloat, slices: [CGFloat]) {
        
        var offsetSteps: [CGFloat] = []
        for slice in slices {
            offsetSteps.append(slice.asCGFloat)
        }
        self.slices = slices
        self.offsetSteps = offsetSteps
        self.size = size
    }
    
    var indexCount: Int {
        slices.count
    }
    
    func offsetFor(index: Int) -> CGFloat {
        if index >= 0 && index < offsetSteps.count {
            return size * offsetSteps[index]
        } else if index >= offsetSteps.count {
            return size * (offsetSteps.last ?? 0)
        } else {
            return size * (offsetSteps.first ?? 0)
        }
    }
    
    func reframed(_ size: CGFloat) -> OffsetForIndexCalculator {
        RelativeOffsetForIndexCalculator(size, slices: slices)
    }
}

// MARK: ----- LAYOUT EXTENSIONS FOR GRID

public extension LayoutGuide {
    
    private static func gridLayout(xOffsetCalculator: OffsetForIndexCalculator, yOffsetCalculator: OffsetForIndexCalculator, rect: CGRect, origin: UnitPoint) -> LayoutGuide {
       
        let coordinator = GridLayoutCoordinator(
            baseOrigin: calcOrigin(in: rect, origin: origin),
            baseRect: rect,
            xOffsetCalculator: xOffsetCalculator,
            yOffsetCalculator: yOffsetCalculator)
        
        return LayoutGuide(coordinator, rect: rect)
    }
    
    /**
     Equidistant x and y
     */
    static func grid(_ rect: CGRect, columns: Int, rows: Int, origin: UnitPoint = .topLeading) -> LayoutGuide {
        
        let xOffsetCalculator = EquidistantOffsetForIndexCalculator(rect.width, numSlices: columns)
        let yOffsetCalculator = EquidistantOffsetForIndexCalculator(rect.height, numSlices: rows)
        
        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
    
    /**
     Relative x and equidistant y
     */
    static func grid(_ rect: CGRect, columns: [CGFloat], rows: Int, origin: UnitPoint = .topLeading) -> LayoutGuide {
        let xOffsetCalculator = RelativeOffsetForIndexCalculator(rect.width, slices: columns)
        let yOffsetCalculator = EquidistantOffsetForIndexCalculator(rect.height, numSlices: rows)

        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
    
    /**
     Equidistant x and relative y
     */
    static func grid(_ rect: CGRect, columns: Int, rows: [CGFloat], origin: UnitPoint = .topLeading) -> LayoutGuide {
      
        let xOffsetCalculator = EquidistantOffsetForIndexCalculator(rect.width, numSlices: columns)
        let yOffsetCalculator = RelativeOffsetForIndexCalculator(rect.height, slices: rows)

        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
    
    /**
     Relative x and y
     */
    static func grid(_ rect: CGRect, columns: [CGFloat], rows: [CGFloat], origin: UnitPoint = .topLeading) -> LayoutGuide {
        
        let xOffsetCalculator = RelativeOffsetForIndexCalculator(rect.width, slices: columns)
        let yOffsetCalculator = RelativeOffsetForIndexCalculator(rect.height, slices: rows)
        
        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
}
