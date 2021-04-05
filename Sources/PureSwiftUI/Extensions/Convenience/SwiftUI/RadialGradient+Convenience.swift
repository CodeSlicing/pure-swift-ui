//
//  RadialGradient.swift
//
//
//  Created by Adam Fordyce on 03/08/2020.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import Foundation

public extension RadialGradient {
    
    init(_ colors: [Color], center: UnitPoint = .center, from: CGFloat, to: CGFloat) {
        self.init(gradient: Gradient(colors), center: center, startRadius: from, endRadius: to)
    }
    
    init(_ stops: [GradientStopComponents], center: UnitPoint = .center, from: CGFloat, to: CGFloat) {
        self.init(gradient: Gradient(stops), center: center, startRadius: from, endRadius: to)
    }
    
    init(_ gradient: Gradient, center: UnitPoint = .center, from: CGFloat, to: CGFloat) {
        self.init(gradient: gradient, center: center, startRadius: from, endRadius: to)
    }
}
