//
//  MathOperators.swift
//
//  Created by Adam Fordyce on 14/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

infix operator **

public func **<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return pow(lhs.asDouble, rhs.asDouble)
}

//native
public func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

public func +<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble + rhs.asDouble
}

public func -<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble - rhs.asDouble
}

public func *<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble * rhs.asDouble
}

public func /<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble / rhs.asDouble
}
