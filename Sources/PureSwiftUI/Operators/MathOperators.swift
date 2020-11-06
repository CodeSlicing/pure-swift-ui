//
//  MathOperators.swift
//
//  Created by Adam Fordyce on 14/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

infix operator **

//native
public func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

public func **(lhs: CGFloat, rhs: CGFloat) -> CGFloat {
    return pow(lhs.asDouble, rhs.asDouble).asCGFloat
}
