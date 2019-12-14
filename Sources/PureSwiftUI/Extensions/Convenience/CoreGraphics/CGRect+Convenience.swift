//
//  CGRect+Convenience.swift
//  
//
//  Created by Adam Fordyce on 11/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    
    init<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) {
        self.init(width.asCGFloat, height.asCGFloat)
    }
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(0, 0, x, y)
    }
    
    init<TX: UINumericType, TY: UINumericType, TW: UINumericType, TH: UINumericType>(_ x: TX, _ y: TY, _ width: TW, _ height: TH) {
        self.init(x.asCGFloat, y.asCGFloat, width.asCGFloat, height.asCGFloat)
    }
    
    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(origin: CGPoint(x, y), size: CGSize(w, h))
    }
    
    var center: CGPoint {
        .init(width / 2 + origin.x, height / 2 + origin.y)
    }
    
    func clamped<T_FROM: UINumericType, T_TO: UINumericType>(from: T_FROM, to: T_TO) -> CGSize {
        clamped(from: from.asCGFloat, to: to.asCGFloat)
    }
    
    func clamped(from: CGFloat, to: CGFloat) -> CGSize {
        .init(self.width.clamped(from: from, to: to), self.height.clamped(from: from, to: to))
    }
}
