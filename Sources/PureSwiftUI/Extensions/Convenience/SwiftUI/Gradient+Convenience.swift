//
//  Gradient+Convenience.swift
//
//
//  Created by Adam Fordyce on 03/08/2020.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public typealias GradientStopComponents = (color: Color, location: Double)

private func convertToStop(_ gradientStopComponents: GradientStopComponents) -> Gradient.Stop {
    .init(color: gradientStopComponents.color, location: CGFloat(gradientStopComponents.location))
}

public extension Gradient {
    
    init(_ colors: [Color]) {
        self.init(colors: colors)
    }
    
    init(_ stops: [GradientStopComponents]) {
        self.init(stops: stops.map({convertToStop($0)}))
    }
}
