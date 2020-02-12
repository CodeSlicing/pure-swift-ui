//
//  PolarLayout.swift
//
//  Created by Adam Fordyce on 03/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

private struct PolarLayoutCoordinator: LayoutCoordinator {

    private let radiusCalculator: RadiusForRingCalculator
    private let angleCalculator: AngleForSegmentCalculator
    
    init(radiusCalculator: RadiusForRingCalculator, angleCalculator: AngleForSegmentCalculator) {
        self.radiusCalculator = radiusCalculator
        self.angleCalculator = angleCalculator
    }
    
    public subscript(origin: CGPoint, ringIndex: Int, segmentIndex: Int) -> CGPoint {
        return origin.offset(
            radius: radiusCalculator.radiusFor(ringIndex: ringIndex),
            angle: angleCalculator.angleFor(segmentIndex: segmentIndex))
    }
    
    public var xCount: Int {
        radiusCalculator.ringCount
    }
    
    public var yCount: Int {
        angleCalculator.segmentCount
    }
    
    public func reframed(_ rect: CGRect) -> LayoutCoordinator {
        PolarLayoutCoordinator(
            radiusCalculator: radiusCalculator.reframed(rect),
            angleCalculator: angleCalculator.reframed(rect))
    }
}

// MARK: ----- POLAR CALCULATOR PROTOCOLS

private protocol RadiusForRingCalculator {
    
    var ringCount: Int {get}
    func radiusFor(ringIndex: Int) -> CGFloat
    func reframed(_ rect: CGRect) -> RadiusForRingCalculator
}

private protocol AngleForSegmentCalculator {
    
    var segmentCount: Int {get}
    func angleFor(segmentIndex: Int) -> Angle
    func reframed(_ rect: CGRect) -> AngleForSegmentCalculator
}

private struct EquidistantRadiusForRingCalculator: RadiusForRingCalculator {

    private typealias Config = (rings: Int, useMaxDimension: Bool)
    
    private let config: Config
    private let radiusStep: CGFloat

    init(_ rect: CGRect, rings: Int, useMaxDimension: Bool = false) {
        self.init(rect, config: (rings, useMaxDimension))
    }
    
    private init(_ rect: CGRect, config: Config) {
        self.config = config
        let radius = (config.useMaxDimension ? rect.maxDimension : rect.minDimension) / 2
        self.radiusStep = radius / config.rings.asCGFloat
    }

    var ringCount: Int {
        config.rings
    }
    
    func radiusFor(ringIndex: Int) -> CGFloat {
        radiusStep * ringIndex.asCGFloat
    }
    
    func reframed(_ rect: CGRect) -> RadiusForRingCalculator {
        EquidistantRadiusForRingCalculator(rect, config: config)
    }
}

private struct RelativeRadiusForRingCalculator: RadiusForRingCalculator {
    
    private typealias Config = (rings: [CGFloat], useMaxDimension: Bool)
    
    private let config: Config
    private let radiusSteps: [CGFloat]
    private let radius: CGFloat
    
    init(_ rect: CGRect, rings: [CGFloat], useMaxDimension: Bool = false) {
        self.init(rect, config: (rings, useMaxDimension))
    }
    
    private init(_ rect: CGRect, config: Config) {
        var radiusSteps: [CGFloat] = []
        for ring in config.rings {
            radiusSteps.append(ring.asCGFloat)
        }
        self.config = config
        self.radiusSteps = radiusSteps
        self.radius = (config.useMaxDimension ? rect.maxDimension : rect.minDimension) / 2
    }
    
    var ringCount: Int {
        config.rings.count
    }
    
    func radiusFor(ringIndex: Int) -> CGFloat {
        if ringIndex >= 0 && ringIndex < radiusSteps.count {
            return radius * radiusSteps[ringIndex]
        } else if ringIndex >= radiusSteps.count {
            return radius * (radiusSteps.last ?? 0)
        } else {
            return radius * (radiusSteps.first ?? 0)
        }
    }
    
    func reframed(_ rect: CGRect) -> RadiusForRingCalculator {
        RelativeRadiusForRingCalculator(rect, config: config)
    }
}

