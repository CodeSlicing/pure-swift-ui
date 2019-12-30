//
//  GeometryFunctions.swift
//  
//
//  Created by Adam Fordyce on 28/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public func xFromAngle<T: UINumericType>(_ angle: Angle, forRadius radius: T) -> CGFloat {
    (angle.sin * radius.asDouble).asCGFloat
}

public func yFromAngle<T: UINumericType>(_ angle: Angle, forRadius radius: T) -> CGFloat {
    (angle.cos * radius.asDouble).asCGFloat
}

public func offsetFromAngle<T: UINumericType>(_ angle: Angle, forRadius radius: T) -> CGPoint {
    .init(xFromAngle(angle, forRadius: radius), yFromAngle(angle, forRadius: radius))
}
