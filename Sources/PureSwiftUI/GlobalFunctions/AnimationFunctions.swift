//
//  AnimationFunctions.swift
//
//  Created by Adam Fordyce on 06/04/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

public func withAnimationIf<Result>(_ condition: Bool, _ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if condition {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

public func withAnimationIfNot<Result>(_ condition: Bool, _ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    try withAnimationIf(!condition, animation, body)
}
