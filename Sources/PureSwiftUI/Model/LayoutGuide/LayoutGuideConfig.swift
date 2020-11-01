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
        rotated(angle, anchor: anchor, factor: 1.asCGFloat)
    }

    func rotated<T: UINumericType>(_ angle: Angle, anchor: UnitPoint = .center, factor: T) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).rotated(angle, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
}

// MARK: ----- ROTATED FROM TO

public extension LayoutGuideConfig {
    
    func rotated<T: UINumericType>(from: Angle, to: Angle, anchor: UnitPoint = .center, factor: T) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).rotated(from: from, to: to, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
}

// MARK: ----- OFFSET

public extension LayoutGuideConfig {
    
    func offset(_ offset: CGPoint) -> LayoutGuideConfig {
        self.offset(offset, factor: 1.asCGFloat)
    }
    
    func offset<T: UINumericType>(_ offset: T) -> LayoutGuideConfig {
        self.offset(.point(offset))
    }
    
    func offset<T: UINumericType>(_ offset: CGPoint, factor: T) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).offset(offset, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func offset<TS: UINumericType, TF: UINumericType>(_ offset: TS, factor: TF) -> LayoutGuideConfig {
        self.offset(.point(offset), factor: factor)
    }
}

// MARK: ----- OFFSET FROM TO

public extension LayoutGuideConfig {
    
    func offset<T: UINumericType>(from: CGPoint, to: CGPoint, factor: T) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).offset(from: from, to: to, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func offset<TFS: UINumericType, TTS: UINumericType, TF: UINumericType>(from: TFS, to: TTS, factor: TF) -> LayoutGuideConfig {
        self.offset(from: .point(from), to: .point(to), factor: factor)
    }
}

// MARK: ----- OFFSET IN X

public extension LayoutGuideConfig {
    
    func xOffset<T: UINumericType>(_ x: T) -> LayoutGuideConfig {
        xOffset(x, factor: 1)
    }
    
    func xOffset<TX: UINumericType, TF: UINumericType>(_ x: TX, factor: TF) -> LayoutGuideConfig {
        offset(.x(x), factor: factor)
    }
}

// MARK: ----- OFFSET IN X FROM TO

public extension LayoutGuideConfig {
    
    func xOffset<TFX: UINumericType, TTX: UINumericType, TF: UINumericType>(from: TFX, to: TTX, factor: TF) -> LayoutGuideConfig {
        let delta = to - from
        return offset(.x(from + delta * factor))
    }
}

// MARK: ----- OFFSET IN Y

public extension LayoutGuideConfig {
    
    func yOffset<T: UINumericType>(_ y: T) -> LayoutGuideConfig {
        yOffset(y, factor: 1)
    }
    
    func yOffset<TX: UINumericType, TF: UINumericType>(_ y: TX, factor: TF) -> LayoutGuideConfig {
        offset(.y(y), factor: factor)
    }
}

// MARK: ----- OFFSET IN Y FROM TO

public extension LayoutGuideConfig {
    
    func yOffset<TFX: UINumericType, TTX: UINumericType, TF: UINumericType>(from: TFX, to: TTX, factor: TF) -> LayoutGuideConfig {
        let delta = to - from
        return offset(.y(from + delta * factor))
    }
}

// MARK: ----- SCALED

public extension LayoutGuideConfig {
    
    func scaled(_ scale: CGSize, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        scaled(scale, anchor: anchor, factor: 1.asCGFloat)
    }
    
    func scaled<T: UINumericType>(_ scale: T, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        scaled(.square(scale), anchor: anchor)
    }
    
    func scaled<T: UINumericType>(_ scale: CGSize, anchor: UnitPoint = .center, factor: T) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).scaled(scale, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func scaled<TS: UINumericType, TF: UINumericType>(_ scale: TS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuideConfig {
        scaled(.square(scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- SCALED FROM TO

public extension LayoutGuideConfig {
        
    func scaled<T: UINumericType>(from fromScale: CGSize, to toScale: CGSize, anchor: UnitPoint = .center, factor: T) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            self.layoutProvider(rect).scaled(from: fromScale, to: toScale, anchor: anchor, factor: factor)
        }, layoutPathProvider: self.layoutPathProvider)
    }
    
    func scaled<TFS: UINumericType, TTS: UINumericType, TF: UINumericType>(from fromScale: TFS, to toScale: TTS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuideConfig {
        scaled(from: .square(fromScale), to: .square(toScale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- XSCALED

public extension LayoutGuideConfig {
    
    func xScaled<T: UINumericType>(_ scale: T, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        xScaled(scale, anchor: anchor, factor: 1)
    }
    
    func xScaled<TS: UINumericType, TF: UINumericType>(_ scale: TS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuideConfig {
        scaled(.size(scale, 1), anchor: anchor, factor: factor)
    }
}

// MARK: ----- XSCALED FROM TO

public extension LayoutGuideConfig {
    
    func xScaled<TFS: UINumericType, TTS: UINumericType, TF: UINumericType>(from fromScale: TFS, to toScale: TTS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuideConfig {
        scaled(from: .size(fromScale, 1), to: .size(toScale, 1), anchor: anchor, factor: factor)
    }
}

// MARK: ----- YSCALED

public extension LayoutGuideConfig {
    
    func yScaled<T: UINumericType>(_ scale: T, anchor: UnitPoint = .center) -> LayoutGuideConfig {
        yScaled(scale, anchor: anchor, factor: 1)
    }
    
    func yScaled<TS: UINumericType, TF: UINumericType>(_ scale: TS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuideConfig {
        scaled(.size(1, scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- YSCALED FROM TO

public extension LayoutGuideConfig {
    
    func yScaled<TFS: UINumericType, TTS: UINumericType, TF: UINumericType>(from fromScale: TFS, to toScale: TTS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuideConfig {
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
    
    static func grid<T: UINumericType>(columns: [T], rows: Int, origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.grid(rect, columns: columns, rows: rows, origin: origin)
        }, layoutPathProvider: gridLayoutPathProvider)
    }
    
    static func grid<T: UINumericType>(columns: Int, rows: [T], origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.grid(rect, columns: columns, rows: rows, origin: origin)
        }, layoutPathProvider: gridLayoutPathProvider)
    }
    
    static func grid<TX: UINumericType, TY: UINumericType>(columns: [TX], rows: [TY], origin: UnitPoint = .topLeading) -> LayoutGuideConfig {
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

    static func polar<T: UINumericType>(rings: [T], segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }

    static func polar<T: UINumericType>(rings: Int, segments: [T], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }
    
    static func polar<TX: UINumericType, TY: UINumericType>(rings: [TX], segments: [TY], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuideConfig {
        LayoutGuideConfig(layoutProvider: { rect in
            LayoutGuide.polar(rect, rings: rings, segments: segments, useMaxDimension: useMaxDimension, origin: origin)
        }, layoutPathProvider: polarLayoutPathProvider)
    }
}

private func gridLayoutPathProvider(_ gridLayout: LayoutGuide, rect: CGRect) -> Path {
    var path = Path()
    var layoutCopy = gridLayout
    
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
    var layoutCopy = gridLayout
            
    for x in 0...gridLayout.xCount {
        path.ellipse(layoutCopy.origin, .square(layoutCopy.radiusTo(x, 0) * 2), anchor: .center)
    }

    let spokeLength = layoutCopy.radiusTo(gridLayout.xCount, 0)
    for y in 0..<gridLayout.yCount {
        path.line(at: layoutCopy.origin, length: spokeLength, angle: layoutCopy.angleTo(gridLayout.xCount, y), anchor: .topLeading)
    }
    return path
}
