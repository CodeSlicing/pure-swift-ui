//
//  UnitPoint+Convenience.swift
//  
//
//  Created by Adam Fordyce on 13/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import Foundation

public extension UnitPoint {
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
    
    var asCGPoint: CGPoint {
        return CGPoint(x, y)
    }
    
    func inverted() -> UnitPoint {
        UnitPoint(1 - x, 1 - y)
    }
}

// MARK: ----- ANGLE CONVERSION

private let maxUnitRadius = sqrt(0.5 * 0.5 + 0.5 * 0.5)
private let centerPoint = CGPoint(0.5, 0.5)

private let angleForNamedUnitPoint: [UnitPoint: Angle] = [

    .topLeading: .topLeading,
    .top: .top,
    .topTrailing: .topTrailing,
    .trailing: .trailing,
    .bottomTrailing: .bottomTrailing,
    .bottom: .bottom,
    .bottomLeading: .bottomLeading,
    .leading: .leading,
]

public extension UnitPoint {
    
    var asAngle: Angle {
        if let angle = angleForNamedUnitPoint[self] {
            return angle
        } else {
            return centerPoint.angleTo(self.asCGPoint)
        }
    }
}
