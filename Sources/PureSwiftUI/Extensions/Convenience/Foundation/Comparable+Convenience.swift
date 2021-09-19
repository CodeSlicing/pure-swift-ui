//
//  Comparable+Convenience.swift
//  
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension Comparable {
    
    func clamped(min: Self) -> Self {
        clamped(min: min, max: self)
    }
    
    func clamped(max: Self) -> Self {
        clamped(min: self, max: max)
    }
    
    func clamped(max: Self, abs clampAbsoluteValue: Bool) -> Self where Self: SignedNumeric {
        if clampAbsoluteValue {
            return clamped(min: -abs(max), max: abs(max))
        } else {
            return clamped(max: max)
        }
    }

    func clamped(min: Self, max: Self) -> Self {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
    
    @available(*, deprecated, renamed: "clamped(min:max:)")
    func clamped(from: Self, to: Self) -> Self {
        if (self > to) {
            return to
        } else if (self < from) {
            return from
        }
        return self
    }
}
