//
//  CGFloat+Convenience.swift
//
//  Created by Adam Fordyce on 24/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public extension CGFloat {
    
    func random() -> CGFloat {
        self * CGFloat.random(in: 0...1)
    }
}

// MARK: ----- TO WITH FACTOR

public extension CGFloat {

    func to(_ destination: CGFloat, _ factor: CGFloat) -> CGFloat {
        CGFloat(self + (destination - self) * factor)
    }
}
