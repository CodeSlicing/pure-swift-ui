//
//  Float+Convenience.swift
//
//  Created by Adam Fordyce on 01/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

// MARK: ----- PROPERTIES

public extension Float {
    
    var abs: Float {
        Swift.abs(self)
    }
}

public extension Float {
    
    func random() -> Float {
        self * Float.random(in: 0...1)
    }
}
