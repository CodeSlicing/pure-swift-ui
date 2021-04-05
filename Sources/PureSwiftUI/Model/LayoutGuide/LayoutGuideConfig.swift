//
//  LayoutGuideConfig.swift
//  
//
//  Created by Adam Fordyce on 04/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import Foundation

public struct LayoutGuideConfig: Shape {
 
    fileprivate let layoutProvider: (CGRect) -> LayoutGuide
    fileprivate let layoutPathProvider: (LayoutGuide, CGRect) -> Path
    
    public func path(in rect: CGRect) -> Path {
        let layout = layoutProvider(rect)
        return layoutPathProvider(layout, rect)
    }
    
    public func layout(in rect: CGRect) -> LayoutGuide {
        layoutProvider(rect)
    }
}

// MARK: ----- ROTATED

public extension LayoutGuideConfig {

    func rotated(_ angle: Angle, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        rotated(angle, anchor: anchor, factor: 1)
    }

    func rotated(_ angle: Angle, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).rotated(angle, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
}

// MARK: ----- ROTATED FROM TO

public extension LayoutGuideConfig {
    
    func rotated(from: Angle, to: Angle, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).rotated(from: from, to: to, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
}

// MARK: ----- OFFSET

public extension LayoutGuideConfig {
    
    func offset(_ offset: CGPoint) -> LayoutGuideConfig {
        self.offset(offset, factor: 1)
    }
    
    func offset(_ offset: CGFloat) -> LayoutGuideConfig {
        self.offset(.point(offset))
    }
    
    func offset(_ offset: CGPoint, factor: CGFloat) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).offset(offset, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func offset(_ offset: CGFloat, factor: CGFloat) -> LayoutGuideConfig {
        self.offset(.point(offset), factor: factor)
    }
}

// MARK: ----- OFFSET FROM TO

public extension LayoutGuideConfig {
    
    func offset(from: CGPoint, to: CGPoint, factor: CGFloat) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).offset(from: from, to: to, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func offset(from: CGSize, to: CGSize, factor: CGFloat) -> LayoutGuideConfig {
        offset(from: from.asCGPoint, to: to.asCGPoint, factor: factor)
    }
}

// MARK: ----- OFFSET IN X

public extension LayoutGuideConfig {
    
    func xOffset(_ x: CGFloat) -> LayoutGuideConfig {
        xOffset(x, factor: 1)
    }
    
    func xOffset(_ x: CGFloat, factor: CGFloat) -> LayoutGuideConfig {
        offset(.x(x), factor: factor)
    }
}

// MARK: ----- OFFSET IN X FROM TO

public extension LayoutGuideConfig {
    
    func xOffset(from: CGFloat, to: CGFloat, factor: CGFloat) -> LayoutGuideConfig {
        let delta = to - from
        return offset(.x(from + delta * factor.asCGFloat))
    }
}

// MARK: ----- OFFSET IN Y

public extension LayoutGuideConfig {
    
    func yOffset(_ y: CGFloat) -> LayoutGuideConfig {
        yOffset(y, factor: 1)
    }
    
    func yOffset(_ y: CGFloat, factor: CGFloat) -> LayoutGuideConfig {
        offset(.y(y), factor: factor)
    }
}

// MARK: ----- OFFSET IN Y FROM TO

public extension LayoutGuideConfig {
    
    func yOffset(from: CGFloat, to: CGFloat, factor: CGFloat) -> LayoutGuideConfig {
        let delta = to - from
        return offset(.y(from + delta * factor.asCGFloat))
    }
}

// MARK: ----- SCALED

public extension LayoutGuideConfig {
    
    func scaled(_ scale: CGSize, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        scaled(scale, anchor: anchor, factor: 1)
    }
    
    func scaled(_ scale: CGFloat, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        scaled(.square(scale), anchor: anchor)
    }
    
