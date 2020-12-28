//
//  LinearGradient+Convenience.swift
//  
//  Created by Adam Fordyce on 17/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension LinearGradient {
    
    init(_ colors: [Color], from: UnitPoint, to: UnitPoint) {
        self.init(gradient: Gradient(colors), startPoint: from, endPoint: to)
    }
    
    init(_ colors: [Color], to: UnitPoint) {
        self.init(colors, from: to.inverted(), to: to)
    }
    
    init(_ colors: [Color], from: UnitPoint) {
        self.init(colors, from: from, to: from.inverted())
    }
    
    init(_ colors: [Color], angle: Angle) {
        self.init(colors, to: angle.asUnitPoint)
    }
}

public extension LinearGradient {
    
    init(_ stops: [GradientStopComponents], from: UnitPoint, to: UnitPoint) {
        self.init(gradient: Gradient(stops), startPoint: from, endPoint: to)
    }
    
    init(_ stops: [GradientStopComponents], to: UnitPoint) {
        self.init(stops, from: to.inverted(), to: to)
    }
    
    init(_ stops: [GradientStopComponents], from: UnitPoint) {
        self.init(stops, from: from, to: from.inverted())
    }
    
    init(_ stops: [GradientStopComponents], angle: Angle) {
        let to = angle.asUnitPoint
        self.init(stops, to: to)
    }
}
