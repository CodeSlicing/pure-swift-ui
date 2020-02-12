//
//  GridLayoutGuide.swift
//
//  Created by Adam Fordyce on 03/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

private struct GridLayoutCoordinator: LayoutCoordinator {

    let xOffsetCalculator: OffsetForIndexCalculator
    let yOffsetCalculator: OffsetForIndexCalculator
    
    public var xCount: Int {
        xOffsetCalculator.indexCount
    }
    
    public var yCount: Int {
        yOffsetCalculator.indexCount
    }
    
    public subscript(origin: CGPoint, x: Int, y: Int) -> CGPoint {
        get {
            origin.offset(CGPoint(x: xOffsetCalculator.offsetFor(index: x), y: yOffsetCalculator.offsetFor(index: y)))
        }
    }

    public func reframed(_ rect: CGRect) -> LayoutCoordinator {
        GridLayoutCoordinator(
            xOffsetCalculator: xOffsetCalculator.reframed(rect.width),
            yOffsetCalculator: yOffsetCalculator.reframed(rect.height))
    }
}

// MARK: ----- GRID CALCULATOR PROTOCOLS

private protocol OffsetForIndexCalculator {
    
    var indexCount: Int {get}
    func offsetFor(index: Int) -> CGFloat
    func reframed(_ size: CGFloat) -> OffsetForIndexCalculator
}

// MARK: ----- EQUIDISTANT OFFSET FOR INDEX

private struct EquidistantOffsetForIndexCalculator: OffsetForIndexCalculator {
    
    private let numSlices: Int
    private let offsetPerIndex: CGFloat
    
    init(_ size: CGFloat, numSlices: Int) {
        self.numSlices = numSlices
        self.offsetPerIndex = size / numSlices.asCGFloat
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
    private let size: CGFloat
    
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
            xOffsetCalculator: xOffsetCalculator,
            yOffsetCalculator: yOffsetCalculator)
        
        return LayoutGuide(coordinator, rect: rect, origin: calcOrigin(in: rect, origin: origin))
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
    static func grid<T: UINumericType>(_ rect: CGRect, columns: [T], rows: Int, origin: UnitPoint = .topLeading) -> LayoutGuide {
        let xOffsetCalculator = RelativeOffsetForIndexCalculator(rect.width, slices: columns.map {$0.asCGFloat})
        let yOffsetCalculator = EquidistantOffsetForIndexCalculator(rect.height, numSlices: rows)

        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
    
    /**
     Equidistant x and relative y
     */
    static func grid<T: UINumericType>(_ rect: CGRect, columns: Int, rows: [T], origin: UnitPoint = .topLeading) -> LayoutGuide {
      
        let xOffsetCalculator = EquidistantOffsetForIndexCalculator(rect.width, numSlices: columns)
        let yOffsetCalculator = RelativeOffsetForIndexCalculator(rect.height, slices: rows.map {$0.asCGFloat})

        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
    
    /**
     Relative x and y
     */
    static func grid<TX: UINumericType, TY: UINumericType>(_ rect: CGRect, columns: [TX], rows: [TY], origin: UnitPoint = .topLeading) -> LayoutGuide {
        
        let xOffsetCalculator = RelativeOffsetForIndexCalculator(rect.width, slices: columns.map {$0.asCGFloat})
        let yOffsetCalculator = RelativeOffsetForIndexCalculator(rect.height, slices: rows.map {$0.asCGFloat})
        
        return gridLayout(xOffsetCalculator: xOffsetCalculator, yOffsetCalculator: yOffsetCalculator, rect: rect, origin: origin)
    }
}
