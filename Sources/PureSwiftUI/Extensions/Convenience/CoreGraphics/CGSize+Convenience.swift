//
//  CGSize+Convenience.swift
//
//  Created by Adam Fordyce on 25/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    
    init<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) {
        self.init(width.asCGFloat, height.asCGFloat)
    }
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
    
    var asCGPoint: CGPoint {
        CGPoint(width, height)
    }
    
    var x: CGFloat {
        width
    }
    
    var y: CGFloat {
        height
    }
    
    var midX: CGFloat {
        width / 2
    }

    var midY: CGFloat {
        height / 2
    }
    
    func scaled<T: UINumericType>(_ scale: T) -> CGSize {
        .init(widthScaled(scale), heightScaled(scale))
    }
    
    func widthScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        width * scale.asCGFloat
    }
    
    func heightScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        height * scale.asCGFloat
    }
    
    func clamped(from: CGFloat, to: CGFloat) -> CGSize {
        .init(self.width.clamped(from: from, to: to), self.height.clamped(from: from, to: to))
    }
}

// MARK: ----- OPERATOR OVERLOADS

public extension CGSize {
    static func -(lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(lhs.width - rhs.width, lhs.height - rhs.height)
    }
    
    static func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(lhs.width + rhs.width, lhs.height + rhs.height)
    }
}
