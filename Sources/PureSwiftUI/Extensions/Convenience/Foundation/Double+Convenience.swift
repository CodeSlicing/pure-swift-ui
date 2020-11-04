//
//  Double+Convenience.swift
//
//  Created by Adam Fordyce on 23/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public extension Double {
    
    func random() -> Double {
        self * Double.random(in: 0...1)
    }
}

//// MARK: ----- CONVERSIONS
//
//public extension Double {
//                  
//    var asCGFloat: CGFloat {
//        CGFloat(self)
//    }
//    
//    var asFloat: Float {
//        Float(self)
//    }
//    
//    var asInt: Int {
//        Int(self)
//    }
//    
//    var asDouble: Double {
//        self
//    }
//}