    func scaled(_ scale: CGSize, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).scaled(scale, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func scaled(_ scale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        scaled(.square(scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- SCALED FROM TO

public extension LayoutGuideConfig {
        
    func scaled(from fromScale: CGSize, to toScale: CGSize, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).scaled(from: fromScale, to: toScale, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func scaled(from fromScale: CGFloat, to toScale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        scaled(from: .square(fromScale), to: .square(toScale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- XSCALED

public extension LayoutGuideConfig {
    
    func xScaled(_ scale: CGFloat, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        xScaled(scale, anchor: anchor, factor: 1)
    }
    
    func xScaled(_ scale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        scaled(.size(scale, 1), anchor: anchor, factor: factor)
    }
}

// MARK: ----- XSCALED FROM TO

public extension LayoutGuideConfig {
    
    func xScaled(from fromScale: CGFloat, to toScale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        scaled(from: .size(fromScale, 1), to: .size(toScale, 1), anchor: anchor, factor: factor)
    }
}

// MARK: ----- YSCALED

public extension LayoutGuideConfig {
    
    func yScaled(_ scale: CGFloat, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        yScaled(scale, anchor: anchor, factor: 1)
    }
    
    func yScaled(_ scale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        scaled(.size(1, scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- YSCALED FROM TO

public extension LayoutGuideConfig {
    
    func yScaled(from fromScale: CGFloat, to toScale: CGFloat, anchor: UnitPoint = .center, factor: CGFloat) -> LayoutGuideConfig {
        scaled(from: .size(1, fromScale), to: .size(1, toScale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- GRID CONFIGURATIONS

public extension LayoutGuideConfig {
    
    static func grid(columns: Int, rows: Int, origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.grid(rect, columns: columns, rows: rows, origin: origin)
        }, layoutPathProvider: gridLayoutPathProvider)
    }
    
    static func grid(columns: [CGFloat], rows: Int, origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.grid(rect, columns: columns, rows: rows, origin: origin)
        }, layoutPathProvider: gridLayoutPathProvider)
    }
    
    static func grid(columns: Int, rows: [CGFloat], origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.grid(rect, columns: columns, rows: rows, origin: origin)
        }, layoutPathProvider: gridLayoutPathProvider)
    }
    
    static func grid(columns: [CGFloat], rows: [CGFloat], origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.grid(rect, columns: columns, rows: rows, origin: origin)
        }, layoutPathProvider: gridLayoutPathProvider)
    }
}

// MARK: ----- POLAR CONFIGURATIONS

public extension LayoutGuideConfig {
    
    static func polar(rings: Int, segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }

    static func polar(rings: [CGFloat], segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }

    static func polar(rings: Int, segments: [CGFloat], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }
    
    static func polar(rings: [CGFloat], segments: [CGFloat], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }
}

private func gridLayoutPathProvider(_ gridLayout: LayoutGuide, rect: CGRect) -> Path {
    var path = Path()
    let layoutCopy = gridLayout
    
    for x in 0...gridLayout.xCount {
        for y in 0...gridLayout.yCount {

            path.line(from: layoutCopy[x, 0], to: layoutCopy[x, layoutCopy.yCount])
            path.line(from: layoutCopy[0, y], to: layoutCopy[layoutCopy.xCount, y])
        }
    }
    return path
}

private func polarLayoutPathProvider(_ gridLayout: LayoutGuide, rect: CGRect) -> Path {
    var path = Path()
    let layoutCopy = gridLayout
            
    for x in 0...gridLayout.xCount {
        path.ellipse(layoutCopy.origin, .square(layoutCopy.radiusTo(x, 0) * 2), anchor: .center)
    }

    let spokeLength = layoutCopy.radiusTo(gridLayout.xCount, 0)
    for y in 0..<gridLayout.yCount {
        path.line(at: layoutCopy.origin, length: spokeLength, angle: layoutCopy.angleTo(gridLayout.xCount, y), anchor: .topLeading)
    }
    return path
}
