//
//  AngularGradient+Convenience.swift
//
//
//  Created by Adam Fordyce on 03/08/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

public extension AngularGradient {
    
    init(_ colors: [Color], center: UnitPoint = .center, from: Angle, to: Angle) {
        self.init(gradient: Gradient(colors), center: center, startAngle: adjustAngle(from), endAngle: adjustAngle(to))
    }

    init(_ colors: [Color], center: UnitPoint = .center, angle: Angle) {
        self.init(gradient: Gradient(colors), center: center, angle: adjustAngle(angle))
    }
    
    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, from: Angle, to: Angle) {
        self.init(gradient: Gradient(stops), center: center, startAngle: adjustAngle(from), endAngle: adjustAngle(to))
    }

    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, angle: Angle) {
        self.init(gradient: Gradient(stops), center: center, angle: adjustAngle(angle))
    }
}
