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
//
//// MARK: ----- CONVERSIONS
//
//public extension Float {
//    
//    var asCGFloat: CGFloat {
//        CGFloat(self)
//    }
//    
//    var asDouble: Double {
//        Double(self)
//    }
//    
//    var asInt: Int {
//        Int(self)
//    }
//    
//    var asFloat: Float {
//        self
//    }
//}