private struct EquidistantAngleForSegmentCalculator: AngleForSegmentCalculator {

    private let segments: Int
    private let segmentSize: Angle
    
    init(segments: Int) {
        self.segments = segments
        self.segmentSize = (360 / segments.asDouble).degrees
    }
    
    var segmentCount: Int {
        segments
    }
    
    func angleFor(segmentIndex: Int) -> Angle {
        segmentSize * segmentIndex
    }
    
    func reframed(_ rect: CGRect) -> AngleForSegmentCalculator {
        self
    }
}

private struct AbsoluteAngleForSegmentCalculator: AngleForSegmentCalculator {
    
    private let segments: [Angle]
    
    init(segments: [Angle]) {
        self.segments = segments
    }
    
    var segmentCount: Int {
        segments.count
    }
    
    func angleFor(segmentIndex: Int) -> Angle {
        if segmentIndex >= 0 && segmentIndex < segments.count {
            return segments[segmentIndex]
        } else if segmentIndex >= segments.count {
            return segments.last ?? 0.degrees
        } else {
            return segments.first ?? 0.degrees
        }
    }
    
    func reframed(_ rect: CGRect) -> AngleForSegmentCalculator {
        self
    }
}

// MARK: ----- LAYOUT EXTENSIONS FOR POLAR

public extension LayoutGuide {
    
    private static func polarLayout(radiusCalculator: RadiusForRingCalculator, angleCalculator: AngleForSegmentCalculator, rect: CGRect, origin: UnitPoint) -> LayoutGuide {
       
        let coordinator = PolarLayoutCoordinator(
            radiusCalculator: radiusCalculator,
            angleCalculator: angleCalculator)
        
        return LayoutGuide(coordinator, rect: rect, origin: calcOrigin(in: rect, origin: origin))
    }
    
    /**
     Equidistant rings and segments
     */
    static func polar(_ rect: CGRect, rings: Int, segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
        
        let radiusCalculator = EquidistantRadiusForRingCalculator(rect, rings: rings, useMaxDimension: useMaxDimension)
        let angleCalculator = EquidistantAngleForSegmentCalculator(segments: segments)
        
        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin)
    }
    
    /**
     Specified relative rings and equidistant segments
     */
    static func polar<T: UINumericType>(_ rect: CGRect, rings: [T], segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {

        let radiusCalculator = RelativeRadiusForRingCalculator(rect, rings: rings.map {$0.asCGFloat}, useMaxDimension: useMaxDimension)
        let angleCalculator = EquidistantAngleForSegmentCalculator(segments: segments)
        
        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin)
    }
    
    /**
     Equidistant rings and relative segments
     */
    static func polar<T: UINumericType>(_ rect: CGRect, rings: Int, segments: [T], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
        polar(rect, rings: rings, segments: segments.map { .cycle($0) }, useMaxDimension: useMaxDimension, origin: origin)
    }
    
    /**
     Equidistant rings and absolute segments
     */
    static func polar(_ rect: CGRect, rings: Int, segments: [Angle], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {

        let radiusCalculator = EquidistantRadiusForRingCalculator(rect, rings: rings, useMaxDimension: useMaxDimension)
        let angleCalculator = AbsoluteAngleForSegmentCalculator(segments: segments)

        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin)
    }
    
    /**
     Relative rings and relative segments
     */
    static func polar<TR: UINumericType, TS: UINumericType>(_ rect: CGRect, rings: [TR], segments: [TS], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
        polar(rect, rings: rings, segments: segments.map { .cycle($0) }, useMaxDimension: useMaxDimension, origin: origin)
    }

    /**
     Relative rings and relative segments
     */
    static func polar<TR: UINumericType>(_ rect: CGRect, rings: [TR], segments: [Angle], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
    
        let radiusCalculator = RelativeRadiusForRingCalculator(rect, rings: rings.map {$0.asCGFloat}, useMaxDimension: useMaxDimension)
        let angleCalculator = AbsoluteAngleForSegmentCalculator(segments: segments)

        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin)
    }
}
