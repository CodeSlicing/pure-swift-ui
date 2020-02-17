//
//  UnitPoint+Convenience.swift
//  
//
//  Created by Adam Fordyce on 13/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import Foundation

public extension UnitPoint {
    
    init<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        self.init(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    var asCGPoint: CGPoint {
        return CGPoint(x, y)
    }
}
