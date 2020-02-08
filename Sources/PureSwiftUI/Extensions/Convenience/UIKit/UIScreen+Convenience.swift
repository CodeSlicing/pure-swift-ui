//
//  UIScreen+Convenience.swift
//  
//
//  Created by Adam Fordyce on 18/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    static func mainOrigin() -> CGPoint {
        main.origin
    }
    
    static func mainCenter() -> CGPoint {
        main.center
    }
    
    static func mainWidthScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        main.widthScaled(scale)
    }

    static func mainHeightScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        main.heightScaled(scale)
    }

    static var mainWidth: CGFloat {
        main.width
    }

    static var mainHeight: CGFloat {
        main.height
    }
    
    static var mainMidX: CGFloat {
        main.midX
    }

    static var mainMidY: CGFloat {
        main.midY
    }

    static var mainMinX: CGFloat {
        main.minX
    }

    static var mainMinY: CGFloat {
        main.minY
    }
    
    static var mainMaxX: CGFloat {
        main.maxX
    }

    static var mainMaxY: CGFloat {
        main.maxY
    }
    
    static func mainSizeScaled<T: UINumericType>(_ scale: T) -> CGSize {
        main.size.scaled(scale)
    }
    
    static var mainSize: CGSize {
        main.size
    }

    func widthScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        width * scale.asCGFloat
    }
    
    func heightScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        height * scale.asCGFloat
    }
    
    var origin: CGPoint {
        bounds.origin
    }
    
    var center: CGPoint {
        bounds.center
    }
    
    var width: CGFloat {
        bounds.width
    }
    
    var height: CGFloat {
        bounds.height
    }
    
    var size: CGSize {
        bounds.size
    }
    
    var midX: CGFloat {
        bounds.midX
    }
    
    var midY: CGFloat {
        bounds.midY
    }
    
    var minX: CGFloat {
        bounds.origin.x
    }
    
    var minY: CGFloat {
        bounds.origin.y
    }
    
    var maxX: CGFloat {
        bounds.maxX
    }
    
    var maxY: CGFloat {
        bounds.maxY
    }
}
