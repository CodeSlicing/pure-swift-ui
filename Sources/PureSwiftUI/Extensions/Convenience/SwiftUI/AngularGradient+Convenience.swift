//
//  AngularGradient+Convenience.swift
//
//
//  Created by Adam Fordyce on 03/08/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

public extension AngularGradient {
    
    init(_ colors: [Color], center: UnitPoint = .center, startAngle: Angle, endAngle: Angle) {
        self.init(gradient: Gradient(colors), center: center, startAngle: startAngle, endAngle: endAngle)
    }

    init(_ colors: [Color], center: UnitPoint = .center, angle: Angle = .trailing) {
        self.init(gradient: Gradient(colors), center: center, angle: angle)
    }

    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, startAngle: Angle, endAngle: Angle) {
        self.init(gradient: Gradient(stops), center: center, startAngle: startAngle, endAngle: endAngle)
    }

    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, angle: Angle = .trailing) {
        self.init(gradient: Gradient(stops), center: center, angle: angle)
    }
    
    init(_ gradient: Gradient, center: UnitPoint = .center, startAngle: Angle, endAngle: Angle) {
        self.init(gradient: gradient, center: center, startAngle: startAngle, endAngle: endAngle)
    }

    init(_ gradient: Gradient, center: UnitPoint = .center, angle: Angle = .trailing) {
        self.init(gradient: gradient, center: center, angle: angle)
    }
    
    // from top angle versions
    
    init(_ colors: [Color], center: UnitPoint = .center, startAngleFromTop: Angle, endAngleFromTop: Angle) {
        self.init(gradient: Gradient(colors), center: center, startAngle: offsetAsAngleFromTop(startAngleFromTop), endAngle: offsetAsAngleFromTop(endAngleFromTop))
    }

    init(_ colors: [Color], center: UnitPoint = .center, angleFromTop: Angle) {
        self.init(gradient: Gradient(colors), center: center, angle: offsetAsAngleFromTop(angleFromTop))
    }
    
    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, startAngleFromTop: Angle, endAngleFromTop: Angle) {
        self.init(gradient: Gradient(stops), center: center, startAngle: offsetAsAngleFromTop(startAngleFromTop), endAngle: offsetAsAngleFromTop(endAngleFromTop))
    }

    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, angleFromTop: Angle) {
        self.init(gradient: Gradient(stops), center: center, angle: offsetAsAngleFromTop(angleFromTop))
    }
    
    init(_ gradient: Gradient, center: UnitPoint = .center, startAngleFromTop: Angle, endAngleFromTop: Angle) {
        self.init(gradient: gradient, center: center, startAngle: offsetAsAngleFromTop(startAngleFromTop), endAngle: offsetAsAngleFromTop(endAngleFromTop))
    }

    init(_ gradient: Gradient, center: UnitPoint = .center, angleFromTop: Angle) {
        self.init(gradient: gradient, center: center, angle: offsetAsAngleFromTop(angleFromTop))
    }
    
    // unavailable methods
    
    @available(*, unavailable, renamed: "init(_:center:startAngleFromTop:endAngleFromTop:)")
    init(_ colors: [Color], center: UnitPoint = .center, from: Angle, to: Angle) {
        self.init(gradient: Gradient(colors), center: center, startAngle: offsetAsAngleFromTop(from), endAngle: offsetAsAngleFromTop(to))
    }
    
    @available(*, unavailable, renamed: "init(_:center:startAngleFromTop:endAngleFromTop:)")
    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, from: Angle, to: Angle) {
        self.init(gradient: Gradient(stops), center: center, startAngle: offsetAsAngleFromTop(from), endAngle: offsetAsAngleFromTop(to))
    }

    @available(*, unavailable, renamed: "init(_:center:startAngleFromTop:endAngleFromTop:)")
    init(_ gradient: Gradient, center: UnitPoint = .center, from: Angle, to: Angle) {
        self.init(gradient: gradient, center: center, startAngle: offsetAsAngleFromTop(from), endAngle: offsetAsAngleFromTop(to))
    }
}
