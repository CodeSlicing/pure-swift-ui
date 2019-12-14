//
//  Float+Convenience.swift
//
//  Created by Adam Fordyce on 01/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public extension Float {
    
    func random() -> Float {
        self * Float.random(in: 0...1)
    }
}
