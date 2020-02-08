//
//  LayoutGuideConfig.swift
//  
//
//  Created by Adam Fordyce on 04/02/2020.
//

import Foundation

public struct LayoutGuideConfig: Shape {
 
    let layoutProvider: (CGRect) -> LayoutGuide
    let layoutPathProvider: (LayoutGuide, CGRect) -> Path
    
    public func path(in rect: CGRect) -> Path {
        let layout = layoutProvider(rect)
        return layoutPathProvider(layout, rect)
    }
    
    public func layout(in rect: CGRect) -> LayoutGuide {
        layoutProvider(rect)
    }
}

// MARK: ----- PLANE CONFIGURATIONS

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
    
    path.rect(rect)

    for x in 0...gridLayout.xCount {
        for y in 0...gridLayout.yCount {

            path.vLine(at: layoutCopy[x, 0], length: rect.height, anchor: .top)
            path.hLine(at: layoutCopy[0, y], length: rect.width, anchor: .leading)
        }
    }
    return path
}

private func polarLayoutPathProvider(_ gridLayout: LayoutGuide, rect: CGRect) -> Path {
    var path = Path()
    var layoutCopy = gridLayout
            
    for x in 0...gridLayout.xCount {
        path.ellipse(layoutCopy.origin, .square(layoutCopy.radius(x, 0) * 2), anchor: .center)
    }

    let spokeLength = layoutCopy.radius(gridLayout.xCount, 0)
    for y in 0..<gridLayout.yCount {
        path.line(at: layoutCopy.origin, length: spokeLength, angle: layoutCopy.angle(gridLayout.xCount, y), anchor: .topLeading)
    }
    return path
}
