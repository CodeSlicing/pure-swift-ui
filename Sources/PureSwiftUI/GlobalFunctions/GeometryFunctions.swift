//
//  GeometryFunctions.swift
//  
//
//  Created by Adam Fordyce on 28/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public func calcXOffset(radius: CGFloat, angle: Angle) -> CGFloat {
    (angle.sin * abs(radius.asDouble)).asCGFloat
}

public func calcYOffset(radius: CGFloat, angle: Angle) -> CGFloat {
    (angle.cos * abs(radius.asDouble) * -1).asCGFloat
}

public func calcOffset(radius: CGFloat, angle: Angle) -> CGPoint {
    let absRadius = abs(radius.asDouble)
    let xOffset: Double = absRadius * angle.sin
    let yOffset: Double = absRadius * angle.cos *  -1
    return CGPoint(xOffset.asCGFloat, yOffset.asCGFloat)
}
