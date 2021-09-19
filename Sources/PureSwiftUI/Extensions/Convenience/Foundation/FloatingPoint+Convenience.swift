//
//  FloatingPoint+Convenience.swift
//  
//
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension FloatingPoint {
    
    var isPositive: Bool {
        self >= 0
    }
    
    var isNegative: Bool {
        !isPositive
    }
    
    var clampedPositive: Self {
        return isPositive ? self : 0
    }
    
    var clampedNegative: Self {
        return isPositive ? 0 : self
    }
    
    @available(*, deprecated, renamed: "clamped(max:abs:)")
    func clamped(to: Self, spanZero: Bool = false) -> Self {
        self.clamped(max: to, abs: spanZero)
    }
}


